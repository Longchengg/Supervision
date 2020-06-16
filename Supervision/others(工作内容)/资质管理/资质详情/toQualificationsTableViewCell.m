//
//  toQualificationsTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/15.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "toQualificationsTableViewCell.h"
#import "ShowImageTool.h"

@interface toQualificationsTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageT;
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet UILabel *lab3;
@property (weak, nonatomic) IBOutlet UILabel *lab4;

@property (nonatomic, strong) NSMutableArray *imageArr;

@end
@implementation toQualificationsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setlab1:(NSString *)lab1 lab2:(NSString *)lab2 lab3:(NSString *)lab3 lab4:(NSString *)lab4 lab1S:(NSString *)lab1S imaget:(NSString *)imaget{
    if (imaget) {
        
        _imageArr = [NSMutableArray array];
        [_imageArr addObject:imaget];
        [_imageT sd_setImageWithURL:[NSURL URLWithString:imaget] placeholderImage:[UIImage imageNamed:@"head"]];
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAcyion:)];
        
        //把点击手势添加到图片上
        [_imageT addGestureRecognizer:tap];
        //允许手势
        _imageT.userInteractionEnabled = YES;

    }
    if ([[NSString stringWithFormat:@"%@",lab1] isEqual:@"0"]) {
        _lab1.text = [NSString stringWithFormat:@"%@",lab1S];
        _lab1.textColor = RGB(144,201,108);
    }else if([[NSString stringWithFormat:@"%@",lab4] isEqual:@"1"]) {
        _lab1.text = [NSString stringWithFormat:@"%@",lab1S];
        _lab1.textColor = [UIColor orangeColor];
    }else{
        _lab1.text = [NSString stringWithFormat:@"%@",lab1S];
        _lab1.textColor = RGB(141,0,2);
    }
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
    }
    _lab4.text = [NSString stringWithFormat:@"%@",lab4];
    
}
-(void)setlab1xxx:(NSString *)lab1 lab2:(NSString *)lab2 lab3:(NSString *)lab3 lab4:(NSString *)lab4 lab1S:(NSString *)lab1S imaget:(NSString *)imaget{
    if (imaget) {
        _imageArr = [NSMutableArray array];
        [_imageArr addObject:imaget];
        [_imageT sd_setImageWithURL:[NSURL URLWithString:imaget] placeholderImage:[UIImage imageNamed:@"head"]];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAcyion:)];
        //把点击手势添加到图片上
        [_imageT addGestureRecognizer:tap];
        //允许手势
        _imageT.userInteractionEnabled = YES;
    }
    if ([[NSString stringWithFormat:@"%@",lab1] isEqual:@"0"]) {
        _lab1.text = [NSString stringWithFormat:@"空闲"];
        _lab1.textColor = RGB(144,201,108);
    }else if ([[NSString stringWithFormat:@"%@",lab1] isEqual:@"1"]) {
        _lab1.text = [NSString stringWithFormat:@"已分配"];
        _lab1.textColor = RGB(80,169,236);
    }else {
        _lab1.text = [NSString stringWithFormat:@"锁定中"];
        _lab1.textColor = [UIColor orangeColor];
    }
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
    }
    _lab4.text = [NSString stringWithFormat:@"%@",lab4];
    
}
- (void)tapAcyion:(UITapGestureRecognizer *)tap{
    // 0 是明确只有1个图片
    [[ShowImageTool shareClient] showImage:_imageArr andIndex:0];
}
- (IBAction)didbtnClick:(id)sender {
    NSLog(@"历史去向");
    if ([_delegate respondsToSelector:@selector(didClicktoQualifications)]) {
        [_delegate didClicktoQualifications];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
