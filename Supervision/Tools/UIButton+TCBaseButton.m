//
//  UIButton+TCBaseButton.m
//  linli
//
//  Created by 龙成 on 2019/10/24.
//  Copyright © 2019 ThinkingCollision. All rights reserved.
//

#import "UIButton+TCBaseButton.h"


@implementation UIButton (TCBaseButton)


+ (UIButton *)LeftImageToRight:(UIButton *)sender{
    
    [sender setNeedsLayout];
    [sender layoutIfNeeded];
    
    CGRect contentRect = sender.bounds;
    CGSize titleSize = [sender titleRectForContentRect:contentRect].size;
    CGSize imageSize = [sender imageRectForContentRect:contentRect].size;
    
    [sender setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
    [sender setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageSize.width, 0, imageSize.width)];
    [sender setImageEdgeInsets:UIEdgeInsetsMake(0, titleSize.width+5, 0, -titleSize.width - 5)];
    
    return sender;
}

+ (UIButton *)btnLayoutTopImage:(UIButton *)sender{
    
    CGSize imageSize = sender.imageView.frame.size;
    CGSize titleSize = sender.titleLabel.frame.size;
    
    // 测试的时候发现titleLabel的宽度不正确，这里进行判断处理
    CGFloat labelWidth = sender.titleLabel.intrinsicContentSize.width;
    if (titleSize.width < labelWidth) {
        titleSize.width = labelWidth;
    }
    
    // 文字距上边框的距离增加imageView的高度+间距，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [sender setTitleEdgeInsets:UIEdgeInsetsMake(imageSize.height, -imageSize.width, 0, 0.0)];
    
    // 图片距右边框的距离减少图片的宽度，距离上面的间隔，其它不变
    [sender setImageEdgeInsets:UIEdgeInsetsMake(-20, 0.0,0.0,-titleSize.width)];
    
    return sender;
}

@end
