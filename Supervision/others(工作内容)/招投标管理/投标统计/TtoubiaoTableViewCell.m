//
//  TtoubiaoTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/21.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "TtoubiaoTableViewCell.h"
@interface TtoubiaoTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet UILabel *lab3;
@property (weak, nonatomic) IBOutlet UILabel *lab4;

@end
@implementation TtoubiaoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setpersonName:(NSString *)personName
            certName:(NSString *)certName
          unlockTime:(NSString *)unlockTime
         projectName:(NSString *)projectName{
    _lab1.text = [NSString stringWithFormat:@"%@",personName];
    _lab2.text = [NSString stringWithFormat:@"%@",certName];
    if ([[NSString stringWithFormat:@"%@",unlockTime]  isEqual: @"<null>"]||[[NSString stringWithFormat:@"%@",unlockTime]  isEqual: @"(null)"]) {
        _lab3.text = [NSString stringWithFormat:@""];
    }else{
        _lab3.text = [NSString stringWithFormat:@"解锁时间:%@",unlockTime];
    }
    if ([[NSString stringWithFormat:@"%@",projectName]  isEqual: @"<null>"]||[[NSString stringWithFormat:@"%@",projectName]  isEqual: @"(null)"]) {
        _lab4.text = [NSString stringWithFormat:@""];
    }else{
        _lab4.text = [NSString stringWithFormat:@"锁定项目:%@",projectName];
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
