//
//  to2BlackListScrollViewController.h
//  Supervision
//
//  Created by 龙成 on 2020/6/9.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "TCBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface to2BlackListScrollViewController : TCBaseViewController

@property (nonatomic, strong) NSString *titleStr;

//0 待处理 1处理中 2已处理
@property (nonatomic, strong) NSString *processStatus;

@end

NS_ASSUME_NONNULL_END
