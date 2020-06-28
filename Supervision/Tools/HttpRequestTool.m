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

+ (void)user_companySuccessBlock:(void (^)(id responObject))successBlock
                    failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/user/company", HttpRequestURL];
    
    
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
+ (void)client_serviceInfoSuccessBlock:(void (^)(id responObject))successBlock
                          failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/serviceInfo", HttpRequestURL];
    
    
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
+ (void)uers_refreshTokensuccessBlock:(void (^)(id responObject))successBlock
                         failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/user/refreshToken", HttpRequestURL];
    
    
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
+ (void)client_push_bind:(NSString *)registrationId
            successBlock:(void (^)(id responObject))successBlock
            failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param safeObject:registrationId forKey:@"registrationId"];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/push/bind", HttpRequestURL];
    
    
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
+ (void)client_push_unBind:(NSString *)registrationId
              successBlock:(void (^)(id responObject))successBlock
              failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param safeObject:registrationId forKey:@"registrationId"];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/push/unBind", HttpRequestURL];
    
    
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
+ (void)uers_quitsuccessBlock:(void (^)(id responObject))successBlock
                 failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/user/quit", HttpRequestURL];
    
    
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
+ (void)feedback:(NSString *)feedback
        platform:(NSString *)platform
    successBlock:(void (^)(id responObject))successBlock
    failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param safeObject:feedback forKey:@"feedback"];
    [param safeObject:platform forKey:@"platform"];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/feedback", HttpRequestURL];
    
    
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

+ (void)infoSuccessBlock:(void (^)(id responObject))successBlock
            failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/client_alert/info", HttpRequestURL];
    
    
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
+ (void)problem_process:(NSString *)processStatus
           successBlock:(void (^)(id responObject))successBlock
           failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/problem_process/stastic/%@", HttpRequestURL,processStatus];
    
    
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

+ (void)comLicense:(NSString *)processStatus
              page:(NSString *)page
              size:(NSString *)size
      successBlock:(void (^)(id responObject))successBlock
      failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param safeObject:processStatus forKey:@"processStatus"];
    [param safeObject:page forKey:@"page"];
    [param safeObject:size forKey:@"size"];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/problem_process/comLicense/query/page", HttpRequestURL];
    
    
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
+ (void)comSafetyLicense:(NSString *)processStatus
                    page:(NSString *)page
                    size:(NSString *)size
            successBlock:(void (^)(id responObject))successBlock
            failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param safeObject:processStatus forKey:@"processStatus"];
    [param safeObject:page forKey:@"page"];
    [param safeObject:size forKey:@"size"];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/problem_process/comSafetyLicense/query/page", HttpRequestURL];
    
    
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
+ (void)digitalLicense:(NSString *)processStatus
                  page:(NSString *)page
                  size:(NSString *)size
          successBlock:(void (^)(id responObject))successBlock
          failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param safeObject:processStatus forKey:@"processStatus"];
    [param safeObject:page forKey:@"page"];
    [param safeObject:size forKey:@"size"];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/problem_process/digitalLicense/query/page", HttpRequestURL];
    
    
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
+ (void)fourlibCA:(NSString *)processStatus
             type:(NSString *)type
             page:(NSString *)page
             size:(NSString *)size
     successBlock:(void (^)(id responObject))successBlock
     failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param safeObject:processStatus forKey:@"processStatus"];
    [param safeObject:type forKey:@"type"];
    [param safeObject:page forKey:@"page"];
    [param safeObject:size forKey:@"size"];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/problem_process/fourlibCA/query/page", HttpRequestURL];
    
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

+ (void)companyProb:(NSString *)processStatus
       SuccessBlock:(void (^)(id responObject))successBlock
       failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/problem_process/companyProb/%@", HttpRequestURL,processStatus];
    
    
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

