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

/// 退出登录
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)uers_quitsuccessBlock:(void (^)(id responObject))successBlock
                 failureBlock:(void (^)(id err))failureBlock;
/// 刷新token
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)uers_refreshTokensuccessBlock:(void (^)(id responObject))successBlock
                         failureBlock:(void (^)(id err))failureBlock;
/// 意见反馈
/// feedback 意见反馈内容
/// platform 平台：1安卓2苹果
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)feedback:(NSString *)feedback
        platform:(NSString *)platform
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

/// 获取企业信息
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)user_companySuccessBlock:(void (^)(id responObject))successBlock
                    failureBlock:(void (^)(id err))failureBlock;
/// 获取客服电话
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)client_serviceInfoSuccessBlock:(void (^)(id responObject))successBlock
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
/// 获取所有投标类型列表
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)bid_type_allSuccessBlock:(void (^)(id responObject))successBlock
                    failureBlock:(void (^)(id err))failureBlock;
/// 获取业绩管理
/// @param page  分页
/// @param size  行数
/// @param projectName  业绩类型
/// @param buildStatus  竣工时间 1在建 2竣工
/// @param startYear      开工时间
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)client_performance:(NSString *)page
                      size:(NSString *)size
               projectName:(NSString *)projectName
               buildStatus:(NSString *)buildStatus
                 startYear:(NSString *)startYear
              SuccessBlock:(void (^)(id responObject))successBlock
              failureBlock:(void (^)(id err))failureBlock;
/// 获取培训板块，层级结构
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)training_board_allSuccessBlock:(void (^)(id responObject))successBlock
                          failureBlock:(void (^)(id err))failureBlock;
/// 根据板块获取培训数据
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)training_list:(NSString *)trainingBoardId
         SuccessBlock:(void (^)(id responObject))successBlock
         failureBlock:(void (^)(id err))failureBlock;
/// 获取培训内容详情
/// @param trainingId 类别ID
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)training_get:(NSString *)trainingId
        SuccessBlock:(void (^)(id responObject))successBlock
        failureBlock:(void (^)(id err))failureBlock;
/// 获取投标记录
/// @param page  分页
/// @param size  行数
/// @param categoryId 类别ID
/// @param bidStatus  投标状态 0:待报名, 1:待投标, 2:待交保证金 3:待开标 4 已中标,5 未中标
/// @param openBidYear 开标年份
/// @param marginStatus 保证金状态 0:待交, 1:已交, 2:待退, 3:已退
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)bid_query:(NSString *)page
             size:(NSString *)size
       categoryId:(NSString *)categoryId
        bidStatus:(NSString *)bidStatus
      openBidYear:(NSString *)openBidYear
     marginStatus:(NSString *)marginStatus
     SuccessBlock:(void (^)(id responObject))successBlock
     failureBlock:(void (^)(id err))failureBlock;
///获取锁定人员信息
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)get_all_lockSuccessBlock:(void (^)(id responObject))successBlock
                    failureBlock:(void (^)(id err))failureBlock;
///获取锁定证书
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)bid_lock_certSuccessBlock:(void (^)(id responObject))successBlock
                     failureBlock:(void (^)(id err))failureBlock;
///获取已锁定人员
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)bid_get_lock:(NSString *)lockCertId
        SuccessBlock:(void (^)(id responObject))successBlock
        failureBlock:(void (^)(id err))failureBlock;
///获取可用人员信息
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)bid_get_usable:(NSString *)lockCertId
          SuccessBlock:(void (^)(id responObject))successBlock
          failureBlock:(void (^)(id err))failureBlock;
///获取已锁人员信息
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)bid_get_all_lockSuccessBlock:(void (^)(id responObject))successBlock
                        failureBlock:(void (^)(id err))failureBlock;
///分页展示政策法律法规
/// @param page  分页
/// @param size  行数
/// @param keyword  关键词
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)policy_article:(NSString *)categoryId
               keyword:(NSString *)keyword
                  page:(NSString *)page
                  size:(NSString *)size
          SuccessBlock:(void (^)(id responObject))successBlock
          failureBlock:(void (^)(id err))failureBlock;
///获取文章政策详情
/// @param webId  ID
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)policy_article_get:(NSString *)webId
              SuccessBlock:(void (^)(id responObject))successBlock
              failureBlock:(void (^)(id err))failureBlock;
///获取文章政策详情
/// @param webId  ID
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)notice_policy_article:(NSString *)webId
                 SuccessBlock:(void (^)(id responObject))successBlock
                 failureBlock:(void (^)(id err))failureBlock;

///分页查询预警信息
/// @param page  分页
/// @param size  行数
/// @param validStatus  证书到期状态,1:快过期,2:已过期
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)client_alert_query:(NSString *)page
                      size:(NSString *)size
               validStatus:(NSString *)validStatus
              SuccessBlock:(void (^)(id responObject))successBlock
              failureBlock:(void (^)(id err))failureBlock;

///绑定设备
/// @param registrationId  设备id
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)client_push_bind:(NSString *)registrationId
            successBlock:(void (^)(id responObject))successBlock
            failureBlock:(void (^)(id err))failureBlock;
///取消绑定设备
/// @param registrationId  设备id
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)client_push_unBind:(NSString *)registrationId
              successBlock:(void (^)(id responObject))successBlock
              failureBlock:(void (^)(id err))failureBlock;
///获取消息列表
/// @param page  分页
/// @param size  行数
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)client_push_message:(NSString *)page
                       size:(NSString *)size
               SuccessBlock:(void (^)(id responObject))successBlock
               failureBlock:(void (^)(id err))failureBlock;
///全部标记已读
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)client_push_readAllsuccessBlock:(void (^)(id responObject))successBlock
                           failureBlock:(void (^)(id err))failureBlock;

///标记已读
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)client_push_read:(NSString *)redID
            successBlock:(void (^)(id responObject))successBlock
            failureBlock:(void (^)(id err))failureBlock;

@end

