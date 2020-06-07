//
//  HttpRequestTool.m
//  Supervision
//
//  Created by 龙成 on 2018/8/22.
//  Copyright © 2018年 Supervision. All rights reserved.
//

#import "HttpRequestTool.h"

#import "BackModel.h"

#import "CTWS.h"

@interface HttpRequestTool()

@property (nonatomic, assign) BOOL isConnectionSuccess;

@end

@implementation HttpRequestTool


/*+++++++++++++++++++++++++++++++++++++ 下面是网络请求方法 +++++++++++++++++++++++++++++++++++++*/


+ (void)GetLaywerUserList2:(NSString *)keyword
              successBlock:(void (^)(id responObject))successBlock
              failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param safeObject:keyword forKey:@"keyword"];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/user/login", HttpRequestURL];
    
    [[CTWS getDefault] doPostWithUrl:url params:param success:^(id responseObject) {
        
        
    } failure:^(id error) {
        failureBlock(@"网络错误");
    }];
}


+ (void)uersLogin:(NSString *)mobile
       verifyCode:(NSString *)verifyCode
     successBlock:(void (^)(id responObject))successBlock
     failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param safeObject:mobile forKey:@"mobile"];
    [param safeObject:verifyCode forKey:@"verifyCode"];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/user/login", HttpRequestURL];
    
     
    [[CTWS getDefault] postWithURLString:url parameters:param success:^(id responseObject) {
        
        if (responseObject) {
            BackModel *model = [BackModel mj_objectWithKeyValues:responseObject];
            
            if ([model.status isEqualToString:@"1"]) {
                successBlock(model.wrapper);
            }else{
                failureBlock(model.errorMsg);
            }
        }else{
            failureBlock(@"网络错误");
        }
    } failure:^(id error) {
        failureBlock(@"网络错误");
    }];
}

+ (void)sendCode:(NSString *)mobile
            type:(NSString *)type
    successBlock:(void (^)(id responObject))successBlock
    failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param safeObject:mobile forKey:@"mobile"];
    [param safeObject:type forKey:@"type"];
    
    NSString *url = [NSString stringWithFormat:@"%@/admin/sms/send", HttpRequestURL];
    
    
    [[CTWS getDefault] postWithURLString:url parameters:param success:^(id responseObject) {
        
        if (responseObject) {
            BackModel *model = [BackModel mj_objectWithKeyValues:responseObject];
            
            if ([model.status isEqualToString:@"1"]) {
                successBlock(model.wrapper);
            }else{
                failureBlock(model.errorMsg);
            }
        }else{
            failureBlock(@"网络错误");
        }
    } failure:^(id error) {
        failureBlock(@"网络错误");
    }];
}

+ (void)indexMessageSuccessBlock:(void (^)(id responObject))successBlock
                    failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/client_alert/index/message", HttpRequestURL];
    
    
    [[CTWS getDefault] getWithURLString:url parameters:param success:^(id responseObject) {
        
        if (responseObject) {
            BackModel *model = [BackModel mj_objectWithKeyValues:responseObject];
            
            if ([model.status isEqualToString:@"1"]) {
                successBlock(model.wrapper);
            }else{
                failureBlock(model.errorMsg);
            }
        }else{
            failureBlock(@"网络错误");
        }
    } failure:^(id error) {
        failureBlock(@"网络错误");
    }];
}

+ (void)cert_stasticSuccessBlock:(void (^)(id responObject))successBlock
                    failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/cert_stastic/license", HttpRequestURL];
    
    
    [[CTWS getDefault] postWithURLString:url parameters:param success:^(id responseObject) {
        
        if (responseObject) {
            BackModel *model = [BackModel mj_objectWithKeyValues:responseObject];
            
            if ([model.status isEqualToString:@"1"]) {
                successBlock(model.wrapper);
            }else{
                failureBlock(model.errorMsg);
            }
        }else{
            failureBlock(@"网络错误");
        }
    } failure:^(id error) {
        failureBlock(@"网络错误");
    }];
}

+ (void)redPointSuccessBlock:(void (^)(id responObject))successBlock
                failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/client_alert/redPoint", HttpRequestURL];
    
    
    [[CTWS getDefault] getWithURLString:url parameters:param success:^(id responseObject) {
        
        if (responseObject) {
            BackModel *model = [BackModel mj_objectWithKeyValues:responseObject];
            
            if ([model.status isEqualToString:@"1"]) {
                successBlock(model.wrapper);
            }else{
                failureBlock(model.errorMsg);
            }
        }else{
            failureBlock(@"网络错误");
        }
    } failure:^(id error) {
        failureBlock(@"网络错误");
    }];
}
@end
