//
//  CSTabBar.m
//  CaiShiTikuNew
//
//  Created by 龙成 on 2019/5/29.
//  Copyright © 2019 龙成. All rights reserved.
//

#import "CSTabBar.h"

#define CSTabBarItemHeight    49.0f

@interface CSTabBar ()

@end

@implementation CSTabBar

- (instancetype)init {
    
    if (self = [super init]) {
        [self initView];
    }
    return self;
}

- (void)initView {
    
    //w去掉顶部线
    _topViewLin = [[UIView alloc] init];
    [self addSubview:_topViewLin];
    //加载背景
    _centerImageHeight = 74;
    _centerImageView = [[UIImageView alloc] init];
    [self addSubview:_centerImageView];

    _centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //去除选择时高亮
    _centerBtn.adjustsImageWhenHighlighted = NO;
    [self addSubview:_centerBtn];
    
    //替换顶部
    self.backgroundImage = [UIImage new];
    self.shadowImage = [UIImage new];
    
    //添加阴影
    self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, -2);
    self.layer.shadowOpacity = 0.3;
//    self.tintColor = CSTheme_Color;
}

// 设置layout
- (void)layoutSubviews {
    [super layoutSubviews];
    
    switch (self.position) {
        case CSTabBarCenterButtonPositionCenter:
            _centerBtn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - _centerWidth)/2.0, (CSTabBarItemHeight - _centerHeight)/2.0 + self.centerOffsetY, _centerWidth, _centerHeight);
            break;
        case CSTabBarCenterButtonPositionBulge:
            _centerBtn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - _centerWidth)/2.0, -_centerHeight/3.0 + self.centerOffsetY, _centerWidth, _centerHeight);
            break;
        case CSTabBarCenterButtonPositionCenterImage:
            _centerImageView.frame = CGRectMake(0, CSTabBarItemHeight - _centerImageHeight, [UIScreen mainScreen].bounds.size.width, _centerImageHeight);
            _centerBtn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - _centerWidth)/2.0, (CSTabBarItemHeight - _centerImageHeight)/2.0 + self.centerOffsetY, _centerWidth, _centerHeight);
            _topViewLin.backgroundColor = [UIColor whiteColor];
            _topViewLin.frame = CGRectMake(0, -1, [UIScreen mainScreen].bounds.size.width, 1);
            break;
        default:
            break;
    }
}

/// 设置 - 中间背景图
/// @param centerImage 背景图
- (void)setCenterImageViewWithImage:(UIImage *)centerImage {
    _centerImageView.image = centerImage;
}

- (void)setCenterImage:(UIImage *)centerImage {
    
    _centerImage = centerImage;
    // 如果设置了宽高则使用设置的大小
    if (self.centerWidth <= 0 && self.centerHeight <= 0){
        //根据图片调整button的位置(默认居中，如果图片中心在tabbar的中间最上部，这个时候由于按钮是有一部分超出tabbar的，所以点击无效，要进行处理)
        _centerWidth = centerImage.size.width;
        _centerHeight = centerImage.size.height;
    }
    [_centerBtn setImage:centerImage forState:UIControlStateNormal];
}

- (void)setCenterSelectedImage:(UIImage *)centerSelectedImage {
    
    _centerSelectedImage = centerSelectedImage;
    [_centerBtn setImage:centerSelectedImage forState:UIControlStateSelected];
}

//处理超出区域点击无效的问题
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (self.hidden){
        return [super hitTest:point withEvent:event];
    }else {
        //转换坐标
        CGPoint tempPoint = [self.centerBtn convertPoint:point fromView:self];
        //判断点击的点是否在按钮区域内
        if (CGRectContainsPoint(self.centerBtn.bounds, tempPoint)){
            //返回按钮
            return _centerBtn;
        }else {
            return [super hitTest:point withEvent:event];
        }
    }
}


@end
