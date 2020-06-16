//
//  YearMonthPikerView.h
//  iOS 自定义日期年月
//
//  Created by luo_Mac on 2017/4/20.
//  Copyright © 2017年 luo_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol YearMonthPikerViewDelegate <NSObject>

- (void)selectedDate:(NSString *)YearStr MonthStr:(NSString *)MonthStr;

- (void)cancelBtn;
@end

@interface YearMonthPikerView : UIView

@property (nonatomic, weak) id<YearMonthPikerViewDelegate> delegate;

//@property (nonatomic,copy) void(^cancelBlock)();

//@property (nonatomic,copy) void(^sureBlock)(NSString*,NSString*);

@end
