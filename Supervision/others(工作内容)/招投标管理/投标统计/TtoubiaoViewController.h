//
//  TtoubiaoViewController.h
//  Supervision
//
//  Created by 龙成 on 2020/6/19.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TtoubiaoViewController : TCBaseViewController
//1已锁定人员  2材料员
@property(nonatomic, strong) NSString *typeVC;
@property(nonatomic, strong) NSString *lockCertId;

@end

NS_ASSUME_NONNULL_END
