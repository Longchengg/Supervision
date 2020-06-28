//
//  HomeDownTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/21.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "HomeDownTableViewCell.h"

@implementation HomeDownTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)didBtnClick:(id)sender {
    if ([_delegate respondsToSelector:@selector(didClickDownBtn:)]) {
           
           [_delegate didClickDownBtn:1];
       }
}

- (IBAction)didBtn1Click:(id)sender {
    if ([_delegate respondsToSelector:@selector(didClickDownBtn:)]) {
        
        [_delegate didClickDownBtn:2];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
