//
//  ConsultingTableViewCell.h
//  Supervision
//
//  Created by 龙成 on 2020/6/11.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol ConsultingTableViewCellDelegate <NSObject>

- (void)didClickConsultingRow;

@end
@interface ConsultingTableViewCell : UITableViewCell
@property (nonatomic, weak) id <ConsultingTableViewCellDelegate > delegate;
@property (nonatomic, copy) NSArray *dataSource;

@end

NS_ASSUME_NONNULL_END