+ (void)personProb:(NSString *)processStatus
      SuccessBlock:(void (^)(id responObject))successBlock
      failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/problem_process/personProb/%@", HttpRequestURL,processStatus];
    
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
+ (void)personCert:(NSString *)processStatus
    certCategoryId:(NSString *)certCategoryId
              page:(NSString *)page
              size:(NSString *)size
      SuccessBlock:(void (^)(id responObject))successBlock
      failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param safeObject:processStatus forKey:@"processStatus"];
    [param safeObject:certCategoryId forKey:@"certCategoryId"];
    [param safeObject:page forKey:@"page"];
    [param safeObject:size forKey:@"size"];
    NSString *url = [NSString stringWithFormat:@"%@/client/problem_process/personCert/query/page", HttpRequestURL];
    
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
+ (void)problem_bid:(NSString *)processStatus
               page:(NSString *)page
               size:(NSString *)size
       SuccessBlock:(void (^)(id responObject))successBlock
       failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param safeObject:processStatus forKey:@"processStatus"];
    [param safeObject:page forKey:@"page"];
    [param safeObject:size forKey:@"size"];
    NSString *url = [NSString stringWithFormat:@"%@/client/problem_process/bid/query/page", HttpRequestURL];
    
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

+ (void)problem_userDefined:(NSString *)processStatus
                       page:(NSString *)page
                       size:(NSString *)size
               SuccessBlock:(void (^)(id responObject))successBlock
               failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param safeObject:processStatus forKey:@"processStatus"];
    [param safeObject:page forKey:@"page"];
    [param safeObject:size forKey:@"size"];
    NSString *url = [NSString stringWithFormat:@"%@/client/problem_process/userDefined/query/page", HttpRequestURL];
    
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
+ (void)person_avaliableSuccessBlock:(void (^)(id responObject))successBlock
                        failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/person_appearance/get/person/avaliable", HttpRequestURL];
    
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
+ (void)person_appearance_query:(NSString *)personId
                           page:(NSString *)page
                           size:(NSString *)size
                   SuccessBlock:(void (^)(id responObject))successBlock
                   failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param safeObject:personId forKey:@"personId"];
    [param safeObject:page forKey:@"page"];
    [param safeObject:size forKey:@"size"];
    NSString *url = [NSString stringWithFormat:@"%@/client/person_appearance/query/page", HttpRequestURL];
    
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
+ (void)client_cert_borrow:(NSString *)page
                      size:(NSString *)size
                 applyTime:(NSString *)applyTime
                returnTime:(NSString *)returnTime
            realReturnTime:(NSString *)realReturnTime
              SuccessBlock:(void (^)(id responObject))successBlock
              failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    NSString *url = [NSString stringWithFormat:@"%@/client/client_cert/page/borrow?page=%@&size=%@", HttpRequestURL,page,size];
    
    if (applyTime != nil) {
        url =  [NSString stringWithFormat:@"%@&applyTime=%@", url,applyTime];
    }
    if (returnTime != nil) {
        url =  [NSString stringWithFormat:@"%@&returnTime=%@", url,returnTime];
    }
    if (realReturnTime != nil) {
        url =  [NSString stringWithFormat:@"%@&realReturnTime=%@", url,realReturnTime];
    }
    
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
+ (void)notice_message:(NSString *)page
                  size:(NSString *)size
          SuccessBlock:(void (^)(id responObject))successBlock
          failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param safeObject:page forKey:@"page"];
    [param safeObject:size forKey:@"size"];
    NSString *url = [NSString stringWithFormat:@"%@/client/notice_message", HttpRequestURL];
    
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
+ (void)license_listSuccessBlock:(void (^)(id responObject))successBlock
                    failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    NSString *url = [NSString stringWithFormat:@"%@/client/get/license/list", HttpRequestURL];
    
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
+ (void)safety_listSuccessBlock:(void (^)(id responObject))successBlock
                   failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    NSString *url = [NSString stringWithFormat:@"%@/client/get/safety/list", HttpRequestURL];
    
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
+ (void)digital_listSuccessBlock:(void (^)(id responObject))successBlock
                    failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    NSString *url = [NSString stringWithFormat:@"%@/client/get/digital/list", HttpRequestURL];
    
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
+ (void)category_statisticSuccessBlock:(void (^)(id responObject))successBlock
                          failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    NSString *url = [NSString stringWithFormat:@"%@/client/personcert/get/category/statistics", HttpRequestURL];
    
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
+ (void)personcert_query:(NSString *)certCategoryId
                    page:(NSString *)page
                    size:(NSString *)size
            SuccessBlock:(void (^)(id responObject))successBlock
            failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param safeObject:certCategoryId forKey:@"certCategoryId"];
    [param safeObject:page forKey:@"page"];
    [param safeObject:size forKey:@"size"];
    NSString *url = [NSString stringWithFormat:@"%@/client/personcert/query/page", HttpRequestURL];
    
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
+ (void)borrowing_history:(NSString *)type
                 targetId:(NSString *)targetId
             SuccessBlock:(void (^)(id responObject))successBlock
             failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/borrowing/history/%@/%@", HttpRequestURL,type,targetId];
    
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
+ (void)bid_type_allSuccessBlock:(void (^)(id responObject))successBlock
                    failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/bid_type/get/all", HttpRequestURL];
    //设置为YES 表示隐藏加载动画
    //    [CTWS getDefault].isHiddenHUDView = YES;
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

