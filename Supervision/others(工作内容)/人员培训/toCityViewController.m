//
//  toCityViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/17.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "toCityViewController.h"
#import "toCityViewTableViewCell.h"
#import "to2CityViewTableViewCell.h"
#import "CityViewModel.h"

@interface toCityViewController ()<
UITableViewDelegate,
UITableViewDataSource
>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong) NSArray *dataSourceArr;
@property (nonatomic,strong) CityViewModel *cityViewModel;
@property (nonatomic,strong) CityViewModel_personList *personModel;
@property (nonatomic,strong) CityViewModel_personExtList *personExtModel;


@end

@implementation toCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setVCTitle:@"培训详情"];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.rowHeight =  UITableViewAutomaticDimension;//设置cell的高度为自动计算，只有才xib或者storyboard上自定义的cell才会生效，而且需要设置好约束
    _tableview.estimatedRowHeight = 200;//必须设置好预估值
//    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableview registerNib:[UINib nibWithNibName:@"toCityViewTableViewCell" bundle:nil] forCellReuseIdentifier:@"toCityViewTableViewCell"];
    [_tableview registerNib:[UINib nibWithNibName:@"to2CityViewTableViewCell" bundle:nil] forCellReuseIdentifier:@"to2CityViewTableViewCell"];

    
    if (@available(iOS 11.0, *)) {
        self.tableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self updateUI];
    
}
- (void)updateUI{
    
    WEAK_SELF;
    [HttpRequestTool training_get:_trainingId SuccessBlock:^(id responObject) {
//        __weakSelf.dataSourceArr = (NSArray *)responObject[@"list"];
        __weakSelf.cityViewModel = [CityViewModel mj_objectWithKeyValues:responObject];
        [__weakSelf.tableview reloadData];
    } failureBlock:^(id err) {
        
    }];
              
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int section = (int)indexPath.section;
    if (section == 0) {
        return 435.0f;
    }else if(section == 1){
        return 30.0f + 30.0f*_cityViewModel.personList.count;
    }else{
        return 30.0f + 30.0f*_cityViewModel.personExtList.count;
    }
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

- ( UITableViewCell *)tableView:( UITableView *)tableView cellForRowAtIndexPath:( NSIndexPath *)indexPath
{
    NSInteger index = indexPath.section;
    if (index == 0) {
        toCityViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"toCityViewTableViewCell"];
        cell.selectionStyle          = UITableViewCellSelectionStyleNone;
        [cell settrainingName:_cityViewModel.trainingName trainingTypeDesc:_cityViewModel.trainingTypeDesc trainingPlace:_cityViewModel.trainingPlace trainingOrgan:_cityViewModel.trainingOrgan registerStart_registerEnd:[NSString stringWithFormat:@"%@到%@",_cityViewModel.registerStart,_cityViewModel.registerEnd] trainingStart_trainingEnd:[NSString stringWithFormat:@"%@到%@",_cityViewModel.trainingStart,_cityViewModel.trainingEnd] examStart_examEnd:[NSString stringWithFormat:@"%@到%@",_cityViewModel.examStart,_cityViewModel.examEnd] registerStatusDesc:_cityViewModel.registerStatusDesc trainingFeeOne:_cityViewModel.trainingFeeOne trainingFeeTotal:_cityViewModel.trainingFeeTotal];
        return cell;
    }else if(index == 1){
        to2CityViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"to2CityViewTableViewCell"];
        cell.selectionStyle          = UITableViewCellSelectionStyleNone;
        cell.personArr = _cityViewModel.personList;
        return cell;
    }else{
        to2CityViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"to2CityViewTableViewCell"];
        cell.selectionStyle          = UITableViewCellSelectionStyleNone;
        cell.personExtArr = _cityViewModel.personExtList;
        return cell;
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
