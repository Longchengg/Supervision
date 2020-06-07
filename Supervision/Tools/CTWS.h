//
//  CTWS.h
//  Supervision
//
//  Created by 龙成 on 2018/10/12.
//  Copyright © 2018 Supervision. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFSecurityPolicy,AFHTTPRequestOperationManager;

@interface CTWS : NSObject

@property (nonatomic, assign) BOOL isHiddenHUDView;

+ (CTWS *)getDefault;

- (void)doPostWithUrl:(NSString *)url
               params:(NSDictionary *)params
              success:(void (^)(id responseObject))success
              failure:(void (^)(NSError *error))failure;

- (void)postWithURLString:(NSString *)urlString
               parameters:(NSMutableDictionary *)parameters
                  success:(void (^)(id responseObject))success
                  failure:(void (^)(NSError *error))failure;


- (void)upLoadImage:(NSString *)url
       andImageFile:(NSData *)imageData
            success:(void (^)(id responseObject))success
            failure:(void (^)(NSError *error))failure;
@end


