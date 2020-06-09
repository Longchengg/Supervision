//
//  BKMenuListView.m
//  bangkaoNew
//
//  Created by 龙成 on 2018/4/25.
//  Copyright © 2018年 龙成. All rights reserved.
//

#import "BKMenuListView.h"

@interface BKMenuListView () {
    //
    float       _sliderViewHeight;              //下滑线的高度
    float       _sliderViewWidthValue;          //下滑线的宽度比例
    BOOL        _sliderViewIsYuanjiao;          //下划线是否圆角
    UIColor     *_sliderViewClolr;              //下滑线的颜色
    float       _sliderViewBottom;              //下划线的底部距离
    
    //
    float       _buttonsSpacing;                //按钮之间的间距
    float       _buttonHeight;                  //按钮高度
    float       _buttonFontSize;                //按钮字体大小
    NSString    *_buttonFontName;               //按钮字体
    UIColor     *_buttonSelectTitleColor;       //按钮选择字体颜色
    UIColor     *_buttonNormalTitleColor;       //按钮默认字体颜色
}

/**
 创建类型
 */
@property (nonatomic, assign) BKMenuListViewType    listViewType;

/**
 * 数据源 - 类型为NSString
 */
@property (nonatomic, strong) NSArray               *listViewSourceArray;

/**
 选中的一个按钮
 */
@property (nonatomic, strong) UIButton              *selectItemButton;

/**
 滑动条
 */
@property (nonatomic, strong) UIView                *sliderView;

/**
 底部横线
 */
@property (nonatomic, strong) UIView                *bottomView;
/**
 是否 - 显示 - 横线
 */
@property (nonatomic, assign) BOOL                  bottomViewIsShow;

/**
 视图frame
 */
@property (nonatomic, assign) float                 viewHeight;

/**
 滚动的视图
 */
@property (nonatomic, strong) UIScrollView          *listScrollView;


/**
 背景视图
 */
@property (nonatomic, strong) UIImageView           *backimageView;

/**
 代理
 */
@property (nonatomic, weak) id<BKMenuListViewDelegate>   delegate;

@end

@implementation BKMenuListView

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithListViewType:(BKMenuListViewType)listViewType
                     dataSourceArray:(NSArray<NSString *> *)dataSourceArray
                               frame:(CGRect)frame
                            delegate:(id<BKMenuListViewDelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.listViewType               = listViewType;
        if (dataSourceArray) {
            self.listViewSourceArray    = dataSourceArray;
        }else{
            self.listViewSourceArray    = [[NSArray alloc] init];
        }
        self.delegate                   = delegate;
        [self setNormalStyle];
    }
    return self;
}


- (void)loadUI {
    
    switch (self.listViewType) {
        case BKMenuListViewTypeScrollView:{
            [self loadSubViewWithTypeScrollView];
        }
            break;
        case BKMenuListViewTypeDefault:{
            [self loadSubViewWithTypeDefault];
        }
            break;
    }
}

- (void)loadSubViewWithTypeScrollView {
    
    if (!_listScrollView) {
        [self addSubview:self.listScrollView];
    }
    [self.listScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.listScrollView addSubview:self.sliderView];
    self.sliderView.backgroundColor = _sliderViewClolr;
    self.sliderView.height          = _sliderViewHeight;
    self.sliderView.bottom          = self.height - _sliderViewBottom;
    if (_sliderViewIsYuanjiao) {
        self.sliderView.layer.cornerRadius = _sliderViewHeight/2.0f;
    }
    [self loadSubViewHuadongAndSetSize];
}

- (void)loadSubViewWithTypeDefault{
    [self addSubview:self.sliderView];
    self.sliderView.backgroundColor = _sliderViewClolr;
    self.sliderView.height          = _sliderViewHeight;
    self.sliderView.bottom          = self.height - _sliderViewBottom;
    if (_sliderViewIsYuanjiao) {
        self.sliderView.layer.cornerRadius = _sliderViewHeight/2.0f;
    }
    [self addSubview:self.bottomView];
    [self loadSubViewSetSize];
}

#pragma mark -
#pragma mark    delegate


#pragma mark -
#pragma mark    event

