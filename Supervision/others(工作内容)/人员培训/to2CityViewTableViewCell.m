//
//  to2CityViewTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/18.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "to2CityViewTableViewCell.h"
#import "to2CityViewCell.h"
@interface to2CityViewTableViewCell()<
UITableViewDelegate,
UITableViewDataSource
>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *labT;

@property (nonatomic, strong) NSString *islab;
@property (nonatomic,strong) CityViewModel_personList *personModel;
@property (nonatomic,strong) CityViewModel_personExtList *personExtModel;

@end
@implementation to2CityViewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    [_tableView registerNib:[UINib nibWithNibName:@"to2CityViewCell" bundle:nil] forCellReuseIdentifier:@"to2CityViewCell"];
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        //        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
}
-(void)setPersonArr:(NSArray *)personArr{
    _personArr = personArr;
    if (_personArr) {
        _labT.text =@"参加培训库内人员";
        _islab = @"1";
        [_tableView reloadData];
    }
}
-(void)setPersonExtArr:(NSArray *)personExtArr{
    _personExtArr = personExtArr;
       if (_personExtArr) {
           _labT.text =@"参加培训库外人员";
           _islab = @"2";
           [_tableView reloadData];
       }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
     if ([_islab isEqual:@"1"]) {
         return _personArr.count;
       }else{
        return _personExtArr.count;
       }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 25.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.0001f;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.0001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return [[UIView alloc]init];
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return [[UIView alloc]init];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int index = (int)indexPath.row;
    //   _yejiguanliItem = [yejiguanliItem mj_objectWithKeyValues:_tableArr[index]];
    to2CityViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"to2CityViewCell"];
    cell.selectionStyle        = UITableViewCellSelectionStyleNone;
    if ([_islab isEqual:@"1"]) {
        _personModel = [CityViewModel_personList mj_objectWithKeyValues:_personArr[index]];
        [cell setlab1:_personModel.name lab2:_personModel.idCard lab3:_personModel.certCount];
    }else{
        _personExtModel = [CityViewModel_personExtList mj_objectWithKeyValues:_personExtArr[index]];
        [cell setlab1:_personExtModel.name lab2:_personExtModel.idCard lab3:_personExtModel.certCount];
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
