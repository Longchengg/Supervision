//
//  toCityViewTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/17.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "toCityViewTableViewCell.h"
@interface toCityViewTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet UILabel *lab3;
@property (weak, nonatomic) IBOutlet UILabel *lab4;
@property (weak, nonatomic) IBOutlet UILabel *lab5;//不需要
@property (weak, nonatomic) IBOutlet UILabel *lab6;
@property (weak, nonatomic) IBOutlet UILabel *lab7;
@property (weak, nonatomic) IBOutlet UILabel *lab8;
@property (weak, nonatomic) IBOutlet UILabel *lab9;
@property (weak, nonatomic) IBOutlet UILabel *lab10;
@property (weak, nonatomic) IBOutlet UILabel *lab11;

@end
@implementation toCityViewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)settrainingName:(NSString *)trainingName
      trainingTypeDesc:(NSString *)trainingTypeDesc
         trainingPlace:(NSString *)trainingPlace
         trainingOrgan:(NSString *)trainingOrgan
registerStart_registerEnd:(NSString *)registerStart_registerEnd
trainingStart_trainingEnd:(NSString *)trainingStart_trainingEnd
     examStart_examEnd:(NSString *)examStart_examEnd
    registerStatusDesc:(NSString *)registerStatusDesc
        trainingFeeOne:(NSString *)trainingFeeOne
      trainingFeeTotal:(NSString *)trainingFeeTotal{
    if (trainingName == nil) {
        
    }else{
        _lab1.text = trainingName;
    }
    if (trainingTypeDesc == nil) {
        
    }else{
        _lab2.text = trainingTypeDesc;
    }
    if (trainingPlace == nil) {
    }else{
        _lab3.text = trainingPlace;
    }
    if (trainingOrgan == nil) {
    }else{
        _lab4.text = trainingOrgan;
    }
    if (registerStart_registerEnd == nil) {
        
    }else{
        if ([[NSString stringWithFormat:@"%@",registerStart_registerEnd]  isEqual: @"<null>到<null>"]||[[NSString stringWithFormat:@"%@",registerStart_registerEnd]  isEqual: @"(null)到(null)"]) {
         registerStart_registerEnd = @"-";
        }
        _lab6.text = registerStart_registerEnd;
    }
    if (trainingStart_trainingEnd == nil) {
        
    }else{
        if ([[NSString stringWithFormat:@"%@",trainingStart_trainingEnd]  isEqual: @"<null>到<null>"]||[[NSString stringWithFormat:@"%@",trainingStart_trainingEnd]  isEqual: @"(null)到(null)"]) {
         trainingStart_trainingEnd = @"-";
        }
        _lab7.text = trainingStart_trainingEnd;
    }
    if (examStart_examEnd == nil) {
        
    }else{
        if ([[NSString stringWithFormat:@"%@",examStart_examEnd]  isEqual: @"<null>到<null>"]||[[NSString stringWithFormat:@"%@",examStart_examEnd]  isEqual: @"(null)到(null)"]) {
            examStart_examEnd = @"-";
           }
        _lab8.text = examStart_examEnd;
    }
    if ([registerStatusDesc isEqual:@"待报名"]) {
        _lab9.text =registerStatusDesc;
        _lab9.textColor = RGB(141,0,2);
    }else if([registerStatusDesc isEqual:@"已报名"]) {
        _lab9.text =registerStatusDesc;
        _lab9.textColor = [UIColor orangeColor];
    }else{
        _lab9.text =registerStatusDesc;
        _lab9.textColor = [UIColor lightGrayColor];
    }
    if (trainingFeeOne == nil) {
        
    }else{
        _lab10.text =[NSString stringWithFormat:@"%@元/人",trainingFeeOne];
    }
    if (trainingFeeTotal == nil) {
        
    }else{
        _lab11.text =[NSString stringWithFormat:@"%@元",trainingFeeTotal];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

@end
