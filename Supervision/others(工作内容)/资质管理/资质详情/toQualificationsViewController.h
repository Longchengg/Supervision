//
//  toQualificationsViewController.h
//  Supervision
//
//  Created by 龙成 on 2020/6/15.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QualificationsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface toQualificationsViewController : TCBaseViewController
//1资质证书、2安全许可证、3数字证书、4职员证书
@property (nonatomic, strong) NSString *typeVC;
@property (nonatomic, strong) QualificationsModel *toQualificationsModel;
@end

NS_ASSUME_NONNULL_END
