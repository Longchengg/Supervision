//
//  to2ConsultingViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/12.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "to2ConsultingViewController.h"
#import "ConsultingTableViewCell.h"
#import "ConsultingDetailTableViewCell.h"
#import "ConsultingDownTableViewCell.h"
#import "toConsultingViewController.h"
//#import "HomeManagerCell.h"
//#import "HomeInformationSelectionCell.h"
//
//#import "HomeRedPointModel.h"
//#import "NoticeViewController.h"
//#import "BlackListViewController.h"
@interface to2ConsultingViewController ()
<UITableViewDelegate,
UITableViewDataSource
>

/// 主页面tableView
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *personArr;



@end

@implementation to2ConsultingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setVCTitle:@"咨询详情"];
    
    [self initData];
}
#pragma mark - 通知
//实现监听方法
-(void)personDetail:(NSNotification *)notification
{
    NSString *loadPathStr = notification.userInfo[@"personID"];
    if (![loadPathStr isEqualToString:@""]) {
        [self loadPerson:loadPathStr];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
[[NSNotificationCenter defaultCenter] removeObserver:self name:@"personDetail" object:self];
}
#pragma mark - 初始化一些必要的数据
- (void)initData{
    
    //数据初始化
    
    //对tableView进行必要的初始化
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"ConsultingDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"ConsultingDetailTableViewCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"ConsultingDownTableViewCell" bundle:nil] forCellReuseIdentifier:@"ConsultingDownTableViewCell"];
  
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self loadPerson:_personID];

    
}


- (void)loadPerson:(NSString *)personID{
    WEAK_SELF;
      [HttpRequestTool person_appearance_query:personID page:@"1" size:@"50" SuccessBlock:^(id responObject) {
           __weakSelf.personArr = (NSArray *)responObject[@"list"];
          [__weakSelf.tableView reloadData];
      } failureBlock:^(id err) {
          
      }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int section = (int)indexPath.section;
     if(0 == section){
        return 260.0f;
        
    }else{
        
        return 520.0f;
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int section = (int)indexPath.section;
    int row     = (int)indexPath.row;
    
    
    if (0 == section) {
        ConsultingDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ConsultingDetailTableViewCell"];
        cell.selectionStyle          = UITableViewCellSelectionStyleNone;
        [cell setContent:_personArr[0][@"personName"] ContextL:@"二级建造师" timeTextL:_personArr[0][@"appearanceTime"] stausTextL:_personArr[0][@"appearanceStatusDesc"] downTextL:_personArr[0][@"projectName"]];
        return cell;
    }else{
        ConsultingDownTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ConsultingDownTableViewCell"];
        cell.selectionStyle   = UITableViewCellSelectionStyleNone;
        [cell setContent:_personArr[0][@"feeTotal"] ContextL:_personArr[0][@"appearanceFee"] timeTextL:_personArr[0][@"trafficFee"] stausTextL:_personArr[0][@"otherFee"] downTextL:_personArr[0][@"otherFee"] cont1:_personArr[0][@"projectName"] cont2:_personArr[0][@"lockStatus"] cont3:_personArr[0][@"unlockTime"] cont4:_personArr[0][@"appearanceStatusDesc"] cont5:_personArr[0][@"appearanceTime"] cont6:_personArr[0][@"remark"] ];
        return cell;
        
    }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    
}
@end
