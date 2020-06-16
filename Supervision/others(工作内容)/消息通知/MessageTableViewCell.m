//
//  MessageTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/14.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "MessageTableViewCell.h"
@interface MessageTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *timeL;
@property (weak, nonatomic) IBOutlet UILabel *conT;

@end
@implementation MessageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)settimeL:(NSString *)timeL contL:(NSString *)contL{
    _timeL.text = [NSString stringWithFormat:@"%@",timeL];
    _conT.text =[NSString stringWithFormat:@"%@",contL];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
