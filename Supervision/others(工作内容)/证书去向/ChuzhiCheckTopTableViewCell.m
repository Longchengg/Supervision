//
//  ChuzhiCheckTopTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/15.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "ChuzhiCheckTopTableViewCell.h"
@interface ChuzhiCheckTopTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageT;

@end
@implementation ChuzhiCheckTopTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setImageV:(NSString *)imageV{
    if ([[NSString stringWithFormat:@"%@",imageV] isEqual:@"1"]) {
        _imageT.image = [UIImage imageNamed:@"资质管理"];
    }else if ([[NSString stringWithFormat:@"%@",imageV] isEqual:@"2"]) {
        _imageT.image = [UIImage imageNamed:@"安全生产许可证"];
    }else if ([[NSString stringWithFormat:@"%@",imageV] isEqual:@"3"]) {
        _imageT.image = [UIImage imageNamed:@"数字证书"];
    }else {
        _imageT.image = [UIImage imageNamed:@"证书管理"];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
