//
//  ZhaotoubiaoTableViewCell.h
//  Supervision
//
//  Created by 龙成 on 2020/6/18.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZhaotoubiaoTableViewCell : UITableViewCell
-(void)projectName:(NSString *)projectName
         bidStatus:(NSString *)bidStatus
   bidCategoryName:(NSString *)bidCategoryName
      projectPlace:(NSString *)projectPlace
     registerStart:(NSString *)registerStart
       registerEnd:(NSString *)registerEnd
          bidStart:(NSString *)bidStart;

-(void)projectName:(NSString *)projectName
      marginStatus:(NSString *)marginStatus
         marginFee:(NSString *)marginFee
      projectPlace:(NSString *)projectPlace
      operatorName:(NSString *)operatorName
     operatorPhone:(NSString *)operatorPhone
         marginEnd:(NSString *)marginEnd
          bidStart:(NSString *)bidStart;


@end

NS_ASSUME_NONNULL_END