/// 设置 - 选择的下标 - 不回调
/// @param indexNumber 选择下标
- (void)setSelectIndexNohuidiao:(NSInteger)indexNumber {
    
    UIButton *onclickButton = nil;
    if (_listScrollView) {
        onclickButton  = [self.listScrollView viewWithTag:indexNumber + 1000];
    }else{
        onclickButton  = [self viewWithTag:indexNumber + 1000];
    }
    UIFont *btnFontOne;
    UIFont *btnFont;
    if (_buttonFontName) {
        btnFontOne  = [UIFont fontWithName:_buttonFontName size:_buttonFontSize];
        btnFont     = [UIFont fontWithName:_buttonFontName size:_buttonFontSize];
    }
    else {
        btnFontOne  = [UIFont fontWithName:@"PingFangSC-Medium" size:_buttonFontSize + 1];
        btnFont     = [UIFont fontWithName:@"PingFangSC-Regular" size:_buttonFontSize];
    }

    if (self.selectItemButton.tag != onclickButton.tag) {
        self.selectItemButton.selected = NO;
        if (self.listViewType == BKMenuListViewTypeScrollView) {
            self.selectItemButton.titleLabel.font = btnFont;
        }
        self.selectItemButton = onclickButton;
        indexNumber = self.selectItemButton.tag - 1000;
        [UIView animateWithDuration:0.3 animations:^{
            [self setSliderFrameLeftorWith];
            [self huaDongViewSize:indexNumber];
        }];
    }
    self.selectItemButton.selected = YES;
    if (self.listViewType == BKMenuListViewTypeScrollView) {
        self.selectItemButton.titleLabel.font = btnFontOne;
    }
}

//设置默认选择 的下标
- (void)setNormalSelectIndex:(NSInteger)indexNumber {
    UIButton *onclickButton = nil;
    if (_listScrollView) {
        onclickButton  = [self.listScrollView viewWithTag:indexNumber + 1000];
    }else{
        onclickButton  = [self viewWithTag:indexNumber + 1000];
    }
    if ([onclickButton isKindOfClass:[self class]]) {
        return;
    }
    [self headSelectButtonOnclick:onclickButton];
}

//列表item按钮点击事件
- (void)headSelectButtonOnclick:(UIButton *)sender {
    
    UIFont *btnFontOne;
    UIFont *btnFont;
    if (_buttonFontName) {
        btnFontOne  = [UIFont fontWithName:_buttonFontName size:_buttonFontSize];
        btnFont     = [UIFont fontWithName:_buttonFontName size:_buttonFontSize];
    }
    else {
        btnFontOne  = [UIFont fontWithName:@"PingFangSC-Medium" size:_buttonFontSize + 1];
        btnFont     = [UIFont fontWithName:@"PingFangSC-Regular" size:_buttonFontSize];
    }
    
    NSInteger indexNumber = (int)sender.tag - 1000;
    if (self.selectItemButton.tag != sender.tag) {
        self.selectItemButton.selected = NO;
        if (self.listViewType == BKMenuListViewTypeScrollView) {
            self.selectItemButton.titleLabel.font = btnFont;
        }
        self.selectItemButton = sender;
        indexNumber = self.selectItemButton.tag - 1000;
        [UIView animateWithDuration:0.3 animations:^{
            [self setSliderFrameLeftorWith];
            [self huaDongViewSize:indexNumber];
        }];
    }
    self.selectItemButton.selected = YES;
    if (self.listViewType == BKMenuListViewTypeScrollView) {
        self.selectItemButton.titleLabel.font = btnFontOne;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(menuListView:selectButtonCallbackIndex:)]) {
        [self.delegate menuListView:self selectButtonCallbackIndex:indexNumber];
    }
}

#pragma mark -
#pragma mark    method

//设置数据源
- (void)setViewDataSourceArray:(NSArray<NSString *> *)dataSourceArrray{
    _listViewSourceArray    = dataSourceArrray;
}

