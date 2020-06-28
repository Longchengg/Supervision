//
//  JianNiuTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/21.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "JianNiuTableViewCell.h"
@interface JianNiuTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet UILabel *lab3;

@end
@implementation JianNiuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setCelllab1:(NSString *)lab1
               lab2:(NSString *)lab2
               lab3:(NSString *)lab3{
    if (lab1 == nil) {
        lab1 =@"-";
    }
    if (lab2 == nil) {
        lab2 =@"-";
    }
    if (lab3 == nil) {
        lab3 =@"-";
    }else{
        long long time=[lab3 longLongValue];
        NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:time];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        lab3 =[formatter stringFromDate:date];
    }
    _lab1.text = [NSString stringWithFormat:@"%@",lab1];
    _lab2.text = [NSString stringWithFormat:@"来源：%@",lab2];
    _lab3.text = [NSString stringWithFormat:@"发布时间：%@",lab3];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
