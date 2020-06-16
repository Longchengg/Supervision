//
//  QualificationsViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/14.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "QualificationsViewController.h"
#import "QualificationsTableViewCell.h"
#import "QualificationsModel.h"
#import "toQualificationsViewController.h"
@interface QualificationsViewController ()<
UITableViewDelegate,
UITableViewDataSource
>


@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (nonatomic, strong) NSArray *dataSourceArr;
@property (nonatomic, strong) NSString *applyTime;
@property (nonatomic, strong) QualificationsModel *qualificationsModel;


@end

@implementation QualificationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setVCTitle:@"资质管理"];
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
    [HttpRequestTool license_listSuccessBlock:^(id responObject) {
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
    [cell setlab1:_qualificationsModel.level lab2:_qualificationsModel.licenseCategory lab3:_qualificationsModel.validTime lab4:_qualificationsModel.licenseContainNames btn1:_qualificationsModel.alertStatus[@"status"] Sbtn1:_qualificationsModel.alertStatus[@"desc"] btn2:_qualificationsModel.backStatus];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.section;
    _qualificationsModel = [QualificationsModel mj_objectWithKeyValues:_dataSourceArr[index]];
    toQualificationsViewController *VC = [[toQualificationsViewController alloc]init];
    VC.toQualificationsModel = _qualificationsModel;
    VC.typeVC = @"1";
    [self.navigationController pushViewController:VC animated:YES];
}

@end
