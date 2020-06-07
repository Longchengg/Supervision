//
//  UIView+xibConfig.h
//  Supervision
//
//  Created by 龙成 on 2017/4/19.
//  Copyright © 2017年 Supervision All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (xibConfig)


@property (nonatomic, assign) IBInspectable UIColor *LayerColor;
@property (nonatomic, assign) IBInspectable CGFloat  LayerWidth;
@property (nonatomic, assign) IBInspectable CGFloat  LayerRadius;

@property (nonatomic, assign) IBInspectable CGSize   ShadowOffset;
@property (nonatomic, assign) IBInspectable CGFloat  ShadowRadius;
@property (nonatomic, assign) IBInspectable CGFloat  ShadowOpacity;
@property (nonatomic, assign) IBInspectable UIColor *ShadowColor;

@end
