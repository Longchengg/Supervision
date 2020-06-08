//
//  LookBroadTopTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/7.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "LookBroadTopTableViewCell.h"

@interface LookBroadTopTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *leftLebal;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;

@end

@implementation LookBroadTopTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setExpiredCount:(NSString *)expiredCount{
    _expiredCount = expiredCount;
    if (_expiredCount) {
        self.leftLebal.text = _expiredCount;
    }
}
-(void)setAlertCount:(NSString *)alertCount{
    _alertCount = alertCount;
    if (_alertCount) {
        self.rightLabel.text = _alertCount;
    }
}
- (IBAction)didClickchuliBtn:(id)sender {
    
    if ([_delegate respondsToSelector:@selector(didClickchuliBtn:)]) {
        
        [_delegate didClickchuliBtn:sender];
    }
    
}
- (IBAction)didClickxiaoxiBtn:(id)sender {
     if ([_delegate respondsToSelector:@selector(didClickxiaoxiBtn:)]) {
           
           [_delegate didClickxiaoxiBtn:sender];
       }
    }
        
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
