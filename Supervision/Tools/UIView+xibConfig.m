//
//  UIView+xibConfig.m
//  Supervision
//
//  Created by 龙成 on 2017/4/19.
//  Copyright © 2017年 Supervision All rights reserved.
//

#import "UIView+xibConfig.h"

@implementation UIView (xibConfig)

-(UIColor*)borderUIColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}
-(void)setLayerColor:(UIColor *)LayerColor_ {
    self.layer.borderColor = LayerColor_.CGColor;
}
- (UIColor *)LayerColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setLayerWidth:(CGFloat)LayerWidth_ {
    self.layer.borderWidth = LayerWidth_;
    self.layer.allowsEdgeAntialiasing = YES;// 解决layer.border.width随着view的放大，会出现锯齿化的问题（iOS7.0）
}
- (CGFloat)LayerWidth {
    return self.layer.borderWidth;
}

- (void)setLayerRadius:(CGFloat)LayerRadius_ {
    self.layer.cornerRadius = LayerRadius_;
}
- (CGFloat)LayerRadius {
    return self.layer.cornerRadius;
}

- (void)setShadowOffset:(CGSize)ShadowOffset_ {
    self.layer.shadowOffset = ShadowOffset_;
}
- (CGSize)ShadowOffset {
    return self.layer.shadowOffset;
}

- (void)setShadowRadius:(CGFloat)ShadowRadius_ {
    self.layer.shadowRadius = ShadowRadius_;
}
- (CGFloat)ShadowRadius {
    return self.layer.shadowRadius;
}

- (void)setShadowOpacity:(CGFloat)ShadowOpacity_ {
    self.layer.shadowOpacity = ShadowOpacity_;
}
- (CGFloat)ShadowOpacity {
    return self.layer.shadowOpacity;
}

- (void)setShadowColor:(UIColor *)ShadowColor_ {
    self.layer.shadowColor = ShadowColor_.CGColor;
}
- (UIColor *)ShadowColor {
    return [UIColor colorWithCGColor:self.layer.shadowColor];
}

@end
