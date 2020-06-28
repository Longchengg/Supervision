//
//  MessageMainViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/23.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "MessageMainViewController.h"
#import "MessageMainTableViewCell.h"
#import "MessageMainModel.h"
#import "NoticeViewController.h"
#import "toJianNiuzixunViewController.h"
@interface MessageMainViewController ()<
UITableViewDelegate,
UITableViewDataSource
>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSourceArr;
@property (nonatomic, strong) NSMutableArray *alertList;

@property (nonatomic, strong) MessageMainModel *messageMainModel;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, strong) UIView *nullView;

@end

@implementation MessageMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setVCTitle:@"消息"];
    [self RightBtn];
    [self alertData];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"MessageMainTableViewCell" bundle:nil] forCellReuseIdentifier:@"MessageMainTableViewCell"];
    
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
-(void)alertData{
    WEAK_SELF;
    [HttpRequestTool indexMessageSuccessBlock:^(id responObject) {
           
           NSArray *arr = (NSArray *)responObject;
           [__weakSelf.alertList addObjectsFromArray:arr];
       } failureBlock:^(id err) {
           
       }];
}

-(void)RightBtn{
    UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [cancleButton setTitle:@"全部已读" forState:UIControlStateNormal];
    [cancleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancleButton addTarget:self action:@selector(cancleButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:cancleButton];
    rightItem.imageInsets = UIEdgeInsetsMake(0, -15,0, 0);//设置向左偏移
    self.navigationItem.rightBarButtonItem = rightItem;
}
-(void)cancleButtonClicked{
    NSLog(@"已读");
    WEAK_SELF;
    [HttpRequestTool client_push_readAllsuccessBlock:^(id responObject) {
        [__weakSelf loadData:NO];
//        [__weakSelf showAlertMsg:@"已全部标记为已读"];
    } failureBlock:^(id err) {
        
    }];
}

-(void)loadData:(BOOL)loadMore{
    if (loadMore) {
        _page ++;
        
    }else{
        _page = 1;
        
    }
    WEAK_SELF;
    [HttpRequestTool client_push_message:[NSString stringWithFormat:@"%ld",(long)_page] size:@"10" SuccessBlock:^(id responObject) {
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

- (UIView *)nullView{
    
    if (!_nullView) {
        _nullView = [[UIView alloc]initWithFrame:CGRectMake(0,Height_NavBar, SCREEN_WIDTH, SCREEN_HEIGHT)];
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



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataSourceArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 135.0f;
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
    
    int index = (int)indexPath.section;
    
    MessageMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageMainTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _messageMainModel = [MessageMainModel mj_objectWithKeyValues:_dataSourceArr[index]];
    [cell settitle:_messageMainModel.title updateTime:_messageMainModel.updateTime content:_messageMainModel.content readFlag:_messageMainModel.readFlag];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    int index = (int)indexPath.section;
    _messageMainModel = [MessageMainModel mj_objectWithKeyValues:_dataSourceArr[index]];
    [HttpRequestTool client_push_bind:_messageMainModel.messageId successBlock:^(id responObject) {
        if ([self->_messageMainModel.type isEqual:@"ALERT"]) {
            NoticeViewController *VC = [[NoticeViewController alloc]init];
            VC.dataSource = self->_alertList;
            [self.navigationController pushViewController:VC animated:YES];
        }else{
            toJianNiuzixunViewController *nextVC = [[toJianNiuzixunViewController alloc] init];
            nextVC.xinxiUrl = self->_messageMainModel.url;
            [self.navigationController pushViewController:nextVC animated:NO];
        }
    } failureBlock:^(id err) {
        
    }];
    
}
- (NSMutableArray *)dataSourceArr{
    if (!_dataSourceArr) {
        _dataSourceArr = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _dataSourceArr;
}
- (NSMutableArray *)alertList{
    if (!_alertList) {
        _alertList = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _alertList;
}



@end
