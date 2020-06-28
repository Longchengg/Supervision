//
//  ZhaotoubiaoDownCell.h
//  Supervision
//
//  Created by 龙成 on 2020/6/19.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZhaotoubiaoDownCell : UITableViewCell

-(void)projectName:(NSString *)projectName
   bidCategoryName:(NSString *)bidCategoryName
      projectPlace:(NSString *)projectPlace
     registerStart:(NSString *)registerStart
       registerEnd:(NSString *)registerEnd
          bidStart:(NSString *)bidStart
          bidPlace:(NSString *)bidPlace
      operatorName:(NSString *)operatorName
     operatorPhone:(NSString *)operatorPhone
         bidStatus:(NSString *)bidStatus
         marginFee:(NSString *)marginFee
         marginEnd:(NSString *)marginEnd
      marginStatus:(NSString *)marginStatus;

@end

NS_ASSUME_NONNULL_END
