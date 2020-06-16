//
//  ChuZhiCheckLastCell.m
//  Supervision
//
//  Created by 黄琦 on 2019/12/3.
//  Copyright © 2019 cjbapp. All rights reserved.
//

#import "ChuZhiCheckLastCell.h"

@interface ChuZhiCheckLastCell()
@property (weak, nonatomic) IBOutlet UILabel *timeStr;
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet UILabel *lab3;
@property (weak, nonatomic) IBOutlet UIView *viewLien;

@end
@implementation ChuZhiCheckLastCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    

}
-(void)setCelllab1:(NSString *)lab1 lab2:(NSString *)lab2 lab3:(NSString *)lab3 timeS:(NSString *)timeS isHiddenLine:(BOOL)isHiddenLine{
    _lab1.text = [NSString stringWithFormat:@"%@",lab1];
    _lab2.text = [NSString stringWithFormat:@"%@",lab2];
    if ([[NSString stringWithFormat:@"%@",lab3] isEqual:@"0"]) {
        _lab3.text = [NSString stringWithFormat:@"空闲"];
        _lab3.textColor = RGB(144,201,108);
    }else if([[NSString stringWithFormat:@"%@",lab3] isEqual:@"1"]) {
        _lab3.text = [NSString stringWithFormat:@"预借出"];
        _lab3.textColor = [UIColor orangeColor];
    }else{
        _lab3.text = [NSString stringWithFormat:@"借出"];
        _lab3.textColor = RGB(80,169,236);
    }    _timeStr.text = [NSString stringWithFormat:@"%@",timeS];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




@end
