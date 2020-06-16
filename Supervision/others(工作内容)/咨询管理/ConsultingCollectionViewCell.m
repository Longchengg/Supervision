//
//  ConsultingCollectionViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/11.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "ConsultingCollectionViewCell.h"
#import "ConsultingTableViewCell.h"
#import "ConsultingModel.h"


@interface ConsultingCollectionViewCell()
@property (weak, nonatomic) IBOutlet UILabel *NameText;
@property (weak, nonatomic) IBOutlet UILabel *Context;
@property (weak, nonatomic) IBOutlet UILabel *timeText;
@property (weak, nonatomic) IBOutlet UILabel *stausText;
@property (weak, nonatomic) IBOutlet UILabel *downText;
@property (weak, nonatomic) IBOutlet UIImageView *downImage;

@property (nonatomic, strong) ConsultingModel *consultingModel;
@property (nonatomic, strong) NSArray *PersonArr;
@property (nonatomic, strong) NSMutableArray *imageArr;
@property (nonatomic, strong) UIImageView *im;



@end
@implementation ConsultingCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}
-(void)setTodataSource:(NSArray *)TodataSource indexTag:(NSInteger)indexTag isShowImg:(BOOL )isShow{
    
    _downImage.hidden = isShow;

    _consultingModel = [ConsultingModel mj_objectWithKeyValues:TodataSource[indexTag]];
    WEAK_SELF;
    [HttpRequestTool person_appearance_query:_consultingModel.personId page:@"1" size:@"50" SuccessBlock:^(id responObject) {
         __weakSelf.PersonArr = (NSArray *)responObject[@"list"];
        [self setConsuItemNameTextL:self->_consultingModel.personName ContextL:@"二级建造师" timeTextL:self->_PersonArr[0][@"appearanceTime"] stausTextL:self->_PersonArr[0][@"appearanceStatusDesc"]  downTextL:self->_PersonArr[0][@"projectName"]  indexTag:indexTag];
    } failureBlock:^(id err) {
        
    }];
    
}

-(void)setConsuItemNameTextL:(NSString *)NameTextL
                    ContextL:(NSString *)ContextL
                   timeTextL:(NSString *)timeTextL
                  stausTextL:(NSString *)stausTextL
                   downTextL:(NSString *)downTextL
                   indexTag:(NSInteger)indexTag{
    _NameText.text = NameTextL;
    _Context.text =ContextL;
     if ([[NSString stringWithFormat:@"%@",timeTextL]  isEqual: @"<null>"]) {
        _timeText.text = [NSString stringWithFormat:@""];
       }else{
           _timeText.text = [NSString stringWithFormat:@"%@",timeTextL];
       }
    _stausText.text = stausTextL;
    _downText.text = downTextL;
}







@end
