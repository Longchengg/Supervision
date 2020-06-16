//
//  toCertificatemanagementCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/16.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "toCertificatemanagementCell.h"
@interface toCertificatemanagementCell()
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UIButton *btn1;

@end
@implementation toCertificatemanagementCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setCertifititle:(NSString *)title context:(NSDictionary *)context{
    _lab1.text = [NSString stringWithFormat:@"%@",title];
    if ([[NSString stringWithFormat:@"%@",context[@"status"]] isEqual:@"0"]) {
         [_btn1 setTitle:[NSString stringWithFormat:@"%@",context[@"desc"]] forState:UIControlStateNormal];
         _btn1.backgroundColor = RGB(144,201,108);
     }else if([[NSString stringWithFormat:@"%@",context[@"status"]] isEqual:@"1"]) {
         [_btn1 setTitle:[NSString stringWithFormat:@"%@",context[@"desc"]] forState:UIControlStateNormal];
         _btn1.backgroundColor = [UIColor orangeColor];
     }else{
         [_btn1 setTitle:[NSString stringWithFormat:@"%@",context[@"desc"]] forState:UIControlStateNormal];
         _btn1.backgroundColor = RGB(141,0,2);
     }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
