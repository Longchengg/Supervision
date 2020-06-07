//
//  TCBaseViewController.h
//  Supervision
//
//  Created by 龙成 on 2019/10/23.
//  Copyright © 2019 ThinkingCollision. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    KLeftButtonBlackStyle,
    KLeftButtonWhiteStyle,
} LeftButtonStyle;


@interface TCBaseViewController : UIViewController

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, assign) LeftButtonStyle leftButtonStyle;

@property (nonatomic, strong) UIButton *rightBtn;

- (void)setVCTitle:(NSString *)title;

- (void)showAlertMsg:(NSString *)message;

- (void)setVCTitleColor:(UIColor *)color;

- (void)leftBtn:(UIButton *)leftBtn;

/// 设置右侧按钮
/// @param title 标题
/// @param color 颜色
- (void)setRightBtn:(NSString *)title color:(UIColor *)color;

/// 设置右侧按钮图标
/// @param img 图片
- (void)setRightBtnImage:(UIImage *)img;


- (void)rightBtn:(UIButton *)rightBtn;

@end

