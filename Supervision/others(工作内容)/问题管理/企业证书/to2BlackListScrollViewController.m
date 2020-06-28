//
//  to2BlackListScrollViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/9.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "to2BlackListScrollViewController.h"
#import "to2BlackListViewController.h"

#import "to2BlackListScrollTableViewCell.h"

@interface to2BlackListScrollViewController ()
<UITableViewDelegate,
UITableViewDataSource>
{
    UIButton *currentBtn;
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSourceArr;
//
@property (nonatomic, strong) NSString *substringT;


@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) UIView *nullView;

@end

@implementation to2BlackListScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    _processStatus = @"0";
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
    if ([self.titleStr isEqual:@"资质证书"]) {
        WEAK_SELF;
        [HttpRequestTool comLicense:_processStatus page:[NSString stringWithFormat:@"%ld",(long)_page] size:@"10" successBlock:^(id responObject) {
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
    }else if ([self.titleStr isEqual:@"安全生产许可证"]){
        WEAK_SELF;
        [HttpRequestTool comSafetyLicense:_processStatus page:[NSString stringWithFormat:@"%ld",(long)_page] size:@"10" successBlock:^(id responObject) {
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
    }else if ([self.titleStr isEqual:@"四库一平台"]){
        WEAK_SELF;
        [HttpRequestTool fourlibCA:_processStatus type:@"1" page:[NSString stringWithFormat:@"%ld",(long)_page] size:@"10" successBlock:^(id responObject) {
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
    }else if ([self.titleStr isEqual:@"CA锁"]){
        WEAK_SELF;
        [HttpRequestTool fourlibCA:_processStatus type:@"2" page:[NSString stringWithFormat:@"%ld",(long)_page] size:@"10" successBlock:^(id responObject) {
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
        [HttpRequestTool digitalLicense:_processStatus page:[NSString stringWithFormat:@"%ld",(long)_page] size:@"10" successBlock:^(id responObject) {
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
//    WEAK_SELF;
//    if ([self.titleStr isEqual:@"资质证书"]) {
//        //资质
//        dispatch_async(dispatch_get_main_queue(), ^{
//
//            [HttpRequestTool comLicense:self->_processStatus page:@"1" size:@"50" successBlock:^(id responObject) {
//                NSArray *arr = (NSArray *)responObject[@"list"];
//                __weakSelf.dataSourceArr = [[NSMutableArray alloc]initWithArray:arr];
//                [self.tableView reloadData];
//            } failureBlock:^(id err) {
//
//            }];
//
//        });
//
//    }else if ([self.titleStr isEqual:@"安全生产许可证"]){
//        //安全
//        dispatch_async(dispatch_get_main_queue(), ^{
//
//            [HttpRequestTool comSafetyLicense:self->_processStatus page:@"1" size:@"50" successBlock:^(id responObject) {
//                NSArray *arr = (NSArray *)responObject[@"list"];
//                __weakSelf.dataSourceArr = [[NSMutableArray alloc]initWithArray:arr];
//                [self.tableView reloadData];
//            } failureBlock:^(id err) {
//
//            }];
//
//        });
//    }else if ([self.titleStr isEqual:@"四库一平台"]){
//        //四库
//        dispatch_async(dispatch_get_main_queue(), ^{
//
//            [HttpRequestTool fourlibCA:self->_processStatus type:@"1" page:@"1" size:@"50" successBlock:^(id responObject) {
//                NSArray *arr = (NSArray *)responObject[@"list"];
//                __weakSelf.dataSourceArr = [[NSMutableArray alloc]initWithArray:arr];
//                [self.tableView reloadData];
//            } failureBlock:^(id err) {
//
//            }];
//
//        });
//    }else if ([self.titleStr isEqual:@"CA锁"]){
//
//        //CA锁
//        dispatch_async(dispatch_get_main_queue(), ^{
//
//            [HttpRequestTool fourlibCA:self->_processStatus type:@"2" page:@"1" size:@"50" successBlock:^(id responObject) {
//                NSArray *arr = (NSArray *)responObject[@"list"];
//                __weakSelf.dataSourceArr = [[NSMutableArray alloc]initWithArray:arr];
//                [self.tableView reloadData];
//
//            } failureBlock:^(id err) {
//
//            }];
//
//        });
//    }else{
//        //数字
//        dispatch_async(dispatch_get_main_queue(), ^{
//
//            [HttpRequestTool digitalLicense:self->_processStatus page:@"1" size:@"50" successBlock:^(id responObject) {
//                NSArray *arr = (NSArray *)responObject[@"list"];
//                __weakSelf.dataSourceArr = [[NSMutableArray alloc]initWithArray:arr];
//                [self.tableView reloadData];
//
//            } failureBlock:^(id err) {
//
//            }];
//
//        });
//
//    }
//}



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
    //    _labelT.text = textStr1; 头
    //    _labelt.text = textStr2; 副标题
    //    _labelDt.text = textStr3; 到期时间
    //    _labelContext.text = textStr4; 内容  remark
    //    _labelYt.text = textStr5;  预计时间
    to2BlackListScrollTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"to2BlackListScrollTableViewCell"];
    cell.selectionStyle               = UITableViewCellSelectionStyleNone;
    
    
    
    if ([self.titleStr isEqual:@"资质证书"]) {
        _substringT =[NSString stringWithFormat:@"%@\n%@",_dataSourceArr[index][@"level"],_dataSourceArr[index][@"licenseContainNames"]];
        
        if (![[NSString stringWithFormat:@"%@",_dataSourceArr[index][@"remark"]]isEqual:@"<null>"]) {
            _substringT =[NSString stringWithFormat:@"%@\n备注:%@",_substringT,_dataSourceArr[index][@"remark"]];
        }
        [cell setprocessStatus:_processStatus label1:_dataSourceArr[index][@"problemType"] label3:_dataSourceArr[index][@"validTime"] label4:_substringT label5:_dataSourceArr[index][@"forecastEndTime"]];
        
        return cell;
    }else if ([self.titleStr isEqual:@"安全生产许可证"]) {
        
        _substringT = _dataSourceArr[index][@"scopeDesc"];
        //替换某个字符
        _substringT = [_substringT stringByReplacingOccurrencesOfString:@"/" withString:@"\n"];
        if (![[NSString stringWithFormat:@"%@",_dataSourceArr[index][@"remark"]]isEqual:@"<null>"]) {
            _substringT =[NSString stringWithFormat:@"%@\n备注:%@",_substringT,_dataSourceArr[index][@"remark"]];
        }
        [cell setprocessStatus:_processStatus label1:_dataSourceArr[index][@"problemType"] label3:_dataSourceArr[index][@"validTime"] label4:_substringT label5:_dataSourceArr[index][@"forecastEndTime"]];
        return cell;
    }else if ([self.titleStr isEqual:@"四库一平台"]) {
        if (![[NSString stringWithFormat:@"%@",_dataSourceArr[index][@"remark"]]isEqual:@"<null>"]) {
            _substringT =[NSString stringWithFormat:@"备注:%@",_dataSourceArr[index][@"remark"]];
        }
        [cell setprocessStatus:_processStatus label1:_dataSourceArr[index][@"problemType"] label3:_dataSourceArr[index][@"validTime"] label4:_substringT label5:_dataSourceArr[index][@"forecastEndTime"]];
        return cell;
    }else if ([self.titleStr isEqual:@"CA锁"]) {
        if (![[NSString stringWithFormat:@"%@",_dataSourceArr[index][@"remark"]]isEqual:@"<null>"]) {
            _substringT =[NSString stringWithFormat:@"备注:%@",_dataSourceArr[index][@"remark"]];
        }
        [cell setprocessStatus:_processStatus label1:_dataSourceArr[index][@"problemType"] label3:_dataSourceArr[index][@"validTime"] label4:_substringT label5:_dataSourceArr[index][@"forecastEndTime"]];
        return cell;
    }else {
        _substringT =[NSString stringWithFormat:@"使用地区:%@",_dataSourceArr[index][@"regions"]];
        if (![[NSString stringWithFormat:@"%@",_dataSourceArr[index][@"remark"]]isEqual:@"<null>"]) {
            _substringT =[NSString stringWithFormat:@"使用地区:%@\n备注:%@",_dataSourceArr[index][@"regions"],_dataSourceArr[index][@"remark"]];
        }
        [cell setprocessStatus:_processStatus label1:_dataSourceArr[index][@"problemType"] label3:_dataSourceArr[index][@"validTime"] label4:_substringT label5:_dataSourceArr[index][@"forecastEndTime"]];
        return cell;
    }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    int index = (int)indexPath.section;
    //    switch (_selectedIndex) {
    //        case 0:
    //        {
    //            to2BlackListViewController *VC = [[to2BlackListViewController alloc]init];
    //            VC.titleStr = [NSString stringWithFormat:@"%@待处理", _dataSourceArr[index][@"category"]];
    //            [self.navigationController pushViewController:VC animated:YES];
    //        }
    //            break;
    //        case 1:
    //        {
    //            toBlackListViewController *VC = [[toBlackListViewController alloc]init];
    //            VC.titleStr = [NSString stringWithFormat:@"%@处理中", _dataSourceArr[index][@"category"]];
    //            [self.navigationController pushViewController:VC animated:YES];
    //        }
    //            break;
    //        case 2:
    //        {
    //            toBlackListViewController *VC = [[toBlackListViewController alloc]init];
    //            VC.titleStr = [NSString stringWithFormat:@"%@已处理", _dataSourceArr[index][@"category"]];
    //            [self.navigationController pushViewController:VC animated:YES];
    //        }
    //            break;
    //
    //        default:
    //            break;
    //    }
    
    
}

- (NSMutableArray *)dataSourceArr{
    
    if (!_dataSourceArr) {
        _dataSourceArr = [[NSMutableArray alloc]initWithCapacity:0];
    }
    
    return _dataSourceArr;
}


@end
