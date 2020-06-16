//
//  shuzizhengshuViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/15.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "shuzizhengshuViewController.h"
#import "QualificationsTableViewCell.h"
#import "QualificationsModel.h"
#import "toQualificationsViewController.h"
@interface shuzizhengshuViewController ()<
UITableViewDelegate,
UITableViewDataSource
>


@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (nonatomic, strong) NSArray *dataSourceArr;
@property (nonatomic, strong) NSString *applyTime;
@property (nonatomic, strong) QualificationsModel *qualificationsModel;


@end

@implementation shuzizhengshuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setVCTitle:@"安全生产许可证"];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.rowHeight =  UITableViewAutomaticDimension;//设置cell的高度为自动计算，只有才xib或者storyboard上自定义的cell才会生效，而且需要设置好约束
    _tableview.estimatedRowHeight = 200;//必须设置好预估值
//    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableview registerNib:[UINib nibWithNibName:@"QualificationsTableViewCell" bundle:nil] forCellReuseIdentifier:@"QualificationsTableViewCell"];
    
    if (@available(iOS 11.0, *)) {
        self.tableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    _tableview.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self loadMore];
    }];
    
    [self updateUI];
    
}
- (void)updateUI{
    
//    [self.dataSourceArr removeAllObjects];
//    _page = 1;
//
//    [self loadMore];
    WEAK_SELF;
    [HttpRequestTool digital_listSuccessBlock:^(id responObject) {
        __weakSelf.dataSourceArr = (NSArray *)responObject;
        
        [__weakSelf.tableview reloadData];
    } failureBlock:^(id err) {
        
    }];
}

- (void)loadMore{
    
  
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataSourceArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
//        return _dataSourceArr.count;
    return 1;
    
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//
//    return 85.0f;
//
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{


    return 8.0f;

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
    QualificationsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QualificationsTableViewCell"];
    cell.selectionStyle          = UITableViewCellSelectionStyleNone;
    _qualificationsModel = [QualificationsModel mj_objectWithKeyValues:_dataSourceArr[index]];
    NSString * contextSub = [NSString stringWithFormat:@"类型：%@\n购买时间：%@\n到期时间：%@\n使用地区：%@\n颁发机构：%@\n",_qualificationsModel.certificateName,_qualificationsModel.buyTime,_qualificationsModel.validTime,_qualificationsModel.regions,_qualificationsModel.signOrgan];
    
    [cell setlab1:@"数字证书" lab2:@"" lab3:@"详情 >" lab4:contextSub btn1:_qualificationsModel.alertStatus[@"status"] Sbtn1:_qualificationsModel.alertStatus[@"desc"] btn2:_qualificationsModel.backStatus];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.section;
    _qualificationsModel = [QualificationsModel mj_objectWithKeyValues:_dataSourceArr[index]];
    toQualificationsViewController *VC = [[toQualificationsViewController alloc]init];
    VC.toQualificationsModel = _qualificationsModel;
    VC.typeVC = @"3";
    [self.navigationController pushViewController:VC animated:YES];
}
@end
