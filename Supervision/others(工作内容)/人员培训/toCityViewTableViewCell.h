//
//  toCityViewTableViewCell.h
//  Supervision
//
//  Created by 龙成 on 2020/6/17.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface toCityViewTableViewCell : UITableViewCell
-(void)settrainingName:(NSString *)trainingName
      trainingTypeDesc:(NSString *)trainingTypeDesc
         trainingPlace:(NSString *)trainingPlace
         trainingOrgan:(NSString *)trainingOrgan
registerStart_registerEnd:(NSString *)registerStart_registerEnd
trainingStart_trainingEnd:(NSString *)trainingStart_trainingEnd
     examStart_examEnd:(NSString *)examStart_examEnd
    registerStatusDesc:(NSString *)registerStatusDesc
        trainingFeeOne:(NSString *)trainingFeeOne
      trainingFeeTotal:(NSString *)trainingFeeTotal;
@end

NS_ASSUME_NONNULL_END
