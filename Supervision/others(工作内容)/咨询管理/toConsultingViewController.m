//
//  toConsultingViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/12.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "toConsultingViewController.h"
#import "toConsultingTableViewCell.h"
#import "ConsultingModel.h"
#import "to2ConsultingViewController.h"
@interface toConsultingViewController ()
<UITableViewDelegate,
UITableViewDataSource
>{
    
}

/// 主页面tableView
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *personArr;

/// 证书统计元数据
@property (nonatomic, copy) NSDictionary *cert_stasticDict;

@property (nonatomic, strong)ConsultingModel  *consultingModel;

@end

@implementation toConsultingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setVCTitle:@"咨询管理"];
    
    [self initData];
}

#pragma mark - 初始化一些必要的数据
- (void)initData{
    
    //数据初始化
    
    //对tableView进行必要的初始化
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"toConsultingTableViewCell" bundle:nil] forCellReuseIdentifier:@"toConsultingTableViewCell"];
  
  
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
}

- (void)loadPerson:(NSString *)personID{
    WEAK_SELF;
      [HttpRequestTool person_appearance_query:personID page:@"1" size:@"50" SuccessBlock:^(id responObject) {
           __weakSelf.personArr = (NSArray *)responObject[@"list"];
          NSIndexSet *setIndex = [NSIndexSet indexSetWithIndex:1];
                [__weakSelf.tableView reloadSections:setIndex withRowAnimation:UITableViewRowAnimationNone];
      } failureBlock:^(id err) {
          
      }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataSourceArr.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
    
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
    
    int section = (int)indexPath.section;
    int row     = (int)indexPath.row;
    
    toConsultingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"toConsultingTableViewCell"];
    cell.selectionStyle        = UITableViewCellSelectionStyleNone;
    _consultingModel = [ConsultingModel mj_objectWithKeyValues:_dataSourceArr[row]];
       WEAK_SELF;
       [HttpRequestTool person_appearance_query:_consultingModel.personId page:@"1" size:@"50" SuccessBlock:^(id responObject) {
            __weakSelf.personArr = (NSArray *)responObject[@"list"];
           [cell setContent:self->_personArr[0][@"personName"] ContextL:self->_personArr[0][@"projectName"]  timeTextL:self->_personArr[0][@"appearanceTime"] stausTextL:self->_personArr[0][@"appearanceStatusDesc"] ];
       } failureBlock:^(id err) {
           
       }];
  
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int row     = (int)indexPath.row;
    to2ConsultingViewController *VC = [[to2ConsultingViewController alloc]init];
    _consultingModel = [ConsultingModel mj_objectWithKeyValues:_dataSourceArr[row]];
    VC.personID = _consultingModel.personId;
    [self.navigationController pushViewController:VC animated:YES];
    
}

@end
