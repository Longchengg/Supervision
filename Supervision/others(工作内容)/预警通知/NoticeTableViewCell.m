//
//  NoticeTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/8.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "NoticeTableViewCell.h"
@interface NoticeTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *labelT;

@end
@implementation NoticeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setLabelStr:(NSString *)labelStr{
    _labelStr = labelStr;
    if (_labelStr) {
        self.labelT.text = [NSString stringWithFormat:@"%@",_labelStr];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
