//
//  MessageMainTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/23.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "MessageMainTableViewCell.h"
@interface MessageMainTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet UILabel *lab3;
@property (weak, nonatomic) IBOutlet UILabel *lab4;
@property (weak, nonatomic) IBOutlet UIButton *btn1;

@end
@implementation MessageMainTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)settitle:(NSString *)title
     updateTime:(NSString *)updateTime
        content:(NSString *)content
       readFlag:(BOOL)readFlag{
    if (title == nil) {
        title =@"-";
    }
    if (updateTime == nil) {
        updateTime =@"-";
    }else{
        //将对象类型的时间转换为NSDate类型
        double time =1504667976;
        NSDate * myDate=[NSDate dateWithTimeIntervalSince1970:time];
        //设置时间格式
        NSDateFormatter * formatter=[[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
        //将时间转换为字符串
        updateTime =[formatter stringFromDate:myDate];
    }
    if (content == nil) {
        content =@"-";
    }
    _lab1.text = title;
    _lab2.text = updateTime;
    _lab3.text = content;
    if (readFlag == YES) {
        _btn1.selected = YES;
    }else{
        _btn1.selected = NO;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

@end
