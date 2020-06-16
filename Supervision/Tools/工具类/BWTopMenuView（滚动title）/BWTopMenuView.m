//
//  BWTopMenuView.m
//  BWTopMenuView
//
//  Created by syt on 2019/12/9.
//  Copyright © 2019 syt. All rights reserved.
//

#import "BWTopMenuView.h"

#import "to3BlackListSrcollModel.h"
#import "CertificatemanagementModel.h"
@interface BWTopMenuView ()

@property (nonatomic, strong) UIButton *selectButton;
@property (nonatomic, strong) UIView *indicatorView;
@property (nonatomic, strong) NSMutableArray *buttonArray;
@property (nonatomic, strong) to3BlackListSrcollModel *toModel;
@property (nonatomic, strong) CertificatemanagementModel *certificatemanagementModel;



@end
/**
 按钮之间的间距
 */
static CGFloat const btnSpace = 10.0;
/**
 指示器的高度
 */
static CGFloat const lineH = 2.0;
/**
 形变的度数
 */
static CGFloat const radio = 0.8;

@implementation BWTopMenuView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
        self.showsHorizontalScrollIndicator = NO;
        self.bounces = NO;
        self.defaultColor = UIColor.blackColor;
        self.selectColor = UIColor.blueColor;
        self.lineColor = UIColor.blueColor;
    }
    return self;
}



#pragma mark - setter方法
- (void)setSelectColor:(UIColor *)selectColor
{
    _selectColor = selectColor;
}

- (void)setDefaultColor:(UIColor *)defaultColor
{
    _defaultColor = defaultColor;
}

- (void)setLineColor:(UIColor *)lineColor
{
    _lineColor = lineColor;
}
//文本组
- (void)setModelCertificatemanArray:(NSArray *)ModelArray
{
    CGFloat bw_x = 0.0;
    CGFloat bw_y = 0.0;
    CGFloat bw_h = self.Bw_height - lineH;
    if (ModelArray.count > 0) {
        for (int i = 0; i < ModelArray.count; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            _certificatemanagementModel = [CertificatemanagementModel mj_objectWithKeyValues:ModelArray[i]];
            NSString *title = [NSString stringWithFormat:@"%@(%@)",_certificatemanagementModel.certCategoryName,_certificatemanagementModel.count];
            [button setTitle:title forState:UIControlStateNormal];
            [button setTitleColor:self.defaultColor forState:UIControlStateNormal];
            [button setTitleColor:self.selectColor forState:UIControlStateSelected];
            button.titleLabel.font =  [UIFont systemFontOfSize:16];
            button.tag = i;
            CGSize size = [self sizeWithText:title font: [UIFont systemFontOfSize:16] maxSize:CGSizeMake(SCREEN_WIDTH, MAXFLOAT)];
            CGFloat bw_w = size.width + btnSpace * 2;
            button.frame = CGRectMake(bw_x, bw_y, bw_w, bw_h);
            bw_x += bw_w;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            if (i == 0) {
                button.selected = YES;
                self.selectButton = button;
            }
            [self addSubview:button];
            [self.buttonArray addObject:button];
            
//            button.badgeValue =@"10";
//            button.badgeOriginX = 100;
//            button.badgeOriginY = 10;
//            button.badgeBGColor = [UIColor orangeColor];
        }
        // 计算ScrollView的宽度，设置contentSize
        CGFloat scrollWid = CGRectGetMaxX(self.subviews.lastObject.frame);
        self.contentSize = CGSizeMake(scrollWid, self.Bw_height);
        
        UIButton *button = self.subviews.firstObject;
        UIView *indicatorView = [[UIView alloc] init];
        indicatorView.backgroundColor = self.lineColor;
        indicatorView.Bw_height = lineH;
        indicatorView.Bw_y = self.Bw_height - lineH * 2;
        indicatorView.Bw_width = (button.Bw_width - 2 * btnSpace)*radio;
        indicatorView.Bw_centerX = button.Bw_centerX;
        self.indicatorView = indicatorView;
        [self addSubview:indicatorView];
    }
}
//文本组
- (void)setModelArray:(NSArray *)ModelArray
{
    CGFloat bw_x = 0.0;
    CGFloat bw_y = 0.0;
    CGFloat bw_h = self.Bw_height - lineH;
    if (ModelArray.count > 0) {
        for (int i = 0; i < ModelArray.count; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            _toModel = [to3BlackListSrcollModel mj_objectWithKeyValues:ModelArray[i]];
            NSString *title = [NSString stringWithFormat:@"%@(%@)",_toModel.certCategoryName,_toModel.count];
            [button setTitle:title forState:UIControlStateNormal];
            [button setTitleColor:self.defaultColor forState:UIControlStateNormal];
            [button setTitleColor:self.selectColor forState:UIControlStateSelected];
            button.titleLabel.font =  [UIFont systemFontOfSize:16];
            button.tag = i;
            CGSize size = [self sizeWithText:title font: [UIFont systemFontOfSize:16] maxSize:CGSizeMake(SCREEN_WIDTH, MAXFLOAT)];
            CGFloat bw_w = size.width + btnSpace * 2;
            button.frame = CGRectMake(bw_x, bw_y, bw_w, bw_h);
            bw_x += bw_w;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            if (i == 0) {
                button.selected = YES;
                self.selectButton = button;
            }
            [self addSubview:button];
            [self.buttonArray addObject:button];
            
//            button.badgeValue =@"10";
//            button.badgeOriginX = 100;
//            button.badgeOriginY = 10;
//            button.badgeBGColor = [UIColor orangeColor];
        }
        // 计算ScrollView的宽度，设置contentSize
        CGFloat scrollWid = CGRectGetMaxX(self.subviews.lastObject.frame);
        self.contentSize = CGSizeMake(scrollWid, self.Bw_height);
        
        UIButton *button = self.subviews.firstObject;
        UIView *indicatorView = [[UIView alloc] init];
        indicatorView.backgroundColor = self.lineColor;
        indicatorView.Bw_height = lineH;
        indicatorView.Bw_y = self.Bw_height - lineH * 2;
        indicatorView.Bw_width = (button.Bw_width - 2 * btnSpace)*radio;
        indicatorView.Bw_centerX = button.Bw_centerX;
        self.indicatorView = indicatorView;
        [self addSubview:indicatorView];
    }
}

