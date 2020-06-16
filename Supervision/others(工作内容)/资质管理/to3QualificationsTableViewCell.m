//
//  to3QualificationsTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/15.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "to3QualificationsTableViewCell.h"
@interface to3QualificationsTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *context;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end
@implementation to3QualificationsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)settitle:(NSString *)title context:(NSString *)context{
    _title.text = [NSString stringWithFormat:@"%@",title];
    //替换某个字符
    context = [context stringByReplacingOccurrencesOfString:@"/" withString:@"\n"];
    context = [context stringByReplacingOccurrencesOfString:@"," withString:@"\n"];
    context = [context stringByReplacingOccurrencesOfString:@"，" withString:@"\n"];
    _context.text = [NSString stringWithFormat:@"%@",context];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
