//
//  ZhaotoubiaoDownCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/19.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "ZhaotoubiaoDownCell.h"
@interface ZhaotoubiaoDownCell()
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet UILabel *lab3;
@property (weak, nonatomic) IBOutlet UILabel *lab4;
@property (weak, nonatomic) IBOutlet UILabel *lab5;
@property (weak, nonatomic) IBOutlet UILabel *lab6;
@property (weak, nonatomic) IBOutlet UILabel *lab7;
@property (weak, nonatomic) IBOutlet UILabel *lab8;
@property (weak, nonatomic) IBOutlet UILabel *lab9;
@property (weak, nonatomic) IBOutlet UILabel *lab10;
@property (weak, nonatomic) IBOutlet UILabel *lab11;
@property (weak, nonatomic) IBOutlet UILabel *lab12;

@end
@implementation ZhaotoubiaoDownCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)projectName:(NSString *)projectName
   bidCategoryName:(NSString *)bidCategoryName
      projectPlace:(NSString *)projectPlace
     registerStart:(NSString *)registerStart
       registerEnd:(NSString *)registerEnd
          bidStart:(NSString *)bidStart
          bidPlace:(NSString *)bidPlace
      operatorName:(NSString *)operatorName
     operatorPhone:(NSString *)operatorPhone
         bidStatus:(NSString *)bidStatus
         marginFee:(NSString *)marginFee
         marginEnd:(NSString *)marginEnd
      marginStatus:(NSString *)marginStatus{
    if (projectName == nil) {
        projectName =@"-";
    }
    if (bidCategoryName == nil) {
        bidCategoryName =@"-";
    }
    if (projectPlace == nil) {
        projectPlace =@"-";
    }
    if (registerStart == nil) {
        registerStart =@"-";
    }else{
        registerStart = [registerStart substringToIndex:10];
    }
    if (registerEnd == nil) {
        registerEnd =@"-";
    }else{
        registerEnd = [registerEnd substringToIndex:10];
    }
    if (bidStart == nil) {
        bidStart =@"-";
    }else{
        bidStart = [bidStart substringToIndex:10];
    }
    if (bidPlace == nil) {
        bidPlace =@"-";
    }
    if (operatorName == nil) {
        operatorName =@"-";
    }
    if (operatorPhone == nil) {
        operatorPhone =@"-";
    }
    if (bidStatus == nil) {
        bidStatus =@"-";
    }
    if (marginFee == nil) {
        marginFee =@"-";
    }
    if (marginEnd == nil) {
        marginEnd =@"-";
    }else{
        marginEnd = [marginEnd substringToIndex:10];
    }
    if (marginStatus == nil) {
        marginStatus =@"-";
    }
    
    _lab1.text = [NSString stringWithFormat:@"%@",projectName];
    _lab2.text = [NSString stringWithFormat:@"%@",bidCategoryName];
    _lab3.text = [NSString stringWithFormat:@"%@",projectPlace];
    _lab4.text = [NSString stringWithFormat:@"%@到%@",registerStart,registerEnd];
    _lab5.text = [NSString stringWithFormat:@"%@",bidStart];
    
    _lab6.text = [NSString stringWithFormat:@"%@",bidPlace];
    _lab7.text = [NSString stringWithFormat:@"%@",operatorName];
    _lab8.text = [NSString stringWithFormat:@"%@",operatorPhone];
    
    _lab9.text = [NSString stringWithFormat:@"%@",bidStatus];
    _lab12.text = [NSString stringWithFormat:@"%@元",marginFee];
    _lab10.text = [NSString stringWithFormat:@"%@",marginEnd];
    _lab11.text = [NSString stringWithFormat:@"%@",marginStatus];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
