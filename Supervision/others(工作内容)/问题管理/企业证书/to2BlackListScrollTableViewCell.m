//
//  to2BlackListScrollTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/10.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "to2BlackListScrollTableViewCell.h"
@interface to2BlackListScrollTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *labelT;
@property (weak, nonatomic) IBOutlet UILabel *labelchuli;
@property (weak, nonatomic) IBOutlet UILabel *labelDt;
@property (weak, nonatomic) IBOutlet UILabel *labelYt;
@property (weak, nonatomic) IBOutlet UILabel *labelContext;
@property (weak, nonatomic) IBOutlet UIImageView *imageY;

@end
@implementation to2BlackListScrollTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setprocessStatus:(NSString *)processStatus label1:(NSString *)textStr1 label3:(NSString *)textStr3 label4:(NSString *)textStr4 label5:(NSString *)textStr5{
    if ([processStatus isEqualToString:@"0"]) {
        _labelchuli.text = @"待处理";
        _labelchuli.textColor = [UIColor redColor];
        _imageY.hidden = YES;
    }else if([processStatus isEqualToString:@"1"]) {
        _labelchuli.text = @"处理中";
        _labelchuli.textColor = [UIColor orangeColor];
        _imageY.hidden = YES;
    }else{
        _labelchuli.text = @"处理完结";
        _labelchuli.textColor = RGB(52, 136, 69);
    }
    _labelT.text = textStr1;
    
    _labelDt.text = [NSString stringWithFormat:@"到期时间:%@",textStr3];
    
    if ([[NSString stringWithFormat:@"%@",textStr5]  isEqual: @"<null>"]) {
        _labelYt.text = [NSString stringWithFormat:@"预计完成:未设置日期"];
    }else{
        _labelYt.text = [NSString stringWithFormat:@"预计完成:%@",textStr5];
    }

    _labelContext.text = textStr4;
    
}
-(void)setprocessStatus1:(NSString *)processStatus label1:(NSString *)textStr1 label3:(NSString *)textStr3 label4:(NSString *)textStr4 label5:(NSString *)textStr5{
    if ([processStatus isEqualToString:@"0"]) {
        _labelchuli.text = @"待处理";
        _labelchuli.textColor = [UIColor redColor];
        _imageY.hidden = YES;
    }else if([processStatus isEqualToString:@"1"]) {
        _labelchuli.text = @"处理中";
        _labelchuli.textColor = [UIColor orangeColor];
        _imageY.hidden = YES;
    }else{
        _labelchuli.text = @"处理完结";
        _labelchuli.textColor = RGB(52, 136, 69);
    }
    _labelT.text = textStr1;
    
    if ([[NSString stringWithFormat:@"%@",textStr3]  isEqual: @"<null>"]) {
        _labelDt.text = [NSString stringWithFormat:@"到期时间:未设置日期"];
    }else{
        _labelDt.text = [NSString stringWithFormat:@"到期时间:%@",textStr3];
    }
    
    if ([[NSString stringWithFormat:@"%@",textStr5]  isEqual: @"<null>"]) {
        _labelYt.text = [NSString stringWithFormat:@"预计完成:未设置日期"];
    }else{
        _labelYt.text = [NSString stringWithFormat:@"预计完成:%@",textStr5];
    }

    _labelContext.text = textStr4;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
