//
//  CityTableViewCell.m
//  Tabel
//
//  Created by 龙成 on 2019/9/27.
//  Copyright © 2019 China. All rights reserved.
//

#import "CityTableViewCell.h"
@interface CityTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;

@property (weak, nonatomic) IBOutlet UILabel *lab3;
@property (weak, nonatomic) IBOutlet UILabel *lab4;
@property (weak, nonatomic) IBOutlet UILabel *lab5;
@property (weak, nonatomic) IBOutlet UILabel *lab6;
@property (weak, nonatomic) IBOutlet UILabel *lab7;

@end
@implementation CityTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)settrainingName:(NSString *)trainingName timeFW:(NSString *)timeFW trainingTypeDesc:(NSString *)trainingTypeDesc trainingPlace:(NSString *)trainingPlace trainingFeeOne:(NSString *)trainingFeeOne registerStatusDesc:(NSString *)registerStatusDesc personNumber:(NSString *)personNumber{
    
    if (trainingName == nil) {
        _lab1.text =@"-";
    }else{
        _lab1.text = trainingName;
    }
    _lab2.text =[NSString stringWithFormat:@"%@",timeFW];
    if (trainingTypeDesc == nil) {
        _lab3.text =@"-";
    }else{
        _lab3.text = trainingTypeDesc;
    }
    if (trainingPlace == nil) {
        _lab4.text =@"-";
    }else{
        _lab4.text = trainingPlace;
    }
    if (trainingFeeOne == nil) {
        _lab5.text =@"-";
    }else{
        _lab5.text =[NSString stringWithFormat:@"%@元/人",trainingFeeOne];
    }
    if ([registerStatusDesc isEqual:@"待报名"]) {
        _lab6.text =registerStatusDesc;
        _lab6.textColor = RGB(141,0,2);
    }else if([registerStatusDesc isEqual:@"已报名"]) {
        _lab6.text =registerStatusDesc;
        _lab6.textColor = [UIColor orangeColor];
    }else{
        _lab6.text =registerStatusDesc;
        _lab6.textColor = [UIColor lightGrayColor];
    }
    if (personNumber == nil) {
        _lab7.text =@"-";
    }else{
        _lab7.text = personNumber;
    }
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
