//
//  MessageMainTableViewCell.h
//  Supervision
//
//  Created by 龙成 on 2020/6/23.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageMainTableViewCell : UITableViewCell

-(void)settitle:(NSString *)title
     updateTime:(NSString *)updateTime
        content:(NSString *)content
       readFlag:(BOOL)readFlag;

@end

NS_ASSUME_NONNULL_END