//文本组
- (void)setTitleArray:(NSArray *)titleArray
{
    _titleArray = titleArray;
    CGFloat bw_x = 0.0;
    CGFloat bw_y = 0.0;
    CGFloat bw_h = self.Bw_height - lineH;
    if (titleArray.count > 0) {
        for (int i = 0; i < titleArray.count; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            NSString *title = [NSString stringWithFormat:@"%@", titleArray[i]];
            [button setTitle:title forState:UIControlStateNormal];
            [button setTitleColor:self.defaultColor forState:UIControlStateNormal];
            [button setTitleColor:self.selectColor forState:UIControlStateSelected];
            button.titleLabel.font =  [UIFont systemFontOfSize:16];
            button.tag = i;
            CGSize size = [self sizeWithText:title font: [UIFont systemFontOfSize:16] maxSize:CGSizeMake(SCREEN_WIDTH, MAXFLOAT)];
            CGFloat bw_w = size.width + btnSpace * 2;
            button.frame = CGRectMake(bw_x, bw_y, bw_w, bw_h);
            bw_x += bw_w;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            if (i == 0) {
                button.selected = YES;
                self.selectButton = button;
            }
            [self addSubview:button];
            [self.buttonArray addObject:button];
            
//            button.badgeValue =@"10";
//            button.badgeOriginX = 100;
//            button.badgeOriginY = 10;
//            button.badgeBGColor = [UIColor orangeColor];
        }
        // 计算ScrollView的宽度，设置contentSize
        CGFloat scrollWid = CGRectGetMaxX(self.subviews.lastObject.frame);
        self.contentSize = CGSizeMake(scrollWid, self.Bw_height);
        
        UIButton *button = self.subviews.firstObject;
        UIView *indicatorView = [[UIView alloc] init];
        indicatorView.backgroundColor = self.lineColor;
        indicatorView.Bw_height = lineH;
        indicatorView.Bw_y = self.Bw_height - lineH * 2;
        indicatorView.Bw_width = (button.Bw_width - 2 * btnSpace)*radio;
        indicatorView.Bw_centerX = button.Bw_centerX;
        self.indicatorView = indicatorView;
        [self addSubview:indicatorView];
    }
}

