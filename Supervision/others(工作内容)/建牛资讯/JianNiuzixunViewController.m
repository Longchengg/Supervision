//
//  JianNiuzixunViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/21.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "JianNiuzixunViewController.h"
#import "JianNiuTableViewCell.h"
#import "JianNIUzixunModel.h"
#import "JianNiuWebViewController.h"
#import "ToJianNiuWebVC.h"
#import "toJianNiuzixunViewController.h"

@interface JianNiuzixunViewController ()
<UITableViewDelegate,
UITableViewDataSource,
UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, copy) NSString *categoryId;
@property (nonatomic, copy) NSString *keywords;


@property (nonatomic,strong) NSMutableArray *dataSourceArr;
@property (nonatomic,strong) JianNIUzixunModel *jianNIUzixunModel;



@end

@implementation JianNiuzixunViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _searchTextField.delegate = self;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight =  UITableViewAutomaticDimension;//设置cell的高度为自动计算，只有才xib或者storyboard上自定义的cell才会生效，而且需要设置好约束
    _tableView.estimatedRowHeight = 200;//必须设置好预估值
    [_tableView registerNib:[UINib nibWithNibName:@"JianNiuTableViewCell" bundle:nil] forCellReuseIdentifier:@"JianNiuTableViewCell"];
    
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
    WEAK_SELF;
    [HttpRequestTool policy_article:_categoryId keyword:_keywords
                               page:[NSString stringWithFormat:@"%ld",(long)_page]
                               size:@"10"
                       SuccessBlock:^(id responObject) {
        //是否是加载更多
        if (loadMore) {
            //隐藏 footer
            [__weakSelf.tableView.mj_footer endRefreshing];
        }else{
            //隐藏 header
            [__weakSelf.tableView.mj_header endRefreshing];
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
        
    } failureBlock:^(id err) {
        if (loadMore) {
            [__weakSelf.tableView.mj_footer endRefreshing];
            [__weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
            
        }else{
            [__weakSelf.tableView.mj_header endRefreshing];
        }
        
    }];
}


- (IBAction)DidbackClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSourceArr.count;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    
//    return 110.0f;
//    
//}

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
    
    int row = (int)indexPath.row;
    
    JianNiuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JianNiuTableViewCell"];
    cell.selectionStyle           = UITableViewCellSelectionStyleNone;
    _jianNIUzixunModel = [JianNIUzixunModel mj_objectWithKeyValues:_dataSourceArr[row]];
    [cell setCelllab1:_jianNIUzixunModel.title lab2:_jianNIUzixunModel.source lab3:_jianNIUzixunModel.updateTime];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    int row = (int)indexPath.row;
    _jianNIUzixunModel = [JianNIUzixunModel mj_objectWithKeyValues:_dataSourceArr[row]];
    toJianNiuzixunViewController *nextVC = [[toJianNiuzixunViewController alloc] init];
    nextVC.webId = _jianNIUzixunModel.ID;
//    nextVC.titelStr = _jianNIUzixunModel.title;
    [self.navigationController pushViewController:nextVC animated:NO];
}

- (NSMutableArray *)dataSourceArr{
    
    if (!_dataSourceArr) {
        _dataSourceArr = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _dataSourceArr;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self search];
    return YES;
}

- (void)search{
    _keywords = _searchTextField.text;
    [_searchTextField endEditing:YES];
    NSLog(@"search :%@",_keywords);
    
    [self loadData:NO];
    
}




@end
