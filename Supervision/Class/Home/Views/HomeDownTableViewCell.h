//
//  HomeDownTableViewCell.h
//  Supervision
//
//  Created by 龙成 on 2020/6/21.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol HomeDownTableCellDelegate <NSObject>

- (void)didClickDownBtn:(NSInteger )index;

@end
@interface HomeDownTableViewCell : UITableViewCell
@property (nonatomic, weak) id <HomeDownTableCellDelegate > delegate;

@end

NS_ASSUME_NONNULL_END
