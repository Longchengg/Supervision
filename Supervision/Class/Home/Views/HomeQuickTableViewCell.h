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

- (void)didClickQuickBtn:(NSInteger )index;


@end

@interface HomeQuickTableViewCell : UITableViewCell

@property (nonatomic ,copy) NSDictionary *dict;
@property (nonatomic, weak) id <HomeQuickTableViewCellDelegate > delegate;

@end

NS_ASSUME_NONNULL_END
