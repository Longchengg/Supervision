//
//  to2QualificationsTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/15.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "to2QualificationsTableViewCell.h"
@interface to2QualificationsTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *labL;
@property (weak, nonatomic) IBOutlet UILabel *labR;

@end

@implementation to2QualificationsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setLal:(NSString *)Llab zzRlabe:(NSString *)zzRlab{
    if ([[NSString stringWithFormat:@"%@",Llab] isEqual:@"<null>"]||[[NSString stringWithFormat:@"%@",Llab] isEqual:@"(null)"]) {
        Llab = @"";
    }
    if ([[NSString stringWithFormat:@"%@",zzRlab] isEqual:@"<null>"]||[[NSString stringWithFormat:@"%@",zzRlab] isEqual:@"(null)"]) {
        zzRlab = @"无";
    }
    _labL.text = [NSString stringWithFormat:@"%@",Llab];
    _labR.text = [NSString stringWithFormat:@"%@",zzRlab];
}

-(void)setLalz:(NSString *)Llab zzRlabe:(NSDictionary *)zzRlab{
    _labL.text = [NSString stringWithFormat:@"%@",Llab];
    
    _labR.text = [NSString stringWithFormat:@"%@",zzRlab[@"desc"]];
    
    if ([[NSString stringWithFormat:@"%@",zzRlab[@"status"]] isEqual:@"0"]) {
        _labR.textColor = RGB(144,201,108);
    }else if([[NSString stringWithFormat:@"%@",zzRlab[@"status"]] isEqual:@"1"]) {
        _labR.textColor = [UIColor orangeColor];
    }else{
        _labR.textColor = RGB(141,0,2);
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
