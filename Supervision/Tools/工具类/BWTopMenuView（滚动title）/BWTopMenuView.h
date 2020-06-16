//
//  BWTopMenuView.h
//  BWTopMenuView
//
//  Created by syt on 2019/12/9.
//  Copyright © 2019 syt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+BWExtention.h"


NS_ASSUME_NONNULL_BEGIN

//#define k_Screen_Width  [UIScreen mainScreen].bounds.size.width
//#define k_Screen_Height [UIScreen mainScreen].bounds.size.height
//#define k_Button_Title_Font   [UIFont systemFontOfSize:16]


@interface BWTopMenuView : UIScrollView
/**
 设置选中按钮的字体颜色
 */
@property (nonatomic, strong) UIColor *selectColor;
/**
 设置未选中按钮的字体颜色
 */
@property (nonatomic, strong) UIColor *defaultColor;
/**
 设置滑动线条的背景颜色
 */
@property (nonatomic, strong) UIColor *lineColor;
/**
 顶部按钮的数据源 带模型的文本
 */
@property (nonatomic, strong) NSArray *ModelArray;
/**
 顶部按钮的数据源 文本
 */
@property (nonatomic, strong) NSArray *titleArray;
/**
顶部按钮的数据源 数字
*/
@property (nonatomic, strong) NSArray *numberArray;


@property (nonatomic, copy) void (^titleButtonClick)(NSInteger tag, UIButton *button);

/**
 外面选中按钮后，调节按钮的位置
 */
- (void)setSelectButtonWithTag:(NSInteger)tag;

/**
 顶部数据源   文字组+数字组
 */
- (void)setTextArray:(NSArray *)TextArray
            NumArray:(NSArray *)NumArray;

//证书管理
- (void)setModelCertificatemanArray:(NSArray *)ModelArray;


@end

NS_ASSUME_NONNULL_END
