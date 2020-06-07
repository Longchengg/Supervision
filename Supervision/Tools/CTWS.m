//
//  CTWS.m
//  Supervision
//
//  Created by 龙成 on 2018/10/12.
//  Copyright © 2018 Supervision. All rights reserved.
//

#import "CTWS.h"
#import "AFNetworking.h"
#import <CommonCrypto/CommonDigest.h>

#import "BackModel.h"

NSString *const RESPONSE_CODE_SUCCESS = @"200";

static CTWS *instance;

@interface CTWS()

@property (nonatomic,copy) NSString *requestUrl;

@property (nonatomic,assign) BOOL isOnline;

@property (nonatomic,copy)NSDictionary *data;

//@property (nonatomic,strong) MBProgressHUD *hud;

@end


@implementation CTWS

+ (CTWS*) getDefault
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        instance = [[CTWS alloc]init];
        [instance AFNReachability];
    });
    
    return instance;
}


- (void)doPostWithUrl:(NSString *)url
               params:(NSDictionary *)params
              success:(void (^)(id))success
              failure:(void (^)(NSError *))failure
{
    
    if (!self.isOnline) {
        //  最好抽成一个分类
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"暂未开启网络权限，请打开APP网络权限" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            BackModel *model = [[BackModel alloc]init];
            model.status = @"2";
            model.errorMsg = @"网络错误";
            success(model);
        }];
        
        [alertVC addAction:cancelAction];
        
        UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
        if([rootViewController isKindOfClass:[UINavigationController class]]){
            rootViewController = ((UINavigationController *)rootViewController).viewControllers.firstObject;
            
        }
        if([rootViewController isKindOfClass:[UITabBarController class]]){
            rootViewController = ((UITabBarController *)rootViewController).selectedViewController;
            
        }
        [rootViewController presentViewController:alertVC animated:NO completion:nil];
        
        
        return;
    }
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
       
        MBProgressHUD *hud;
        if (!self.isHiddenHUDView) {
            UIViewController *VC  = [self currentViewController];
            
            hud = [MBProgressHUD showHUDAddedTo:VC.view animated:YES];
            
            [hud showAnimated:YES];
        }
        
        
        self.requestUrl = url;
        
        // 请求数据类实例化
        AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        // 超时时间
        manager.requestSerializer.timeoutInterval = 20;
        
        NSString *token = [CTUserDefaults token];
        if (token.length > 0) {
            [manager.requestSerializer setValue:token forHTTPHeaderField:@"Account-Token"];
        }
        
        NSDictionary *paramDict = params[@"param"];
        
        [manager POST:url parameters:paramDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (self.isHiddenHUDView) {
                self.isHiddenHUDView = NO;
            }
            [hud hideAnimated:YES];
            BackModel *model = [BackModel mj_objectWithKeyValues:responseObject];
                    
            success(model);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (self.isHiddenHUDView) {
                self.isHiddenHUDView = NO;
            }
            [hud hideAnimated:YES];
            
            // 失败后的处理
            NSLog(@"%@", error);
            if(error.code==-1009){
                
                failure(error);
            }else{
                
                failure(error);
                
            }
        }];
    });
    
}

- (void)postWithURLString:(NSString *)urlString
               parameters:(NSMutableDictionary *)parameters
                  success:(void (^)(id responseObject))success
                  failure:(void (^)(NSError *error))failure{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];

    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/plain", nil];

    //post 发送json格式数据的时候加上这两句
    // >>>>>>>>
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    // <<<<<<<<
    
    NSString *token = [CTUserDefaults token];
    if (token.length > 0) {
        [session.requestSerializer setValue:token forHTTPHeaderField:@"Account-Token"];
    }
    
    session.requestSerializer.timeoutInterval = 15;
    
    
    [session POST:urlString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            // 接口log
            NSLog(@"%@ 返回参数： --- %@",urlString, responseObject);
            BackModel *model = [BackModel mj_objectWithKeyValues:responseObject];
            NSLog(@"errorMsg********%@",model.errorMsg);
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            // 失败后的处理
            NSLog(@"%@", error);

            failure(error);
        }
    }];
}

- (void)getWithURLString:(NSString *)urlString
              parameters:(NSMutableDictionary *)parameters
                 success:(void (^)(id responseObject))success
                 failure:(void (^)(NSError *error))failure{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/plain", nil];
    
    //post 发送json格式数据的时候加上这两句
    // >>>>>>>>
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    // <<<<<<<<
    
    NSString *token = [CTUserDefaults token];
    if (token.length > 0) {
        [session.requestSerializer setValue:token forHTTPHeaderField:@"Account-Token"];
    }
    
    session.requestSerializer.timeoutInterval = 15;
    
    
    [session GET:urlString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            // 接口log
            NSLog(@"%@ 返回参数： --- %@",urlString, responseObject);
            BackModel *model = [BackModel mj_objectWithKeyValues:responseObject];
            NSLog(@"errorMsg********%@",model.errorMsg);
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            // 失败后的处理
            NSLog(@"%@", error);
            
            failure(error);
        }
    }];
}
- (void)reLoadRequest:(NSString *)url
            andParams:(NSDictionary *)Dict
              success:(void (^)(id responseObject))success
              failure:(void (^)(NSError *error))failure{
 
    [self doPostWithUrl:url params:Dict success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

- (void)upLoadImage:(NSString *)url
       andImageFile:(NSData *)imageData
            success:(void (^)(id responseObject))success
            failure:(void (^)(NSError *error))failure{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //ContentType设置
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"image/jpeg",@"image/png",@"application/octet-stream",@"text/json",nil];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.securityPolicy.validatesDomainName = NO;

    [manager POST:url parameters:@{} constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        //把image  转为data , POST上传只能传data
//        NSData *data = UIImagePNGRepresentation(image);
        //上传的参数(上传图片，以文件流的格式)
        [formData appendPartWithFileData:imageData
                                    name:@"file"
                                fileName:@"gauge.png"
                                mimeType:@"image/png"];
        
        
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //请求成功的block回调
        
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSLog(@"上传成功%@",dic);
        
        success(dic);

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"上传失败%@",error);
        failure(error);

    }];
}

- (void)AFNReachability
{
    //1.创建网络监听管理者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    //2.监听网络状态的改变
    /*
     AFNetworkReachabilityStatusUnknown          = 未知
     AFNetworkReachabilityStatusNotReachable     = 没有网络
     AFNetworkReachabilityStatusReachableViaWWAN = 3G
     AFNetworkReachabilityStatusReachableViaWiFi = WIFI
     */
    self.isOnline = YES;
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知");
                self.isOnline = NO;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
                self.isOnline = NO;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"4G");
                self.isOnline = YES;
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WIFI");
                self.isOnline = YES;
                break;
                
            default:
                break;
        }
    }];
    
    //3.开始监听
    [manager startMonitoring];
}

- (UIViewController *)currentViewController{
    
    

    
    UIViewController *VC = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    
    
    while (1) {
        
        if ([VC isKindOfClass:[UITabBarController class]]) {
            
            VC = ((UITabBarController*)VC).selectedViewController;
            
        }
        
        
        
        if ([VC isKindOfClass:[UINavigationController class]]) {
            
            VC = ((UINavigationController*)VC).visibleViewController;
            
        }
        
        
        
        if (VC.presentedViewController) {
            
            VC = VC.presentedViewController;
            
        }else{
            
            break;
            
        }
    }
    
    
    
    return VC;
}

@end
