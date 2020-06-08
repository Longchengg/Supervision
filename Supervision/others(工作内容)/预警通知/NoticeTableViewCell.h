//
//  NoticeTableViewCell.h
//  Supervision
//
//  Created by 龙成 on 2020/6/8.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NoticeTableViewCell : UITableViewCell
/**
 设置内容

 @param textStr 内容
 */
//- (void)labelT:(NSString *)textStr;
@property (nonatomic ,copy) NSString *labelStr;

@end

NS_ASSUME_NONNULL_END
