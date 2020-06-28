//
//  CityTableViewCell.h
//  Tabel
//
//  Created by 龙成 on 2019/9/27.
//  Copyright © 2019 China. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CityTableViewCell : UITableViewCell

-(void)settrainingName:(NSString *)trainingName
                timeFW:(NSString *)timeFW
      trainingTypeDesc:(NSString *)trainingTypeDesc
         trainingPlace:(NSString *)trainingPlace
        trainingFeeOne:(NSString *)trainingFeeOne
    registerStatusDesc:(NSString *)registerStatusDesc
          personNumber:(NSString *)personNumber;

@end

NS_ASSUME_NONNULL_END
