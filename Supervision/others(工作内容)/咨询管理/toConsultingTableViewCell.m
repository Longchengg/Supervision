//
//  toConsultingTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/12.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "toConsultingTableViewCell.h"
@interface toConsultingTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameT;
@property (weak, nonatomic) IBOutlet UILabel *contT;
@property (weak, nonatomic) IBOutlet UILabel *stausT;
@property (weak, nonatomic) IBOutlet UILabel *timeT;

@end
@implementation toConsultingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setContent:(NSString *)NameTextL ContextL:(NSString *)ContextL timeTextL:(NSString *)timeTextL stausTextL:(NSString *)stausTextL{
    _nameT.text = NameTextL;
    _contT.text =[NSString stringWithFormat:@"项目:%@",ContextL];
    if ([[NSString stringWithFormat:@"%@",timeTextL]  isEqual: @"<null>"]) {
        _timeT.text = [NSString stringWithFormat:@""];
    }else{
        _timeT.text = [NSString stringWithFormat:@"服务时间:%@",timeTextL];
    }
    _stausT.text = stausTextL;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
