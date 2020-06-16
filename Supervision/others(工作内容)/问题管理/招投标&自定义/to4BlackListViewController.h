//
//  to4BlackListViewController.h
//  Supervision
//
//  Created by 龙成 on 2020/6/10.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "TCBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface to4BlackListViewController : TCBaseViewController
//0 招投标VC  1自定义VC
@property (nonatomic, strong) NSString *typeVC;

//0 待处理 1处理中 2已处理
@property (nonatomic, strong) NSString *processStatus;

@property (nonatomic, strong) NSString *certCategoryId;

@property (nonatomic, strong) NSString *titleStr;

@end

NS_ASSUME_NONNULL_END
