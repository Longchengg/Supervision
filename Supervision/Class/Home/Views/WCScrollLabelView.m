//
//  WCScrollLabelView.m
//  WCScrollLabelViewDemo
//
//  Created by 乔伟成 on 2017/4/19.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

#import "WCScrollLabelView.h"
@interface WCScrollLabelView ()
/**
 容器view
 */
@property (nonatomic, strong) UIView *container;
/**
 正在显示的label
 */
@property (nonatomic, strong) UILabel *currentLabel;
/**
 下一个要显示的label
 */
@property (nonatomic, strong) UILabel *willShowLabel;
/**
 计时器
 */
@property (nonatomic, strong) NSTimer *timer;
/**
 当前显示的title下标
 */
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation WCScrollLabelView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _currentIndex = 0;
        _stayInterval = 1;
        _animationDuration = 1;
        _contentInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [self addSubview:self.container];
        [self.container addSubview:self.currentLabel];
        [self.container addSubview:self.willShowLabel];
        [self setTapGesture];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.container.frame = CGRectMake(_contentInsets.left,
                                      _contentInsets.top,
                                      CGRectGetWidth(self.frame) - _contentInsets.left - _contentInsets.right,
                                      CGRectGetHeight(self.frame) - _contentInsets.top - _contentInsets.bottom);
    
    self.currentLabel.frame = CGRectMake(0,
                                         0,
                                         CGRectGetWidth(self.container.frame),
                                         CGRectGetHeight(self.container.frame));
    self.willShowLabel.frame = CGRectMake(0,
                                          CGRectGetHeight(self.container.frame),
                                          CGRectGetWidth(self.container.frame),
                                          CGRectGetHeight(self.container.frame));
}

- (void)beginScrolling
{
    [self creatTimer];
}
- (void)creatTimer
{
    if (_timer == nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:self.stayInterval target:self selector:@selector(startTimer) userInfo:nil repeats:YES];
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}
- (void)startTimer
{
    if (self.titleArray.count < 2) {
        return;
    }
    [UIView animateWithDuration:0.5 animations:^{
        self->_currentLabel.frame = CGRectMake(0,
                                               -CGRectGetHeight(self.container.frame),
                                               CGRectGetWidth(self->_currentLabel.frame),
                                               CGRectGetHeight(self->_currentLabel.frame));
        self->_willShowLabel.frame = CGRectMake(0,
                                                0,
                                                CGRectGetWidth(self->_willShowLabel.frame),
                                                CGRectGetHeight(self->_willShowLabel.frame));
    } completion:^(BOOL finished) {
        self->_currentLabel.frame = CGRectMake(0,
                                               CGRectGetHeight(self.container.frame),
                                               CGRectGetWidth(self->_currentLabel.frame),
                                               CGRectGetHeight(self->_currentLabel.frame));
        UILabel *label = self->_willShowLabel;
        self->_willShowLabel = self->_currentLabel;
        self->_currentLabel = label;
        self->_currentIndex++;
        if (self->_currentIndex == (self.titleArray.count-1)) {
            self->_currentLabel.text = self.titleArray[self->_currentIndex];
            self->_willShowLabel.text = self.titleArray[0];
        }else{
            if (self->_currentIndex == self.titleArray.count) {
                self->_currentIndex = 0;
            }
            self->_currentLabel.text = self.titleArray[self->_currentIndex];
            self->_willShowLabel.text = self.titleArray[self->_currentIndex+1];
        }
    }];
}
- (void)setTapGesture
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap)];
    [self addGestureRecognizer:tap];
}
- (void)didTap
{
    if (_delegate && [_delegate respondsToSelector:@selector(scrollLabelView:didClickAtIndex:)]) {
        [self.delegate scrollLabelView:self didClickAtIndex:_currentIndex];
    }
}
- (void)dealloc
{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}
//MARK: - setter
- (void)setTitleArray:(NSMutableArray *)titleArray
{
    _titleArray = titleArray;
    if (titleArray&&titleArray.count) {
        _currentLabel.text = titleArray[0];
        if (titleArray.count>1) {
            _willShowLabel.text = titleArray[1];
        }
    }
}
- (void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    self.currentLabel.font = titleFont;
    self.willShowLabel.font = titleFont;
}
- (void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    self.currentLabel.textColor = titleColor;
    self.willShowLabel.textColor = titleColor;
}
- (void)setTextAligment:(NSTextAlignment)textAligment
{
    _textAligment = textAligment;
    self.currentLabel.textAlignment = textAligment;
    self.willShowLabel.textAlignment = textAligment;
}
- (void)setContentInsets:(UIEdgeInsets)contentInsets{
    _contentInsets = contentInsets;
}
//MARK: - getter
- (UIView *)container{
    if (!_container) {
        UIView *cont = [UIView new];
        cont.clipsToBounds = YES;
        _container = cont;
    }
    return _container;
}
- (UILabel *)currentLabel{
    if (!_currentLabel) {
        UILabel *label = [[UILabel alloc] init];
        _currentLabel = label;
    }
    return _currentLabel;
}
- (UILabel *)willShowLabel{
    if (!_willShowLabel) {
        UILabel *label = [[UILabel alloc] init];
        _willShowLabel = label;
    }
    return _willShowLabel;
}

@end
