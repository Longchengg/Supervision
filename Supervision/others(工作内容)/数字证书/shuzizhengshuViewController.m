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

@property (nonatomic, strong) NSMutableArray *dataSourceArr;
@property (nonatomic, strong) NSString *applyTime;
@property (nonatomic, strong) QualificationsModel *qualificationsModel;

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) UIView *nullView;

@end

@implementation shuzizhengshuViewController
- (NSMutableArray *)dataSourceArr{
    if (!_dataSourceArr) {
        _dataSourceArr = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _dataSourceArr;
}
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
    
    //下拉刷新
    WEAK_SELF;
    _tableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [__weakSelf loadData:NO];
    }];
    //上拉加载更多
    _tableview.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [__weakSelf loadData:YES];
    }];
    
    //自动刷新
    [_tableview.mj_header beginRefreshing];
}


-(void)loadData:(BOOL)loadMore{
    
    if (loadMore) {
        _page ++;
        
    }else{
        _page = 1;
        
    }
    WEAK_SELF;
    [HttpRequestTool digital_listSuccessBlock:^(id responObject) {
        //是否是加载更多
        [__weakSelf.tableview.mj_footer endRefreshing];
        [__weakSelf.tableview.mj_header endRefreshing];
        
        if (loadMore) {
            //隐藏 footer
        }else{
            //隐藏 header
            [__weakSelf.dataSourceArr removeAllObjects];
        }
        NSArray *arr = (NSArray *)responObject;
        
        [__weakSelf.dataSourceArr addObjectsFromArray:arr];
        //这个地方 10 是size count 满足 size 表示有下一页 page会++
        //        if (arr.count != 10) {
        //无更多数据 执行这个方法之后 无法再次 上拉加载更多了
        [__weakSelf.tableview.mj_footer endRefreshingWithNoMoreData];
        //        }
        
        [__weakSelf.tableview reloadData];
        
        if (__weakSelf.dataSourceArr.count == 0) {
            __weakSelf.tableview.hidden = YES;
            [__weakSelf.view addSubview:__weakSelf.nullView];
        }else{
            __weakSelf.tableview.hidden = NO;
            [__weakSelf.nullView removeFromSuperview];
        }
    } failureBlock:^(id err) {
        if (loadMore) {
            [__weakSelf.tableview.mj_footer endRefreshing];
            [__weakSelf.tableview.mj_footer endRefreshingWithNoMoreData];
            
        }else{
            [__weakSelf.tableview.mj_header endRefreshing];
        }
    }];
    
}

- (UIView *)nullView{
    
    if (!_nullView) {
        _nullView = [[UIView alloc]initWithFrame:CGRectMake(0, Height_NavBar, SCREEN_WIDTH, SCREEN_HEIGHT-Height_NavBar)];
        //图片的显示是需要载体的；需要放在UIImageView；
        UIImageView *imgView = [[UIImageView alloc]init];
        //图片显示在屏幕上的大小是由载体控制的；
        //现在把载体的大小设置成图片的大小，使用图片的大小设置UIImageView的长宽；
        imgView.frame = CGRectMake(SCREEN_WIDTH/2 - 65 , SCREEN_HEIGHT/2 - 50 -Height_NavBar, 130, 100);
        [imgView setImage:[UIImage imageNamed:@"empty_license"]];
        
        [_nullView addSubview:imgView];
        
    }
    return _nullView;
}
//- (void)updateUI{
//    
//    //    [self.dataSourceArr removeAllObjects];
//    //    _page = 1;
//    //
//    //    [self loadMore];
//    WEAK_SELF;
//    [HttpRequestTool digital_listSuccessBlock:^(id responObject) {
//        __weakSelf.dataSourceArr = (NSArray *)responObject;
//        
//        [__weakSelf.tableview reloadData];
//    } failureBlock:^(id err) {
//        
//    }];
//}

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