//创建 -- 可滑动列表视图
- (void)loadSubViewHuadongAndSetSize {

    
    float buttonLeftSpacing = 0.0f;
    for (int i = 0; i < self.listViewSourceArray.count; i++) {
        NSString *title = self.listViewSourceArray[i];
        
        //[UIFont systemFontOfSize:_buttonFontSize];
        
        UIFont *btnFontOne;
        UIFont *btnFont;
        if (_buttonFontName) {
            btnFontOne  = [UIFont fontWithName:_buttonFontName size:_buttonFontSize];
            btnFont     = [UIFont fontWithName:_buttonFontName size:_buttonFontSize];
        }
        else {
            btnFontOne  = [UIFont fontWithName:@"PingFangSC-Medium" size:_buttonFontSize + 1];
            btnFont     = [UIFont fontWithName:@"PingFangSC-Regular" size:_buttonFontSize];
        }
        
        float buttonWidth = [NSString widthForString:title uifont:btnFontOne andHight:_buttonHeight];
        if (buttonWidth < 50) {
            buttonWidth = 50.0f;
        }
        UIButton *headSelectButton = [[UIButton alloc] init];
        [self.listScrollView addSubview:headSelectButton];
        if ((_buttonsSpacing > 40 && i == 0) || (_buttonsSpacing > 20 && i == 0)) {
            headSelectButton.frame = CGRectMake(buttonLeftSpacing + 10, 0, buttonWidth, _buttonHeight);
        }
        else {
            headSelectButton.frame = CGRectMake(buttonLeftSpacing + _buttonsSpacing, 0, buttonWidth, _buttonHeight);
        }
        [headSelectButton setTitle:title forState:UIControlStateNormal];
        headSelectButton.titleLabel.font = btnFont;
        [headSelectButton setTitleColor:_buttonNormalTitleColor forState:UIControlStateNormal];
        [headSelectButton setTitleColor:_buttonSelectTitleColor forState:UIControlStateSelected];
        [headSelectButton addTarget:self action:@selector(headSelectButtonOnclick:) forControlEvents:UIControlEventTouchUpInside];
        headSelectButton.tag = i + 1000;
        if (i == 0) {
            headSelectButton.selected = YES;
            self.selectItemButton = headSelectButton;
        }
        buttonLeftSpacing = headSelectButton.right;
    }
    [self setSliderFrameLeftorWith];
    self.listScrollView.contentSize = CGSizeMake(buttonLeftSpacing + _buttonsSpacing, self.height);
}

//创建 -- 不可滑动 - 列表视图
- (void)loadSubViewSetSize{
    
    float buttonLeftSpacing = 0.0f;
    for (int i = 0; i < self.listViewSourceArray.count; i++) {
        NSString *title = self.listViewSourceArray[i];
        
        UIFont *btnFont;
        if (_buttonFontName) {
            btnFont =    [UIFont fontWithName:_buttonFontName size:_buttonFontSize];
        }
        else {
            btnFont =    [UIFont systemFontOfSize:_buttonFontSize];
        }
        
        float buttonWidth = self.width/self.listViewSourceArray.count;
        UIButton *headSelectButton = [[UIButton alloc] init];
        [self addSubview:headSelectButton];
        headSelectButton.frame = CGRectMake(buttonLeftSpacing, 0, buttonWidth, _buttonHeight);
        [headSelectButton setTitle:title forState:UIControlStateNormal];
        headSelectButton.titleLabel.font = btnFont;
        [headSelectButton setTitleColor:_buttonNormalTitleColor forState:UIControlStateNormal];
        [headSelectButton setTitleColor:_buttonSelectTitleColor forState:UIControlStateSelected];
        [headSelectButton addTarget:self action:@selector(headSelectButtonOnclick:) forControlEvents:UIControlEventTouchUpInside];
        headSelectButton.tag = i + 1000;
        if (i == 0) {
            headSelectButton.selected = YES;
            self.selectItemButton = headSelectButton;
        }
        buttonLeftSpacing = headSelectButton.right;
    }
    [self setSliderFrameLeftorWith];
}


/**
 设置默认的样式
 */
- (void)setNormalStyle{
    
    _sliderViewHeight       = 1.0f;
    _sliderViewClolr        = RGB(9, 151, 249);
    _sliderViewWidthValue   = 1.0f;
    
    _buttonsSpacing         = 10.0f;
    _buttonFontSize         = 15.0f;
    _buttonHeight           = self.height - 2;
    _buttonNormalTitleColor = RGB(146, 146, 146);
    _buttonSelectTitleColor = RGB(9, 151, 249);
    
    _bottomViewIsShow       = YES;
}

- (void)updatNormalStyle{
    _sliderViewClolr        = RGB(238, 159, 0);
    _buttonNormalTitleColor = RGB(255, 255, 255);
    _buttonSelectTitleColor = RGB(238, 159, 0);
}

