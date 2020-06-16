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
/// 获取预警页面
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)infoSuccessBlock:(void (^)(id responObject))successBlock
            failureBlock:(void (^)(id err))failureBlock;

/// 问题处理状态
/// @param processStatus  0 待处理  1处理中  2已处理
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+(void)problem_process:(NSString *)processStatus
          successBlock:(void (^)(id responObject))successBlock
          failureBlock:(void (^)(id err))failureBlock;

/// 资质证书
/// @param processStatus  0 待处理  1处理中  2已处理
/// @param page  分页
/// @param size  行数
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)comLicense:(NSString *)processStatus
              page:(NSString *)page
              size:(NSString *)size
      successBlock:(void (^)(id responObject))successBlock
      failureBlock:(void (^)(id err))failureBlock;

/// 安全生产许可证
/// @param processStatus  0 待处理  1处理中  2已处理
/// @param page  分页
/// @param size  行数
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)comSafetyLicense:(NSString *)processStatus
                    page:(NSString *)page
                    size:(NSString *)size
            successBlock:(void (^)(id responObject))successBlock
            failureBlock:(void (^)(id err))failureBlock;

/// 数字证书
/// @param processStatus  0 待处理  1处理中  2已处理
/// @param page  分页
/// @param size  行数
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)digitalLicense:(NSString *)processStatus
                  page:(NSString *)page
                  size:(NSString *)size
          successBlock:(void (^)(id responObject))successBlock
          failureBlock:(void (^)(id err))failureBlock;

/// 四库一平台 || CA锁
/// @param type  1四库一平台  2CA锁
/// @param processStatus  0 待处理  1处理中  2已处理
/// @param page  分页
/// @param size  行数
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)fourlibCA:(NSString *)processStatus
             type:(NSString *)type
             page:(NSString *)page
             size:(NSString *)size
     successBlock:(void (^)(id responObject))successBlock
     failureBlock:(void (^)(id err))failureBlock;

/// 获取企业问题管理数量统计
/// @param processStatus  0 待处理  1处理中  2已处理
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)companyProb:(NSString *)processStatus
       SuccessBlock:(void (^)(id responObject))successBlock
       failureBlock:(void (^)(id err))failureBlock;

/// 获取职员证书问题管理数量统计
/// @param processStatus  0 待处理  1处理中  2已处理
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)personProb:(NSString *)processStatus
      SuccessBlock:(void (^)(id responObject))successBlock
      failureBlock:(void (^)(id err))failureBlock;

/// 获取职员证书问题列表
/// @param certCategoryId  职员ID
/// @param processStatus  0 待处理  1处理中  2已处理
/// @param page  分页
/// @param size  行数
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)personCert:(NSString *)processStatus
certCategoryId:(NSString *)certCategoryId
          page:(NSString *)page
          size:(NSString *)size
  SuccessBlock:(void (^)(id responObject))successBlock
      failureBlock:(void (^)(id err))failureBlock;

/// 获取招投标问题列表
/// @param processStatus  0 待处理  1处理中  2已处理
/// @param page  分页
/// @param size  行数
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)problem_bid:(NSString *)processStatus
        page:(NSString *)page
        size:(NSString *)size
SuccessBlock:(void (^)(id responObject))successBlock
       failureBlock:(void (^)(id err))failureBlock;
/// 获取自定义问题列表
/// @param processStatus  0 待处理  1处理中  2已处理
/// @param page  分页
/// @param size  行数
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)problem_userDefined:(NSString *)processStatus
        page:(NSString *)page
        size:(NSString *)size
SuccessBlock:(void (^)(id responObject))successBlock
               failureBlock:(void (^)(id err))failureBlock;
/// 获取人员出场信息
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)person_avaliableSuccessBlock:(void (^)(id responObject))successBlock
                        failureBlock:(void (^)(id err))failureBlock;
/// 获取自定义问题列表
/// @param personId  人员ID
/// @param page  分页
/// @param size  行数
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)person_appearance_query:(NSString *)personId
                           page:(NSString *)page
                           size:(NSString *)size
                   SuccessBlock:(void (^)(id responObject))successBlock
                   failureBlock:(void (^)(id err))failureBlock;
/// 获取证书借还记录
/// @param applyTime  借证时间
/// @param returnTime  预计归还时间
/// @param realReturnTime  实际归还时间
/// @param page  分页
/// @param size  行数
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)client_cert_borrow:(NSString *)page
                      size:(NSString *)size
                 applyTime:(NSString *)applyTime
                returnTime:(NSString *)returnTime
            realReturnTime:(NSString *)realReturnTime
              SuccessBlock:(void (^)(id responObject))successBlock
              failureBlock:(void (^)(id err))failureBlock;

/// 获取通知消息
/// @param page  分页
/// @param size  行数
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)notice_message:(NSString *)page
                  size:(NSString *)size
          SuccessBlock:(void (^)(id responObject))successBlock
          failureBlock:(void (^)(id err))failureBlock;

/// 获取资质证书列表
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)license_listSuccessBlock:(void (^)(id responObject))successBlock
                    failureBlock:(void (^)(id err))failureBlock;
/// 获取安全生产许可证列表
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)safety_listSuccessBlock:(void (^)(id responObject))successBlock
                   failureBlock:(void (^)(id err))failureBlock;

/// 获取数字证书列表
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)digital_listSuccessBlock:(void (^)(id responObject))successBlock
                    failureBlock:(void (^)(id err))failureBlock;
/// 获取人员证书统计
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)category_statisticSuccessBlock:(void (^)(id responObject))successBlock
failureBlock:(void (^)(id err))failureBlock;
/// 获取人员信息列表
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)personcert_query:(NSString *)certCategoryId
        page:(NSString *)page
        size:(NSString *)size
SuccessBlock:(void (^)(id responObject))successBlock
            failureBlock:(void (^)(id err))failureBlock;
/// 获取资证书历史动态
/// @param targetId  targetId
/// @param type  证书类型：1资质证书、2安全许可证、3数字证书、4职员证书
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)borrowing_history:(NSString *)type
                 targetId:(NSString *)targetId
             SuccessBlock:(void (^)(id responObject))successBlock
             failureBlock:(void (^)(id err))failureBlock;

@end

