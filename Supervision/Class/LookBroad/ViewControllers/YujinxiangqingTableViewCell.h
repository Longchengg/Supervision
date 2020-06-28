//
//  YujinxiangqingTableViewCell.h
//  Supervision
//
//  Created by 龙成 on 2020/6/21.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YujinxiangqingTableViewCell : UITableViewCell
-(void)setCell:(NSString *)alertType
     alertItem:(NSString *)alertItem
alertObjectName:(NSString *)alertObjectName
     validTime:(NSString *)validTime
          days:(NSString *)days;

@end

NS_ASSUME_NONNULL_END
