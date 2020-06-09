//
//  HomeFindToolCell.h
//  Supervision
//
//  Created by 龙成 on 2020/6/7.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol HomeFindToolCellDelegate <NSObject>

- (void)didClickFindBtn:(NSInteger )index;

@end
@interface HomeFindToolCell : UITableViewCell
@property (nonatomic, weak) id <HomeFindToolCellDelegate > delegate;

@end

NS_ASSUME_NONNULL_END
