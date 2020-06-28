//
//  CGXPickerViewManager.m
//  CGXPickerView
//
//  Created by 曹贵鑫 on 2018/1/8.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import "CGXPickerViewManager.h"

@interface CGXPickerViewManager ()

@end
@implementation CGXPickerViewManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _kPickerViewH = 200;
        _kTopViewH = 50;
        _pickerTitleSize  =15;
        _pickerTitleColor = [UIColor blackColor];
        _lineViewColor =CGXPickerRGBColor(225, 225, 225, 1);
        
        _titleLabelColor = CGXPickerRGBColor(80,169,236, 1);
        _titleSize = 16;
        _titleLabelBGColor = [UIColor whiteColor];
        
        _rightBtnTitle = @"确定";
        _rightBtnBGColor =  CGXPickerRGBColor(80,169,236, 1);
        _rightBtnTitleSize = 15;
        _rightBtnTitleColor = [UIColor whiteColor];
        
        _rightBtnborderColor = CGXPickerRGBColor(80,169,236, 1);
        _rightBtnCornerRadius = 3;
        _rightBtnBorderWidth = 1;
        
        _leftBtnTitle = @"取消";
        _leftBtnBGColor =  CGXPickerRGBColor(80,169,236, 1);
        _leftBtnTitleSize = 15;
        _leftBtnTitleColor = [UIColor whiteColor];
        
        _leftBtnborderColor = CGXPickerRGBColor(80,169,236, 1);
        _leftBtnCornerRadius = 3;
        _leftBtnBorderWidth = 1;
        
    }
    return self;
}
@end
