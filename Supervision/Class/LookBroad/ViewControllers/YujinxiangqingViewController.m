//
//  YujinxiangqingViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/21.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "YujinxiangqingViewController.h"
#import "BKMenuListView.h"
#import "YujinxiangqingTableViewCell.h"
#import "YujinxiangqingModel.h"
@interface YujinxiangqingViewController ()<
UITableViewDelegate,
UITableViewDataSource,
BKMenuListViewDelegate
>
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSourceArr;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, strong) BKMenuListView *menuListView;
@property (nonatomic, assign) NSInteger selectedIndex;

@property (nonatomic, strong) NSString * validStatus;
@property (nonatomic, strong) YujinxiangqingModel * yujinxiangqingModel;


@end

@implementation YujinxiangqingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setVCTitle:@"预警详情"];
    _validStatus = @"2";
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight =  UITableViewAutomaticDimension;//设置cell的高度为自动计算，只有才xib或者storyboard上自定义的cell才会生效，而且需要设置好约束
    _tableView.estimatedRowHeight = 200;//必须设置好预估值
    [_tableView registerNib:[UINib nibWithNibName:@"YujinxiangqingTableViewCell" bundle:nil] forCellReuseIdentifier:@"YujinxiangqingTableViewCell"];
    
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
    
    [self loadSubViews];

}

-(void)loadData:(BOOL)loadMore{

    if (loadMore) {
        _page ++;
        
    }else{
        _page = 1;
        
    }
    WEAK_SELF;
    [HttpRequestTool client_alert_query:[NSString stringWithFormat:@"%ld",(long)_page] size:@"10" validStatus:_validStatus SuccessBlock:^(id responObject) {
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

- (void)loadSubViews{
    
    [_topView addSubview:self.menuListView];
    
}

- (BKMenuListView *)menuListView{
    if (!_menuListView) {
        
        NSArray *arr = @[@"已过期",@"即将过期"];
        
        _menuListView = [[BKMenuListView alloc] initWithListViewType:BKMenuListViewTypeDefault dataSourceArray:arr frame:CGRectMake(0, 0, SCREEN_WIDTH, 50) delegate:self];
        [_menuListView setValueBottomViewIsShow:NO];
        [_menuListView setListButtonWithFontSize:16.0f height:50 selectTitleColor:MColor normalTitleColor:SubTextColor];
        [_menuListView setListButtonWithSpacing:10.0f];
        [_menuListView setSliderViewBottom:5];
        [_menuListView setSliderViewHeight:2 color:MColor widthValue:0.3 andIsYuanJiao:YES];
        [_menuListView loadUI];
        [_menuListView setNormalSelectIndex:_selectedIndex];
    }
    
    return _menuListView;
}

#pragma mark -  MenuListViewDelegate
/**
 当前选择的下标
 
 @param indexNumber 下标
 */
- (void)menuListView:(BKMenuListView *)menuListView selectButtonCallbackIndex:(NSInteger)indexNumber {
    if (indexNumber < 0) {
        indexNumber = 0;
    }
    
    if (indexNumber != _selectedIndex) {
        
        _selectedIndex = indexNumber;
        //这个地方 处理跳转
        if (indexNumber == 0) {
            _validStatus =@"2";
         }else{
            _validStatus =@"1";
        }
        [self loadData:NO];
        
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataSourceArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//            return 135.0f;
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
    
    int index = (int)indexPath.section;
    _yujinxiangqingModel = [YujinxiangqingModel mj_objectWithKeyValues:_dataSourceArr[index]];
    YujinxiangqingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YujinxiangqingTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setCell:_yujinxiangqingModel.alertType alertItem:_yujinxiangqingModel.alertItem alertObjectName:_yujinxiangqingModel.alertObjectName validTime:_yujinxiangqingModel.validTime days:_yujinxiangqingModel.days];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    int index = (int)indexPath.section;
    
}
#pragma mark - cell按钮 delegate

- (NSMutableArray *)dataSourceArr{
    if (!_dataSourceArr) {
        _dataSourceArr = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _dataSourceArr;
}


@end
