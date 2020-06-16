//
//  SelectedDateView.m
//  Supervision
//
//  Created by 黄琦 on 2020/5/21.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "SelectedDateView.h"

@interface SelectedDateView()
@property (weak, nonatomic) IBOutlet UIDatePicker *dataPicker;

@end

@implementation SelectedDateView


- (instancetype)init{
    self = [super init];
    if (self) {
        //ARRewardView : 自定义的view名称
        NSArray *nibView =  [[NSBundle mainBundle] loadNibNamed:@"SelectedDateView" owner:self options:nil];
        self = [nibView objectAtIndex:0];
//        self.dataPicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:0];
//        self.dataPicker.maximumDate = [NSDate dateWithTimeIntervalSinceNow:60*60*24*30];
    }
    
    return self;
}

- (void)setRuZhuTime:(NSString *)time{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDate *currentDate = [NSDate date];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate];
    
    NSDate *date = [calendar dateFromComponents:components];
    
//    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval currentTime = [date timeIntervalSince1970];
    NSString *currentTimeStr = [NSString stringWithFormat:@"%.0f", currentTime];
    
    if (currentTimeStr.intValue < time.intValue ) {
        
        int shicha = time.intValue - currentTimeStr.intValue;
        
        self.dataPicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:shicha];
        self.dataPicker.maximumDate = [NSDate dateWithTimeIntervalSinceNow:60*60*24*30 + shicha];
    }
}

- (IBAction)cancelBtn:(id)sender {
    if (self.delegate) {
        [self.delegate cancelBtn];
    }
}
- (IBAction)comfirmBtn:(id)sender {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //设置时间格式
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *dateStr = [formatter stringFromDate:self.dataPicker.date];
    
    if (self.delegate) {
        [self.delegate selectedDate:dateStr];
    }
}

@end
