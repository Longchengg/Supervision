//
//  to2CityViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/18.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "to2CityViewCell.h"
@interface to2CityViewCell()
@property (weak, nonatomic) IBOutlet UILabel *labL;
@property (weak, nonatomic) IBOutlet UILabel *labC;
@property (weak, nonatomic) IBOutlet UILabel *labR;

@end
@implementation to2CityViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setlab1:(NSString *)lab1 lab2:(NSString *)lab2 lab3:(NSString *)lab3{
    _labL.text = [NSString stringWithFormat:@"%@",lab1];
    if (lab2 == nil) {
        lab2 = @"-";
    }
    if (lab3 == nil) {
           lab3 = @"-";
       }
    _labC.text = [NSString stringWithFormat:@"%@",lab2];
    _labR.text = [NSString stringWithFormat:@"证书数量：%@",lab3];
}
-(void)setzhaolab1:(NSString *)lab1 lab2:(NSString *)lab2 lab3:(NSString *)lab3{
    _labL.text = [NSString stringWithFormat:@"%@",lab1];
    if (lab2 == nil) {
        lab2 = @"-";
    }
    if (lab3 == nil) {
           lab3 = @"-";
       }
    _labC.text = [NSString stringWithFormat:@"%@",lab2];
    _labR.text = [NSString stringWithFormat:@"%@",lab3];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
