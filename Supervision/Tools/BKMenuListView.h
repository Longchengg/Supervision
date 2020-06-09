//
//  BKMenuListView.h
//  bangkaoNew
//
//  Created by 龙成 on 2018/4/25.
//  Copyright © 2018年 龙成. All rights reserved.
//

#import "BKMenuListView.h"
@class BKMenuListView;

typedef NS_ENUM(NSInteger,BKMenuListViewType) {
    BKMenuListViewTypeScrollView = 0,           //创建一个可滑动的列表视图
    BKMenuListViewTypeDefault,                  //创建一个默认的
};

@protocol BKMenuListViewDelegate <NSObject>

/**
 选择下标按钮 - 回调下标

 @param indexNumber 下标
 */
- (void)menuListView:(BKMenuListView *)menuListView selectButtonCallbackIndex:(NSInteger)indexNumber;

@end

@interface BKMenuListView : UIView

- (instancetype)initWithListViewType:(BKMenuListViewType)listViewType
                     dataSourceArray:(NSArray<NSString *> *)dataSourceArray
                               frame:(CGRect)frame
                            delegate:(id<BKMenuListViewDelegate>)delegate;

/**
 设置按钮的样式

 @param fonSize             字体大小
 @param height              按钮高度
 @param selectColor         按钮选中颜色
 @param normalColor         默认颜色
 */
- (void)setListButtonWithFontSize:(float)fonSize height:(float)height selectTitleColor:(UIColor *)selectColor normalTitleColor:(UIColor *)normalColor;

/**
 设置 - 按钮 - 字体

 @param fontName 字体名称
 */
- (void)setListButtonWithFontName:(NSString *)fontName;

/**
 设置 - 按钮 - 按钮间 间距

 @param buttonsSpacing 间距
 */
- (void)setListButtonWithSpacing:(float)buttonsSpacing;

/**
 设置按钮字体颜色

 @param selectColor 选择
 @param normalColor 默认
 */
- (void)setListButtonSelectTitleColor:(UIColor *)selectColor normalTitleColor:(UIColor *)normalColor;

/**
 设置滑动条样式

 @param height              高度
 @param color               颜色
 @param widthValue          宽度比例值 0-1 -- 相对与按钮的宽度
 */
- (void)setSliderViewHeight:(float)height color:(UIColor *)color widthValue:(float)widthValue;

/**
 设置 - 滑动条样式

 @param bottomHeight 距离底部高度
 */
- (void)setSliderViewBottom:(float)bottomHeight;

/**
 设置滑动条样式
 
 @param height              高度
 @param color               颜色
 @param widthValue          宽度比例值 0-1 -- 相对与按钮的宽度
 @param isYuanjiao          是否圆角
 */
- (void)setSliderViewHeight:(float)height color:(UIColor *)color widthValue:(float)widthValue andIsYuanJiao:(BOOL)isYuanjiao;

/**
 设置 - 底部 - 横线 - 是否显示

 @param bottomViewIsShow 是否显示
 */
- (void)setValueBottomViewIsShow:(BOOL)bottomViewIsShow;

/**
 设置数据源

 @param dataSourceArrray 数据源
 */
- (void)setViewDataSourceArray:(NSArray<NSString *> *)dataSourceArrray;


/**
 外部调用 - 修改样式
 */
- (void)updatNormalStyle;

/**
 设置背景图片

 @param imageString 图片
 */
- (void)setBackgroundImage:(NSString *)imageString;

/**
 加载视图  - 一切设置完毕加载
 */
- (void)loadUI;


/**
 设置默认选择的下标

 @param indexNumber 下标
 */
- (void)setNormalSelectIndex:(NSInteger)indexNumber;

/// 设置 - 选择的下标 - 不回调
/// @param indexNumber 选择下标
- (void)setSelectIndexNohuidiao:(NSInteger)indexNumber;

@end
