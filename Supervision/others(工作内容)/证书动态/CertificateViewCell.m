//
//  CertificateViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/14.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "CertificateViewCell.h"
@interface CertificateViewCell()
@property (weak, nonatomic) IBOutlet UILabel *Llab;
@property (weak, nonatomic) IBOutlet UILabel *Rlab;

@end
@implementation CertificateViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setLal:(NSString *)Llab Rlabe:(NSString *)Rlab{
    _Llab.text = [NSString stringWithFormat:@"%@",Llab];
    if ([[NSString stringWithFormat:@"%@",Rlab] isEqual:@"0"]) {
         _Rlab.text = @"空闲";
        _Rlab.textColor = RGB(144,201,108);
    }else if([[NSString stringWithFormat:@"%@",Rlab] isEqual:@"1"]){
        _Rlab.text = @"预借出";
        _Rlab.textColor = RGB(80,169,236);
    }else{
       _Rlab.text = @"借出";
        _Rlab.textColor = [UIColor orangeColor];
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
