//
//  CertificatemanagementScroVC.m
//  Supervision
//
//  Created by 龙成 on 2020/6/16.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "CertificatemanagementScroVC.h"
#import "CertificatemanagementCell.h"
#import "tocertificatemanagementModel.h"
#import "toQualificationsViewController.h"
#import "QualificationsModel.h"
@interface CertificatemanagementScroVC ()
<UITableViewDelegate,
UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSourceArr;

@property (nonatomic, strong) NSString *substringT;
@property (nonatomic, strong) tocertificatemanagementModel *toModel;
@property (nonatomic, strong) QualificationsModel *qualificationsModel;


@end

@implementation CertificatemanagementScroVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.delegate = self;
    _tableView.dataSource = self;

    [_tableView registerNib:[UINib nibWithNibName:@"CertificatemanagementCell" bundle:nil] forCellReuseIdentifier:@"CertificatemanagementCell"];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self loadMore];
    }];
    
    [self updateUI];
}

- (void)updateUI{
    
    //    [self.dataSourceArr removeAllObjects];
    //    _page = 1;
    
    [self loadMore];
}

- (void)loadMore{
     WEAK_SELF;
    [HttpRequestTool personcert_query:_certCategoryId page:@"1" size:@"50" SuccessBlock:^(id responObject) {
        __weakSelf.dataSourceArr = (NSArray *)responObject[@"list"];
        [__weakSelf.tableView reloadData];
    } failureBlock:^(id err) {
        
    }];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 4;
        return _dataSourceArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.section;
    NSArray *arr = _dataSourceArr[index][@"professionList"];
    return 115.0f + arr.count*25.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 8;
    
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
    
    int index = (int)indexPath.section;
    CertificatemanagementCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CertificatemanagementCell"];
    cell.selectionStyle               = UITableViewCellSelectionStyleNone;
    [cell setCell:_dataSourceArr[index][@"personName"] certName:_dataSourceArr[index][@"certName"] safetyCert:_dataSourceArr[index][@"safetyCert"] backStatus:_dataSourceArr[index][@"backStatus"] lockStatus:_dataSourceArr[index][@"lockStatus"] professionList:_dataSourceArr[index][@"professionList"] cellIndex:index];
    
        
        return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.section;
    _qualificationsModel = [QualificationsModel mj_objectWithKeyValues:_dataSourceArr[index]];
    toQualificationsViewController *VC = [[toQualificationsViewController alloc]init];
    VC.toQualificationsModel = _qualificationsModel;
    VC.typeVC = @"4";
    [self.navigationController pushViewController:VC animated:YES];
    
}

- (NSMutableArray *)dataSourceArr{
    
    if (!_dataSourceArr) {
        _dataSourceArr = [[NSMutableArray alloc]initWithCapacity:0];
    }
    
    return _dataSourceArr;
}
@end
