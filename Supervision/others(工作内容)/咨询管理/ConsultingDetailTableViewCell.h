//
//  ConsultingDetailTableViewCell.h
//  Supervision
//
//  Created by 龙成 on 2020/6/11.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConsultingDetailTableViewCell : UITableViewCell


-(void)setContent:(NSString *)NameTextL
         ContextL:(NSString *)ContextL
        timeTextL:(NSString *)timeTextL
       stausTextL:(NSString *)stausTextL
        downTextL:(NSString *)downTextL;

@end

NS_ASSUME_NONNULL_END
