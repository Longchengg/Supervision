//
//  toConsultingTableViewCell.h
//  Supervision
//
//  Created by 龙成 on 2020/6/12.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface toConsultingTableViewCell : UITableViewCell
-(void)setContent:(NSString *)NameTextL
         ContextL:(NSString *)ContextL
        timeTextL:(NSString *)timeTextL
       stausTextL:(NSString *)stausTextL;
@end

NS_ASSUME_NONNULL_END
