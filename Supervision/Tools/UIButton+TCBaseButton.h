//
//  UIButton+TCBaseButton.h
//  linli
//
//  Created by 龙成 on 2019/10/24.
//  Copyright © 2019 ThinkingCollision. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIButton (TCBaseButton)

/// 左图右置
/// @param sender 对象
+ (UIButton *)LeftImageToRight:(UIButton *)sender;

/// 左图上置
/// @param sender 对象
+ (UIButton *)btnLayoutTopImage:(UIButton *)sender;

@end


