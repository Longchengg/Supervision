//
//  TtoubiaoViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/19.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "TtoubiaoViewController.h"
#import "CertificatemanagementCell.h"
#import "TtoubiaoTableViewCell.h"
#import "tocertificatemanagementModel.h"
#import "toQualificationsViewController.h"
#import "QualificationsModel.h"
@interface TtoubiaoViewController ()
<UITableViewDelegate,
UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSourceArr;

@property (nonatomic, strong) NSString *substringT;
@property (nonatomic, strong) tocertificatemanagementModel *toModel;
@property (nonatomic, strong) QualificationsModel *qualificationsModel;

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) UIView *nullView;

@end

@implementation TtoubiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerNib:[UINib nibWithNibName:@"CertificatemanagementCell" bundle:nil] forCellReuseIdentifier:@"CertificatemanagementCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"TtoubiaoTableViewCell" bundle:nil] forCellReuseIdentifier:@"TtoubiaoTableViewCell"];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    //    //下拉刷新
    //    WEAK_SELF;
    //    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
    [self loadData:NO];
    //    }];
    //    //上拉加载更多
    //    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
    //        [__weakSelf loadData:YES];
    //    }];
    //
    //    //自动刷新
    //    [_tableView.mj_header beginRefreshing];
    
}

-(void)loadData:(BOOL)loadMore{
    
    WEAK_SELF;
    //
    //    [HttpRequestTool bid_get_all_lockSuccessBlock:^(id responObject) {
    //
    //        NSArray *arr = (NSArray *)responObject[@"list"];
    //
    //        [__weakSelf.dataSourceArr addObjectsFromArray:arr];
    //
    //        [__weakSelf.tableView reloadData];
    //
    //    } failureBlock:^(id err) {
    //
    //
    //    }];
    if ([_typeVC isEqual:@"1"]) {
        [HttpRequestTool bid_get_lock:_lockCertId
                         SuccessBlock:^(id responObject) {
            NSArray *arr = (NSArray *)responObject;
            [__weakSelf.dataSourceArr addObjectsFromArray:arr];
            
            [__weakSelf.tableView reloadData];
            if (__weakSelf.dataSourceArr.count == 0) {
                __weakSelf.tableView.hidden = YES;
                [__weakSelf.view addSubview:__weakSelf.nullView];
            }else{
                __weakSelf.tableView.hidden = NO;
                [__weakSelf.nullView removeFromSuperview];
            }
        } failureBlock:^(id err) {
            if (loadMore) {
                [__weakSelf.tableView.mj_footer endRefreshing];
                [__weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
                
            }else{
                [__weakSelf.tableView.mj_header endRefreshing];
            }
            
        }];
    }else{
        [HttpRequestTool bid_get_usable:_lockCertId
                           SuccessBlock:^(id responObject) {
            NSArray *arr = (NSArray *)responObject;
            [__weakSelf.dataSourceArr addObjectsFromArray:arr];
            
            [__weakSelf.tableView reloadData];
            if (__weakSelf.dataSourceArr.count == 0) {
                __weakSelf.tableView.hidden = YES;
                [__weakSelf.view addSubview:__weakSelf.nullView];
            }else{
                __weakSelf.tableView.hidden = NO;
                [__weakSelf.nullView removeFromSuperview];
            }
        } failureBlock:^(id err) {
            if (loadMore) {
                [__weakSelf.tableView.mj_footer endRefreshing];
                [__weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
                
            }else{
                [__weakSelf.tableView.mj_header endRefreshing];
            }
            
        }];
    }
    
}

- (UIView *)nullView{
    
    if (!_nullView) {
        _nullView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        //图片的显示是需要载体的；需要放在UIImageView；
        UIImageView *imgView = [[UIImageView alloc]init];
        //图片显示在屏幕上的大小是由载体控制的；
        //现在把载体的大小设置成图片的大小，使用图片的大小设置UIImageView的长宽；
        imgView.frame = CGRectMake(SCREEN_WIDTH/2 - 65 , SCREEN_HEIGHT/2 - 50  - Height_NavBar -50, 130, 100);
        [imgView setImage:[UIImage imageNamed:@"empty_license"]];
        
        [_nullView addSubview:imgView];
        
    }
    return _nullView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataSourceArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.section;
    if ([_typeVC isEqual:@"2"]) {
        NSArray *arr = _dataSourceArr[index][@"professionList"];
        return 115.0f + arr.count*25.0f;
    }else{
        return 70.0f;
    }
    
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
    if ([_typeVC isEqual:@"2"]) {
        
        CertificatemanagementCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CertificatemanagementCell"];
        cell.selectionStyle               = UITableViewCellSelectionStyleNone;
        [cell setCell:_dataSourceArr[index][@"personName"] certName:_dataSourceArr[index][@"certName"] safetyCert:_dataSourceArr[index][@"safetyCert"] backStatus:_dataSourceArr[index][@"backStatus"] lockStatus:_dataSourceArr[index][@"lockStatus"] professionList:_dataSourceArr[index][@"professionList"] cellIndex:index];
        
        
        return cell;
        
    }else{
        TtoubiaoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TtoubiaoTableViewCell"];
        cell.selectionStyle               = UITableViewCellSelectionStyleNone;
        [cell setpersonName:_dataSourceArr[index][@"personName"]  certName:_dataSourceArr[index][@"certName"]  unlockTime:_dataSourceArr[index][@"unlockTime"]  projectName:_dataSourceArr[index][@"projectName"] ];
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.section;
    if ([_typeVC isEqual:@"2"]) {
        
        _qualificationsModel = [QualificationsModel mj_objectWithKeyValues:_dataSourceArr[index]];
        toQualificationsViewController *VC = [[toQualificationsViewController alloc]init];
        VC.toQualificationsModel = _qualificationsModel;
        VC.typeVC = @"4";
        [self.navigationController pushViewController:VC animated:YES];
        
    }else{
        
    }
    
}

- (NSMutableArray *)dataSourceArr{
    
    if (!_dataSourceArr) {
        _dataSourceArr = [[NSMutableArray alloc]initWithCapacity:0];
    }
    
    return _dataSourceArr;
}

@end
