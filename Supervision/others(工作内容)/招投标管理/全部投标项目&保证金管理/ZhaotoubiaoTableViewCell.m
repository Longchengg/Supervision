//
//  ZhaotoubiaoTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/18.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "ZhaotoubiaoTableViewCell.h"
@interface ZhaotoubiaoTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet UILabel *lab3;
@property (weak, nonatomic) IBOutlet UILabel *lab4;
@property (weak, nonatomic) IBOutlet UILabel *lab5;
@property (weak, nonatomic) IBOutlet UILabel *lab6;
@property (weak, nonatomic) IBOutlet UILabel *lab7;
@property (weak, nonatomic) IBOutlet UILabel *lab8;


@end
@implementation ZhaotoubiaoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)projectName:(NSString *)projectName
         bidStatus:(NSString *)bidStatus
   bidCategoryName:(NSString *)bidCategoryName
      projectPlace:(NSString *)projectPlace
     registerStart:(NSString *)registerStart
       registerEnd:(NSString *)registerEnd
          bidStart:(NSString *)bidStart{
    if (projectName == nil) {
        projectName =@"-";
    }
    if (bidStatus == nil) {
        bidStatus =@"-";
    }else{
        if ([[NSString stringWithFormat:@"%@",bidStatus] isEqual:@"0"]) {
            _lab2.textColor = RGB(236,144,58);
            bidStatus = @"待报名";
        }else if([[NSString stringWithFormat:@"%@",bidStatus] isEqual:@"1"]) {
            _lab2.textColor = RGB(89,182,240);
            bidStatus = @"待投标";
        }else if([[NSString stringWithFormat:@"%@",bidStatus] isEqual:@"2"]) {
            _lab2.textColor =RGB(208,55,55);
            bidStatus = @"待交保证金";
        }else if([[NSString stringWithFormat:@"%@",bidStatus] isEqual:@"3"]) {
            _lab2.textColor = RGB(245,176,12);
            bidStatus = @"待开标";
        }else if([[NSString stringWithFormat:@"%@",bidStatus] isEqual:@"4"]) {
            _lab2.textColor = RGB(152,205,117);
            bidStatus = @"已中标";
        }else {
            _lab2.textColor = RGB(113,129,213);
            bidStatus = @"未中标";
        }
    }
    if (bidCategoryName == nil) {
        bidCategoryName =@"-";
    }
    if (projectPlace == nil) {
        projectPlace =@"-";
    }
    if (registerStart == nil) {
        registerStart =@"-";
    }
    if (registerEnd == nil) {
        registerEnd =@"-";
    }
    if (bidStart == nil) {
        bidStart =@"-";
    }else{
        bidStart = [bidStart substringToIndex:10];
    }
    _lab1.text = [NSString stringWithFormat:@"%@",projectName];
    _lab2.text = [NSString stringWithFormat:@"%@",bidStatus];
    _lab3.text = [NSString stringWithFormat:@"%@",bidCategoryName];
    _lab4.text = [NSString stringWithFormat:@"地点:%@",projectPlace];
    _lab5.text = [NSString stringWithFormat:@"报名时间:%@到%@",registerStart,registerEnd];
    _lab6.text = [NSString stringWithFormat:@"开标时间:%@",bidStart];
    _lab7.text = [NSString stringWithFormat:@""];
    _lab8.text = [NSString stringWithFormat:@""];
}
-(void)projectName:(NSString *)projectName
      marginStatus:(NSString *)marginStatus
         marginFee:(NSString *)marginFee
      projectPlace:(NSString *)projectPlace
      operatorName:(NSString *)operatorName
     operatorPhone:(NSString *)operatorPhone
         marginEnd:(NSString *)marginEnd
          bidStart:(NSString *)bidStart{
    if (projectName == nil) {
        projectName =@"-";
    }
    if (marginStatus == nil) {
        marginStatus =@"-";
    }else{
        if ([[NSString stringWithFormat:@"%@",marginStatus] isEqual:@"0"]) {
            _lab2.textColor = RGB(152,205,117);
            marginStatus = @"待交";
        }else if([[NSString stringWithFormat:@"%@",marginStatus] isEqual:@"1"]) {
            _lab2.textColor = RGB(89,182,240);
            marginStatus = @"已交";
        }else if([[NSString stringWithFormat:@"%@",marginStatus] isEqual:@"2"]) {
            _lab2.textColor =RGB(93,215,153);
            marginStatus = @"待退";
        }else {
            _lab2.textColor = RGB(152,205,117);
            marginStatus = @"已退";
        }
    }
    if (marginFee == nil) {
        marginFee =@"-";
    }
    if (projectPlace == nil) {
        projectPlace =@"-";
    }
    if (operatorName == nil) {
        operatorName =@"-";
    }
    if (operatorPhone == nil) {
        operatorPhone =@"-";
    }
    if (marginEnd == nil) {
        marginEnd =@"-";
    }
    if (bidStart == nil) {
        bidStart =@"-";
    }else{
        bidStart = [bidStart substringToIndex:10];
    }
    _lab1.text = [NSString stringWithFormat:@"%@",projectName];
    _lab2.text = [NSString stringWithFormat:@"%@",marginStatus];
    _lab3.text = [NSString stringWithFormat:@"保证金:%@",marginFee];
    _lab4.text = [NSString stringWithFormat:@"地点:%@",projectPlace];
    _lab5.text = [NSString stringWithFormat:@"操作人:%@",operatorName];
    _lab6.text = [NSString stringWithFormat:@"电话:%@",operatorPhone];
    _lab7.text = [NSString stringWithFormat:@"缴纳时间:%@",marginEnd];
    _lab8.text = [NSString stringWithFormat:@"开标时间:%@",bidStart];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
