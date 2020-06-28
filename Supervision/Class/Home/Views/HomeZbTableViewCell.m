//
//  HomeZbTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/21.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "HomeZbTableViewCell.h"
@interface HomeZbTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imagel;
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;

@end
@implementation HomeZbTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setIndex:(NSInteger )index{
    _index = index;
    if (_index == 0) {
        _imagel.image = [UIImage imageNamed:@"HomeZb1"];
        _lab1.text = [NSString stringWithFormat:@"西藏招标网（招标网旗下）"];
        _lab2.text = [NSString stringWithFormat:@"官网：xizang.zhaobiao.cn"];
    }else if (_index == 1) {
        _imagel.image = [UIImage imageNamed:@"HomeZb2"];
        _lab1.text = [NSString stringWithFormat:@"西藏招标网（招标采购导航网旗下）"];
        _lab2.text = [NSString stringWithFormat:@"官网：xizang.okcis.cn"];
    }else if (_index == 2) {
        _imagel.image = [UIImage imageNamed:@"HomeZb3"];
        _lab1.text = [NSString stringWithFormat:@"西藏自治区招投标网（官方）"];
        _lab2.text = [NSString stringWithFormat:@"官网：xzzbtb.gov.cn"];
    }else {
        _imagel.image = [UIImage imageNamed:@"HomeZb4"];
        _lab1.text = [NSString stringWithFormat:@"西藏自治区政府采购网（官方）"];
        _lab2.text = [NSString stringWithFormat:@"官网：ccgp-xizang.gov.cn"];
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