+ (void)client_performance:(NSString *)page
                      size:(NSString *)size
               projectName:(NSString *)projectName
               buildStatus:(NSString *)buildStatus
                 startYear:(NSString *)startYear
              SuccessBlock:(void (^)(id responObject))successBlock
              failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param safeObject:page forKey:@"page"];
    [param safeObject:size forKey:@"size"];
    [param safeObject:projectName forKey:@"projectName"];
    [param safeObject:buildStatus forKey:@"buildStatus"];
    [param safeObject:startYear forKey:@"startYear"];
    NSString *url = [NSString stringWithFormat:@"%@/client/client_performance/query/page", HttpRequestURL];
    
    //设置为YES 表示隐藏加载动画
    //    [CTWS getDefault].isHiddenHUDView = YES;
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
+ (void)training_board_allSuccessBlock:(void (^)(id responObject))successBlock
                          failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/training/board/all", HttpRequestURL];
    //设置为YES 表示隐藏加载动画
    //    [CTWS getDefault].isHiddenHUDView = YES;
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
+ (void)training_list:(NSString *)trainingBoardId
         SuccessBlock:(void (^)(id responObject))successBlock
         failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param safeObject:trainingBoardId forKey:@"trainingBoardId"];
    NSString *url = [NSString stringWithFormat:@"%@/client/training/list", HttpRequestURL];
    //设置为YES 表示隐藏加载动画
    //    [CTWS getDefault].isHiddenHUDView = YES;
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
+ (void)training_get:(NSString *)trainingId
        SuccessBlock:(void (^)(id responObject))successBlock
        failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/training/get/%@", HttpRequestURL,trainingId];
    
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
+ (void)bid_query:(NSString *)page
             size:(NSString *)size
       categoryId:(NSString *)categoryId
        bidStatus:(NSString *)bidStatus
      openBidYear:(NSString *)openBidYear
     marginStatus:(NSString *)marginStatus
     SuccessBlock:(void (^)(id responObject))successBlock
     failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param safeObject:page forKey:@"page"];
    [param safeObject:size forKey:@"size"];
    [param safeObject:categoryId forKey:@"categoryId"];
    [param safeObject:bidStatus forKey:@"bidStatus"];
    [param safeObject:openBidYear forKey:@"openBidYear"];
    [param safeObject:marginStatus forKey:@"marginStatus"];
    NSString *url = [NSString stringWithFormat:@"%@/client/new/bid/query/page", HttpRequestURL];
    
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
+ (void)get_all_lockSuccessBlock:(void (^)(id responObject))successBlock
                    failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    NSString *url = [NSString stringWithFormat:@"%@/client/bid/get/all/lock", HttpRequestURL];
    
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
+ (void)bid_lock_certSuccessBlock:(void (^)(id responObject))successBlock
                     failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    NSString *url = [NSString stringWithFormat:@"%@/client/bid_lock_cert/get/all", HttpRequestURL];
    
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
+ (void)bid_get_lock:(NSString *)lockCertId
        SuccessBlock:(void (^)(id responObject))successBlock
        failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    NSString *url = [NSString stringWithFormat:@"%@/client/new/bid/get/lock/%@", HttpRequestURL,lockCertId];
    
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
+ (void)bid_get_usable:(NSString *)lockCertId
          SuccessBlock:(void (^)(id responObject))successBlock
          failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    NSString *url = [NSString stringWithFormat:@"%@/client/new/bid/get/usable/%@", HttpRequestURL,lockCertId];
    
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
+ (void)bid_get_all_lockSuccessBlock:(void (^)(id responObject))successBlock
                        failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    NSString *url = [NSString stringWithFormat:@"%@/client/bid/get/all/lock", HttpRequestURL];
    
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

