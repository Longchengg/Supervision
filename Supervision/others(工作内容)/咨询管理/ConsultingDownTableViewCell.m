//
//  ConsultingDownTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/11.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "ConsultingDownTableViewCell.h"
@interface ConsultingDownTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *monenyT;
@property (weak, nonatomic) IBOutlet UILabel *monenyH;
@property (weak, nonatomic) IBOutlet UILabel *monenyL;
@property (weak, nonatomic) IBOutlet UILabel *monenyC;
@property (weak, nonatomic) IBOutlet UILabel *monenyQ;
@property (weak, nonatomic) IBOutlet UILabel *conT;
@property (weak, nonatomic) IBOutlet UILabel *con1;
@property (weak, nonatomic) IBOutlet UILabel *con2;
@property (weak, nonatomic) IBOutlet UILabel *con3;
@property (weak, nonatomic) IBOutlet UILabel *con4;

@end

@implementation ConsultingDownTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setContent:(NSString *)NameTextL ContextL:(NSString *)ContextL timeTextL:(NSString *)timeTextL stausTextL:(NSString *)stausTextL downTextL:(NSString *)downTextL cont1:(NSString *)cont1 cont2:(NSString *)cont2 cont3:(NSString *)cont3 cont4:(NSString *)cont4 cont5:(NSString *)cont5{
    if ([[NSString stringWithFormat:@"%@",NameTextL]  isEqual: @"<null>"]) {
           _monenyT.text = [NSString stringWithFormat:@""];
       }else{
           _monenyT.text = [NSString stringWithFormat:@"%@",NameTextL];
       }
    if ([[NSString stringWithFormat:@"%@",ContextL]  isEqual: @"<null>"]) {
           _monenyH.text = [NSString stringWithFormat:@"服务费"];
       }else{
           _monenyH.text = [NSString stringWithFormat:@"服务费%@",ContextL];
       }
    if ([[NSString stringWithFormat:@"%@",timeTextL]  isEqual: @"<null>"]) {
           _monenyL.text = [NSString stringWithFormat:@"交通费"];
       }else{
           _monenyL.text = [NSString stringWithFormat:@"交通费%@",timeTextL];
       }
    if ([[NSString stringWithFormat:@"%@",stausTextL]  isEqual: @"<null>"]) {
           _monenyC.text = [NSString stringWithFormat:@"食宿费"];
       }else{
           _monenyC.text = [NSString stringWithFormat:@"食宿费%@",stausTextL];
       }
    if ([[NSString stringWithFormat:@"%@",downTextL]  isEqual: @"<null>"]) {
           _monenyQ.text = [NSString stringWithFormat:@"其它费"];
       }else{
           _monenyQ.text = [NSString stringWithFormat:@"其它费%@",downTextL];
       }
    _conT.text = [NSString stringWithFormat:@"%@",cont1];
    _con1.text = [NSString stringWithFormat:@"%@",cont2];
    if ([[NSString stringWithFormat:@"%@",cont3]  isEqual: @"<null>"]) {
        _con2.text = [NSString stringWithFormat:@""];
    }else{
        _con2.text = [NSString stringWithFormat:@"%@",cont3];
    }
    _con3.text = [NSString stringWithFormat:@"%@",cont4];
    if ([[NSString stringWithFormat:@"%@",cont5]  isEqual: @"<null>"]) {
        _con4.text = [NSString stringWithFormat:@""];
    }else{
        _con4.text = [NSString stringWithFormat:@"%@",cont5];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