- (void)setTextArray:(NSArray *)TextArray
            NumArray:(NSArray *)NumArray{
        CGFloat bw_x = 0.0;
        CGFloat bw_y = 0.0;
        CGFloat bw_h = self.Bw_height - lineH;
        if (TextArray.count > 0) {
            for (int i = 0; i < TextArray.count; i++) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                NSString *title = [NSString stringWithFormat:@"%@(%@)", TextArray[i],NumArray[i]];
                [button setTitle:title forState:UIControlStateNormal];
                [button setTitleColor:self.defaultColor forState:UIControlStateNormal];
                [button setTitleColor:self.selectColor forState:UIControlStateSelected];
                button.titleLabel.font =  [UIFont systemFontOfSize:16];
                button.tag = i;
                CGSize size = [self sizeWithText:title font: [UIFont systemFontOfSize:16] maxSize:CGSizeMake(SCREEN_WIDTH, MAXFLOAT)];
                CGFloat bw_w = size.width + btnSpace * 2;
                button.frame = CGRectMake(bw_x, bw_y, bw_w, bw_h);
                bw_x += bw_w;
                [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
                if (i == 0) {
                    button.selected = YES;
                    self.selectButton = button;
                }
                [self addSubview:button];
                [self.buttonArray addObject:button];
                
    //            button.badgeValue =@"10";
    //            button.badgeOriginX = 100;
    //            button.badgeOriginY = 10;
    //            button.badgeBGColor = [UIColor orangeColor];
            }
            // 计算ScrollView的宽度，设置contentSize
            CGFloat scrollWid = CGRectGetMaxX(self.subviews.lastObject.frame);
            self.contentSize = CGSizeMake(scrollWid, self.Bw_height);
            
            UIButton *button = self.subviews.firstObject;
            UIView *indicatorView = [[UIView alloc] init];
            indicatorView.backgroundColor = self.lineColor;
            indicatorView.Bw_height = lineH;
            indicatorView.Bw_y = self.Bw_height - lineH * 2;
            indicatorView.Bw_width = (button.Bw_width - 2 * btnSpace)*radio;
            indicatorView.Bw_centerX = button.Bw_centerX;
            self.indicatorView = indicatorView;
            [self addSubview:indicatorView];
        }
}

#pragma mark - buttonAction
- (void)buttonAction:(UIButton *)button
{
    [self setButton:button];
    // 让选中的按钮调整位置
    [self setSelectButtonCenter:button];
    if (self.titleButtonClick) {
        self.titleButtonClick(button.tag, button);
    }
}

// 设置选中按钮的状态以及指示器的位置等
- (void)setButton:(UIButton *)button
{
    self.selectButton.selected = NO;
//    self.selectButton.transform = CGAffineTransformIdentity;
    
    button.selected = YES;
//    button.transform = CGAffineTransformMakeScale(radio, radio);
    self.selectButton = button;
    
    [UIView animateWithDuration:.3f animations:^{
        self.indicatorView.Bw_width = (button.Bw_width - 2 * btnSpace)*radio;
        self.indicatorView.Bw_centerX = button.Bw_centerX;
    }];
   
}



- (void)setSelectButtonCenter:(UIButton *)centerButton
{
    CGFloat offsetX = centerButton.Bw_centerX - SCREEN_WIDTH / 2;
    CGFloat maxOffsetX = self.contentSize.width - SCREEN_WIDTH;
    if (offsetX < 0) {
        offsetX = 0;
    } else {
        if (offsetX > maxOffsetX) {
            offsetX = maxOffsetX;
        }
    }
    [self setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}


- (void)setSelectButtonWithTag:(NSInteger)tag
{
    UIButton *button = self.buttonArray[tag];
    [self setButton:button];
    [self setSelectButtonCenter:button];
}




#pragma mark - 计算按钮的宽度
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}



#pragma mark - lazy loading

- (NSMutableArray *)buttonArray
{
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}




@end
