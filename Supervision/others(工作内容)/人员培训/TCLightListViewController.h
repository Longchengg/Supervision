//
//  TCLightListViewController.h
//  linli
//
//  Created by 黄琦 on 2019/12/31.
//  Copyright © 2019 ThinkingCollision. All rights reserved.
//

#import "TCBaseViewController.h"

typedef enum : NSUInteger {
    KAllGoodsStyle = 0,
    KMotherAndBabyStyle = 6,
    KPaperStyle = 11,
    KFoodStyle = 35,
    KCosmeticStyle = 36,
    KFruitStyle = 37,
    KTenMinuteStyle = 55,
    KAppliancesStyle = 58,
    KKidEducationStyle = 59,
    KTelecomStyle = 60,
    KWaterServiceStyle = 66,

} MallCategoryStyle;

@interface TCLightListViewController : TCBaseViewController

@property (nonatomic, assign) MallCategoryStyle mallCategoryStyle;

@end