+ (void)policy_article:(NSString *)categoryId
               keyword:(NSString *)keyword
                  page:(NSString *)page
                  size:(NSString *)size
          SuccessBlock:(void (^)(id responObject))successBlock
          failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    NSString *url = [NSString stringWithFormat:@"%@/client/policy/article/page?page=%@&size=%@", HttpRequestURL,page,size];
    
    if (categoryId != nil) {
        url =  [NSString stringWithFormat:@"%@&categoryId=%@", url,categoryId];
    }
    if (keyword != nil && ![keyword isEqual:@""]) {
        url =  [NSString stringWithFormat:@"%@&keyword=%@", url,keyword];
    }
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
+ (void)policy_article_get:(NSString *)webId
              SuccessBlock:(void (^)(id responObject))successBlock
              failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    NSString *url = [NSString stringWithFormat:@"%@/client/policy/article/get/%@", HttpRequestURL,webId];
    
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
+ (void)notice_policy_article:(NSString *)webId
                 SuccessBlock:(void (^)(id responObject))successBlock
                 failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    NSString *url = [NSString stringWithFormat:@"%@/notice/policy/article/%@", HttpRequestURLQ,webId];
    
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
+ (void)client_alert_query:(NSString *)page
                      size:(NSString *)size
               validStatus:(NSString *)validStatus
              SuccessBlock:(void (^)(id responObject))successBlock
              failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param safeObject:page forKey:@"page"];
    [param safeObject:size forKey:@"size"];
    [param safeObject:validStatus forKey:@"validStatus"];
    NSString *url = [NSString stringWithFormat:@"%@/client/client_alert/query/page", HttpRequestURL];
    
    //设置为YES 表示隐藏加载动画
    //    [CTWS getDefault].isHiddenHUDView = YES;
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

+ (void)client_push_message:(NSString *)page
                       size:(NSString *)size
               SuccessBlock:(void (^)(id responObject))successBlock
               failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param safeObject:page forKey:@"page"];
    [param safeObject:size forKey:@"size"];
    NSString *url = [NSString stringWithFormat:@"%@/client/push/message", HttpRequestURL];
    
    //设置为YES 表示隐藏加载动画
    //    [CTWS getDefault].isHiddenHUDView = YES;
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
+ (void)client_push_read:(NSString *)redID
            successBlock:(void (^)(id responObject))successBlock
            failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/push/read/%@", HttpRequestURL,redID];
    
    
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
+ (void)client_push_readAllsuccessBlock:(void (^)(id responObject))successBlock
                           failureBlock:(void (^)(id err))failureBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    NSString *url = [NSString stringWithFormat:@"%@/client/push/readAll", HttpRequestURL];
    
    [CTWS getDefault].isHiddenHUDView = YES;
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
@end
