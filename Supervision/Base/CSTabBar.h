//
//  CSTabBar.h
//  CaiShiTikuNew
//
//  Created by 夏江福 on 2019/5/29.
//  Copyright © 2019 夏江福. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, CSTabBarCenterButtonPosition){
    CSTabBarCenterButtonPositionCenter,         // 居中
    CSTabBarCenterButtonPositionBulge,          // 凸出一半
    CSTabBarCenterButtonPositionCenterImage,    // 居中背景图
};

@interface CSTabBar : UITabBar

/**
 中间按钮
 */
@property (nonatomic, strong) UIButton *centerBtn;

/**
 中间按钮图片
 */
@property (nonatomic, strong) UIImage *centerImage;
/**
 中间按钮选中图片
 */
@property (nonatomic, strong) UIImage *centerSelectedImage;

/**
 中间按钮偏移量,两种可选，也可以使用centerOffsetY 自定义
 */
@property (nonatomic, assign) CSTabBarCenterButtonPosition position;

/**
 中间按钮偏移量，默认是居中
 */
@property (nonatomic, assign) CGFloat centerOffsetY;

/**
 中间按钮的宽和高，默认使用图片宽高
 */
@property (nonatomic, assign) CGFloat centerWidth, centerHeight;


/// 中间图片样式
@property (nonatomic, strong) UIImageView   *centerImageView;
@property (nonatomic, assign) CGFloat       centerImageHeight;
- (void)setCenterImageViewWithImage:(UIImage *)centerImage;
@property (nonatomic, strong) UIView        *topViewLin;


@end

NS_ASSUME_NONNULL_END
