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
@end
