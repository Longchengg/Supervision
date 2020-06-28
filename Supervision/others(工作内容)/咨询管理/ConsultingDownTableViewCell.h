//
//  ConsultingDownTableViewCell.h
//  Supervision
//
//  Created by 龙成 on 2020/6/11.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConsultingDownTableViewCell : UITableViewCell

-(void)setContent:(NSString *)NameTextL
         ContextL:(NSString *)ContextL
        timeTextL:(NSString *)timeTextL
       stausTextL:(NSString *)stausTextL
        downTextL:(NSString *)downTextL
            cont1:(NSString *)cont1
            cont2:(NSString *)cont2
            cont3:(NSString *)cont3
            cont4:(NSString *)cont4
            cont5:(NSString *)cont5
            cont6:(NSString *)cont6;
@end

NS_ASSUME_NONNULL_END