- (void)setBackgroundImage:(NSString *)imageString{
    
    //lioatian_icon_back
    if (!_backimageView) {
        self.backimageView = [[UIImageView alloc] init];
        [self addSubview:self.backimageView];
        [self.backimageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(0);
        }];
    }
    [self.backimageView setImage:[UIImage imageNamed:imageString]];
    [self sendSubviewToBack:self.backimageView];
    self.backgroundColor = [UIColor clearColor];
}


//设置按钮样式
- (void)setListButtonWithFontSize:(float)fonSize height:(float)height selectTitleColor:(UIColor *)selectColor normalTitleColor:(UIColor *)normalColor {
    // - N
    _buttonFontSize         = fonSize;
    _buttonHeight           = height;
    if (selectColor) {
        _buttonSelectTitleColor = selectColor;
    }
    if (normalColor) {
        _buttonNormalTitleColor = normalColor;
    }
}

/**
 设置 - 按钮 - 字体
 
 @param fontName 字体名称
 */
- (void)setListButtonWithFontName:(NSString *)fontName {
    _buttonFontName = fontName;
}

- (void)setListButtonWithSpacing:(float)buttonsSpacing {
    _buttonsSpacing = buttonsSpacing;
}

- (void)setListButtonSelectTitleColor:(UIColor *)selectColor normalTitleColor:(UIColor *)normalColor{
    if (selectColor) {
        _buttonSelectTitleColor = selectColor;
    }
    if (normalColor) {
        _buttonNormalTitleColor = normalColor;
    }
}

//设置滑动条样式
- (void)setSliderViewHeight:(float)height color:(UIColor *)color widthValue:(float)widthValue {
    
    _sliderViewHeight       = height;
    _sliderViewClolr        = color;
    _sliderViewWidthValue   = widthValue;
}

- (void)setSliderViewBottom:(float)bottomHeight {
    _sliderViewBottom       = bottomHeight;
}

- (void)setSliderViewHeight:(float)height color:(UIColor *)color widthValue:(float)widthValue andIsYuanJiao:(BOOL)isYuanjiao {
    
    _sliderViewIsYuanjiao      = isYuanjiao;
    [self setSliderViewHeight:height color:color widthValue:widthValue];
}

/**
 设置 - 底部 - 横线 - 是否显示
 
 @param bottomViewIsShow 是否显示
 */
- (void)setValueBottomViewIsShow:(BOOL)bottomViewIsShow {
    _bottomViewIsShow = bottomViewIsShow;
}

/**
 设置滑动条的左边 - 宽度
 */
- (void)setSliderFrameLeftorWith{
    
    float sliderViewWidth   = self.selectItemButton.width * _sliderViewWidthValue;
    self.sliderView.width   = sliderViewWidth;
    self.sliderView.left    = self.selectItemButton.left + (self.selectItemButton.width - sliderViewWidth)/2;
    if (_bottomView && _bottomViewIsShow) {
        self.bottomView.frame = CGRectMake(0, self.height - 1, self.width, 1);
        self.bottomView.backgroundColor = RGB(222, 222, 222);
    }
}

/**
 点击下标后的滑动计算

 @param index 下标
 */
- (void)huaDongViewSize:(NSInteger)index{
    
    if (self.listViewType == BKMenuListViewTypeScrollView) {
        float offsetCenter  = self.selectItemButton.centerX;
        if (offsetCenter > self.width/2 && self.listScrollView.contentSize.width > self.width) {
            if ((self.listScrollView.contentSize.width - self.width/2) < offsetCenter) {
                self.listScrollView.contentOffset = CGPointMake(self.listScrollView.contentSize.width - self.width, 0);
            }else{
                self.listScrollView.contentOffset = CGPointMake(offsetCenter - self.width/2, 0);
            }
        }else{
            self.listScrollView.contentOffset = CGPointMake(0, 0);
        }
    }
}

#pragma mark -
#pragma mark    getter/setter

- (UIScrollView *)listScrollView{
    if (_listScrollView) {
        return _listScrollView;
    }
    _listScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    [_listScrollView setShowsHorizontalScrollIndicator:NO];
    _listScrollView.scrollEnabled = YES;
    _listScrollView.backgroundColor = [UIColor clearColor];
    return _listScrollView;
}

- (UIView *)sliderView{
    if (_sliderView) {
        return _sliderView;
    }
    _sliderView = [[UIView alloc] init];
    return _sliderView;
}

- (UIView *)bottomView{
    if (_bottomView) {
        return _bottomView;
    }
    _bottomView = [[UIView alloc] init];
    return _bottomView;
}

@end
