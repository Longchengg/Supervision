//
//  QualificationsTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/14.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "QualificationsTableViewCell.h"
@interface QualificationsTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet UILabel *lab3;
@property (weak, nonatomic) IBOutlet UILabel *lab4;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;

@end
@implementation QualificationsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setlab1:(NSString *)lab1
          lab2:(NSString *)lab2
          lab3:(NSString *)lab3
          lab4:(NSString *)lab4
          btn1:(NSString *)btn1
         Sbtn1:(NSString *)Sbnt1
          btn2:(NSString *)btn2{
    _lab1.text = [NSString stringWithFormat:@"%@",lab1];
    _lab2.text = [NSString stringWithFormat:@"%@",lab2];
    _lab3.text = [NSString stringWithFormat:@"%@",lab3];
    //替换某个字符
    lab4 = [lab4 stringByReplacingOccurrencesOfString:@"/" withString:@"\n"];
    lab4 = [lab4 stringByReplacingOccurrencesOfString:@"," withString:@"\n"];
    lab4 = [lab4 stringByReplacingOccurrencesOfString:@"，" withString:@"\n"];
    _lab4.text = [NSString stringWithFormat:@"%@",lab4];
    if ([[NSString stringWithFormat:@"%@",btn1] isEqual:@"0"]) {
        [_btn1 setTitle:[NSString stringWithFormat:@"%@",Sbnt1] forState:UIControlStateNormal];
        _btn1.backgroundColor = RGB(144,201,108);
    }else if([[NSString stringWithFormat:@"%@",lab4] isEqual:@"1"]) {
        [_btn1 setTitle:[NSString stringWithFormat:@"%@",Sbnt1] forState:UIControlStateNormal];
        _btn1.backgroundColor = [UIColor orangeColor];
    }else{
        [_btn1 setTitle:[NSString stringWithFormat:@"%@",Sbnt1] forState:UIControlStateNormal];
        _btn1.backgroundColor = RGB(141,0,2);
    }
    if ([[NSString stringWithFormat:@"%@",btn2] isEqual:@"0"]) {
          [_btn2 setTitle:[NSString stringWithFormat:@"空闲"] forState:UIControlStateNormal];
          _btn2.backgroundColor = RGB(144,201,108);
      }else if([[NSString stringWithFormat:@"%@",btn2] isEqual:@"1"]) {
          [_btn2 setTitle:[NSString stringWithFormat:@"预借出"] forState:UIControlStateNormal];
          _btn2.backgroundColor = [UIColor orangeColor];
      }else{
          [_btn2 setTitle:[NSString stringWithFormat:@"借出"] forState:UIControlStateNormal];
          _btn2.backgroundColor = RGB(80,169,236);
      }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
