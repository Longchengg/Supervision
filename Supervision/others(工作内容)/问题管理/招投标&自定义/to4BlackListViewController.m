//
//  to4BlackListViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/10.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "to4BlackListViewController.h"

#import "to2BlackListScrollTableViewCell.h"

@interface to4BlackListViewController ()
<UITableViewDelegate,
UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSourceArr;

@property (nonatomic, strong) NSString *substringT;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) UIView *nullView;


@end

@implementation to4BlackListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setVCTitle:_titleStr];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight =  UITableViewAutomaticDimension;//设置cell的高度为自动计算，只有才xib或者storyboard上自定义的cell才会生效，而且需要设置好约束
    _tableView.estimatedRowHeight = 150;//必须设置好预估值
    
    [_tableView registerNib:[UINib nibWithNibName:@"to2BlackListScrollTableViewCell" bundle:nil] forCellReuseIdentifier:@"to2BlackListScrollTableViewCell"];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    //下拉刷新
    WEAK_SELF;
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [__weakSelf loadData:NO];
    }];
    //上拉加载更多
    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [__weakSelf loadData:YES];
    }];
    
    //自动刷新
    [_tableView.mj_header beginRefreshing];
}
-(void)loadData:(BOOL)loadMore{
    
    if (loadMore) {
        _page ++;
        
    }else{
        _page = 1;
        
    }
    if ([_typeVC isEqual:@"0"]) {
        WEAK_SELF;
        [HttpRequestTool problem_bid:_processStatus page:[NSString stringWithFormat:@"%ld",(long)_page] size:@"10" SuccessBlock:^(id responObject) {
            //是否是加载更多
            [__weakSelf.tableView.mj_footer endRefreshing];
            [__weakSelf.tableView.mj_header endRefreshing];
            
            if (loadMore) {
                //隐藏 footer
            }else{
                //隐藏 header
                [__weakSelf.dataSourceArr removeAllObjects];
            }
            NSArray *arr = (NSArray *)responObject[@"list"];
            [__weakSelf.dataSourceArr addObjectsFromArray:arr];
            //这个地方 10 是size count 满足 size 表示有下一页 page会++
            if (arr.count != 10) {
                //无更多数据 执行这个方法之后 无法再次 上拉加载更多了
                [__weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            
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
        WEAK_SELF;
        [HttpRequestTool problem_userDefined:_processStatus page:[NSString stringWithFormat:@"%ld",(long)_page] size:@"10" SuccessBlock:^(id responObject) {
            //是否是加载更多
            [__weakSelf.tableView.mj_footer endRefreshing];
            [__weakSelf.tableView.mj_header endRefreshing];
            
            if (loadMore) {
                //隐藏 footer
            }else{
                //隐藏 header
                [__weakSelf.dataSourceArr removeAllObjects];
            }
            NSArray *arr = (NSArray *)responObject[@"list"];
            [__weakSelf.dataSourceArr addObjectsFromArray:arr];
            //这个地方 10 是size count 满足 size 表示有下一页 page会++
            if (arr.count != 10) {
                //无更多数据 执行这个方法之后 无法再次 上拉加载更多了
                [__weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            
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
        imgView.frame = CGRectMake(SCREEN_WIDTH/2 - 65 , SCREEN_HEIGHT/2 - 50 - Height_NavBar, 130, 100);
        [imgView setImage:[UIImage imageNamed:@"empty_license"]];
        
        [_nullView addSubview:imgView];
        
    }
    return _nullView;
}


//- (void)loadMore{
//    if ([_typeVC isEqual:@"0"]) {
//        WEAK_SELF;
//        [HttpRequestTool problem_bid:_processStatus page:@"1" size:@"50" SuccessBlock:^(id responObject) {
//            NSArray *arr = (NSArray *)responObject[@"list"];
//            __weakSelf.dataSourceArr = [[NSMutableArray alloc]initWithArray:arr];
//            [self.tableView reloadData];
//        } failureBlock:^(id err) {
//            [self showAlertMsg:err];
//        }];
//    }else{
//        WEAK_SELF;
//        [HttpRequestTool problem_userDefined:_processStatus page:@"1" size:@"50" SuccessBlock:^(id responObject) {
//            NSArray *arr = (NSArray *)responObject[@"list"];
//            __weakSelf.dataSourceArr = [[NSMutableArray alloc]initWithArray:arr];
//            [self.tableView reloadData];
//        } failureBlock:^(id err) {
//            [self showAlertMsg:err];
//        }];
//    }
//}
//



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //    return 4;
    return _dataSourceArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //    return _dataSourceArr.count;
    return 1;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    return 60.0f;
//}

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
    if ([_typeVC isEqual:@"0"]) {
        to2BlackListScrollTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"to2BlackListScrollTableViewCell"];
        cell.selectionStyle               = UITableViewCellSelectionStyleNone;
        _substringT =[NSString stringWithFormat:@"%@",_dataSourceArr[index][@"problemDetail"]];
        if (![[NSString stringWithFormat:@"%@",_dataSourceArr[index][@"remark"]]isEqual:@"<null>"]) {
            _substringT =[NSString stringWithFormat:@"%@\n备注:%@",_substringT,_dataSourceArr[index][@"remark"]];
        }
        [cell setprocessStatus1:_processStatus label1:[NSString stringWithFormat:@"类型:%@",_dataSourceArr[index][@"targetName"]] label3:_dataSourceArr[index][@"validTime"] label4:_substringT label5:_dataSourceArr[index][@"forecastEndTime"]];
        
        return cell;
    }else{
        to2BlackListScrollTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"to2BlackListScrollTableViewCell"];
        cell.selectionStyle               = UITableViewCellSelectionStyleNone;
        _substringT =[NSString stringWithFormat:@"%@\n%@",_dataSourceArr[index][@"processMethod"],_dataSourceArr[index][@"problemDetail"]];
        
        if (![[NSString stringWithFormat:@"%@",_dataSourceArr[index][@"remark"]]isEqual:@"<null>"]) {
            _substringT =[NSString stringWithFormat:@"%@\n备注:%@",_substringT,_dataSourceArr[index][@"remark"]];
        }
        [cell setprocessStatus1:_processStatus label1:[NSString stringWithFormat:@"类型:%@",_dataSourceArr[index][@"problemType"]] label3:_dataSourceArr[index][@"validTime"] label4:_substringT label5:_dataSourceArr[index][@"forecastEndTime"]];
        
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    int index = (int)indexPath.section;
    
    
    
}

- (NSMutableArray *)dataSourceArr{
    
    if (!_dataSourceArr) {
        _dataSourceArr = [[NSMutableArray alloc]initWithCapacity:0];
    }
    
    return _dataSourceArr;
}


@end
