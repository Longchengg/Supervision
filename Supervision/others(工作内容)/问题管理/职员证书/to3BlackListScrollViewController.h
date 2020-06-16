//
//  to3BlackListScrollViewController.h
//  Supervision
//
//  Created by 龙成 on 2020/6/10.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "TCBaseViewController.h"


NS_ASSUME_NONNULL_BEGIN

@interface to3BlackListScrollViewController : TCBaseViewController
//0 待处理 1处理中 2已处理
@property (nonatomic, strong) NSString *processStatus;
@property (nonatomic, strong) NSString *certCategoryId;


@end

NS_ASSUME_NONNULL_END
