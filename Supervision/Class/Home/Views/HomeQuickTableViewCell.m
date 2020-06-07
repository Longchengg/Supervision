//
//  HomeQuickTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/5/21.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "HomeQuickTableViewCell.h"

@implementation HomeQuickTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)didClickTopBtn1:(id)sender {
    if ([_delegate respondsToSelector:@selector(didClickTopBtn1:)]) {
        
        [_delegate didClickTopBtn1:sender];
    }

}
- (IBAction)didClickTopBtn2:(id)sender {
    
    if ([_delegate respondsToSelector:@selector(didClickTopBtn2:)]) {
        
        [_delegate didClickTopBtn2:sender];
    }
}
- (IBAction)didClickTopBtn3:(id)sender {
    
    if ([_delegate respondsToSelector:@selector(didClickTopBtn3:)]) {
        
        [_delegate didClickTopBtn3:sender];
    }
}
- (IBAction)didClickTopBtn4:(id)sender {
    
    if ([_delegate respondsToSelector:@selector(didClickTopBtn4:)]) {
        
        [_delegate didClickTopBtn4:sender];
    }
}
- (IBAction)didClickBottomBtn1:(id)sender {
    
    if ([_delegate respondsToSelector:@selector(didClickBottomBtn1:)]) {
        
        [_delegate didClickBottomBtn1:sender];
    }
}
- (IBAction)didClickBottomBtn2:(id)sender {
    if ([_delegate respondsToSelector:@selector(didClickBottomBtn2:)]) {
        
        [_delegate didClickBottomBtn2:sender];
    }
}
- (IBAction)didClickBottomBtn3:(id)sender {
    if ([_delegate respondsToSelector:@selector(didClickBottomBtn3:)]) {
        
        [_delegate didClickBottomBtn3:sender];
    }
}
- (IBAction)didClickBottomBtn4:(id)sender {
    if ([_delegate respondsToSelector:@selector(didClickBottomBtn4:)]) {
        
        [_delegate didClickBottomBtn4:sender];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
