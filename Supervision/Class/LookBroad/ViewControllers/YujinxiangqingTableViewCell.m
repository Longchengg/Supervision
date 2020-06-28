//
//  YujinxiangqingTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/21.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "YujinxiangqingTableViewCell.h"
@interface YujinxiangqingTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet UILabel *lab3;
@property (weak, nonatomic) IBOutlet UILabel *lab4;

@end
@implementation YujinxiangqingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setCell:(NSString *)alertType
     alertItem:(NSString *)alertItem
alertObjectName:(NSString *)alertObjectName
     validTime:(NSString *)validTime
          days:(NSString *)days{
    if (alertType == nil) {
        alertType =@"-";
    }
    if (alertItem == nil) {
        alertItem =@"-";
    }
    if (alertObjectName == nil) {
        alertObjectName =@"-";
    }
    if (validTime == nil) {
        validTime =@"-";
    }
    if (days == nil) {
        days =@"-";
    }else{
     NSString *stringInt = days;
     int ivalue = [stringInt intValue];
        if (ivalue < 0) {
            days = [days stringByReplacingOccurrencesOfString:@"-" withString:@""];
            days = [NSString stringWithFormat:@"已过期:%@天",days];
            _lab3.textColor = RGB(141,0,2);
        }else{
            days = [NSString stringWithFormat:@"倒计时:%@天",days];
            _lab3.textColor = [UIColor orangeColor];
        }
        _lab3.text = [NSString stringWithFormat:@"%@",days];

    }
    _lab1.text = [NSString stringWithFormat:@"%@",alertType];
    _lab2.text = [NSString stringWithFormat:@"%@\n%@",alertItem,alertObjectName];
    _lab4.text = [NSString stringWithFormat:@"到期时间：%@",validTime];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
