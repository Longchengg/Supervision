//
//  HttpRequestTool.h
//  Supervision
//
//  Created by 龙成 on 2018/8/22.
//  Copyright © 2018年 Supervision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequestTool : NSObject


/// 审核员列表
/// @param keyword 关键字
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)GetLaywerUserList2:(NSString *)keyword
              successBlock:(void (^)(id responObject))successBlock
              failureBlock:(void (^)(id err))failureBlock;

/// 用户登录
/// @param mobile 手机号
/// @param verifyCode 验证码
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)uersLogin:(NSString * )mobile
       verifyCode:(NSString * )verifyCode
     successBlock:(void (^)(id responObject))successBlock
     failureBlock:(void (^)(id err))failureBlock;


/// 发送验证码
/// @param mobile 手机号
/// @param type 类型
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)sendCode:(NSString * )mobile
            type:(NSString * )type
    successBlock:(void (^)(id responObject))successBlock
    failureBlock:(void (^)(id err))failureBlock;


/// 首页预警信息
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)indexMessageSuccessBlock:(void (^)(id responObject))successBlock
                    failureBlock:(void (^)(id err))failureBlock;

/// 资质证书、安全许可证和数字证书数量
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)cert_stasticSuccessBlock:(void (^)(id responObject))successBlock
                    failureBlock:(void (^)(id err))failureBlock;

/// 获取红点状态
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)redPointSuccessBlock:(void (^)(id responObject))successBlock
                failureBlock:(void (^)(id err))failureBlock;
@end
