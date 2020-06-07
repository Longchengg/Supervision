//
//  HomeTopTableViewCell.h
//  Supervision
//
//  Created by 龙成 on 2020/5/21.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HomeTopTableViewCellDelegate <NSObject>


- (void)didClickWorkSpaceBtn:(UIButton *)button;

- (void)didClickDetailsBtn:(UIButton *)button;


@end

@interface HomeTopTableViewCell : UITableViewCell

@property (nonatomic, weak) id <HomeTopTableViewCellDelegate > delegate;

@property (nonatomic, copy) NSMutableArray *dataSource;

@end

NS_ASSUME_NONNULL_END
