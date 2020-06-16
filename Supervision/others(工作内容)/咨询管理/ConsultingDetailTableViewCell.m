//
//  ConsultingDetailTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/11.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "ConsultingDetailTableViewCell.h"
@interface ConsultingDetailTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *NameText;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *stausText;
@property (weak, nonatomic) IBOutlet UILabel *contenLine;
@property (weak, nonatomic) IBOutlet UILabel *contentime;

@end
@implementation ConsultingDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setContent:(NSString *)NameTextL ContextL:(NSString *)ContextL timeTextL:(NSString *)timeTextL stausTextL:(NSString *)stausTextL downTextL:(NSString *)downTextL{
    _NameText.text = NameTextL;
    _content.text =ContextL;
    if ([[NSString stringWithFormat:@"%@",timeTextL]  isEqual: @"<null>"]) {
        _contentime.text = [NSString stringWithFormat:@""];
    }else{
        _contentime.text = [NSString stringWithFormat:@"服务时间:%@",timeTextL];
    }
    _stausText.text = stausTextL;
    _contenLine.text = downTextL;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
