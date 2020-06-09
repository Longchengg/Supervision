//
//  HomeFindToolCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/7.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "HomeFindToolCell.h"

@implementation HomeFindToolCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
//- (IBAction)didFindClick:(id)sender {
//    if ([_delegate respondsToSelector:@selector(didClickFindBtn:)]) {
//           
//           [_delegate didClickFindBtn:sender.tag];
//       }
//}
- (IBAction)didFindClick:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(didClickFindBtn:)]) {
        
        [_delegate didClickFindBtn:sender.tag];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
