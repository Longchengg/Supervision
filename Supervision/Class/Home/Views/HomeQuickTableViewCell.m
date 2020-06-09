//
//  HomeQuickTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/5/21.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "HomeQuickTableViewCell.h"
@interface HomeQuickTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet UILabel *lab3;
@property (weak, nonatomic) IBOutlet UILabel *lab4;

@end

@implementation HomeQuickTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)didClickQuickBtn:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(didClickQuickBtn:)]) {
        
        [_delegate didClickQuickBtn:sender.tag];
    }

}

- (void)setDict:(NSDictionary *)dict{
    
    _dict = dict;

    if (_dict.count > 0) {
        
        _lab1.text = [NSString stringWithFormat:@"%d",[_dict[@"数字证书"]intValue]+[_dict[@"投标数量"]intValue] +[_dict[@"资质证书"]intValue]];
        _lab2.text = [NSString stringWithFormat:@"%@",_dict[@"人员数量"]];
        _lab3.text = [NSString stringWithFormat:@"%@",_dict[@"投标数量"]];
        _lab4.text = [NSString stringWithFormat:@"%@",_dict[@"待归还证书"]];

    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
