//
//  HomeQuickTableViewCell.h
//  Supervision
//
//  Created by 龙成 on 2020/5/21.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HomeQuickTableViewCellDelegate <NSObject>

- (void)didClickTopBtn1:(UIButton *)button;

- (void)didClickTopBtn2:(UIButton *)button;

- (void)didClickTopBtn3:(UIButton *)button;

- (void)didClickTopBtn4:(UIButton *)button;

- (void)didClickBottomBtn1:(UIButton *)button;

- (void)didClickBottomBtn2:(UIButton *)button;

- (void)didClickBottomBtn3:(UIButton *)button;

- (void)didClickBottomBtn4:(UIButton *)button;


@end

@interface HomeQuickTableViewCell : UITableViewCell

@property (nonatomic, weak) id <HomeQuickTableViewCellDelegate > delegate;

@end

NS_ASSUME_NONNULL_END
