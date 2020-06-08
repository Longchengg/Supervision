//
//  LookBroadTopTableViewCell.h
//  Supervision
//
//  Created by 龙成 on 2020/6/7.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol LookBroadTopTableViewCellDelegate <NSObject>


- (void)didClickxiaoxiBtn:(UIButton *)button;

- (void)didClickchuliBtn:(UIButton *)button;


@end
@interface LookBroadTopTableViewCell : UITableViewCell
@property (nonatomic, weak) id <LookBroadTopTableViewCellDelegate > delegate;
@property (nonatomic, copy) NSString *expiredCount;
@property (nonatomic, copy) NSString *alertCount;


@end

NS_ASSUME_NONNULL_END
