//
//  BlackListTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/9.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "BlackListTableViewCell.h"
@interface BlackListTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageB;
@property (weak, nonatomic) IBOutlet UILabel *LabelM;
@property (weak, nonatomic) IBOutlet UILabel *LabelR;

@end
@implementation BlackListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setBtype:(int)Btype{
    _Btype = Btype;
    if (_Btype) {
        if (_Btype == 0) {
            _imageB.image = [UIImage imageNamed:@"problem_icon_qualification_pre"];
            _LabelM.text = @"企业证书";
        }
        if (_Btype == 1) {
            _imageB.image = [UIImage imageNamed:@"problem_icon_staff_pre"];
            _LabelM.text = @"职员证书";
        }
        if (_Btype == 2) {
            _imageB.image = [UIImage imageNamed:@"problem_icon_bidding_pre"];
            _LabelM.text = @"招投标";
        }
        if (_Btype == 3) {
            _imageB.image = [UIImage imageNamed:@"problem_icon_siku_pre"];
            _LabelM.text = @"自定义";
        }
    }
}

-(void)setlabel:(NSString *)count type:(NSString *)type{
    _Rlabel = count;
    if (_Rlabel) {
        if ([type  isEqual: @"0"]) {
            _LabelR.textColor = [UIColor redColor];
            _Rlabel = [NSString stringWithFormat:@"%@条待处理",_Rlabel];
        }else if([type  isEqual: @"1"]){
            _LabelR.textColor = [UIColor orangeColor];
            _Rlabel = [NSString stringWithFormat:@"%@条处理中",_Rlabel];
        }else{
            _LabelR.textColor = [UIColor systemGrayColor];
            _Rlabel = [NSString stringWithFormat:@"%@条已处理",_Rlabel];
        }
        if ([_Rlabel  isEqual: @"0条待处理"]||[_Rlabel  isEqual: @"0条处理中"]||[_Rlabel  isEqual: @"0条已处理"]) {
            _Rlabel = @"";
        }
        _LabelR.text = _Rlabel;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

@end
