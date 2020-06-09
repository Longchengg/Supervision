//
//  BlackListViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/5/25.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "BlackListViewController.h"

#import "BlackListTableViewCell.h"
#import "toBlackListViewController.h"
//#import "EnterpriseListTableViewCell.h"
//#import "PersonListTableViewCell.h"
//#import "CarListTableViewCell.h"

#import "BKMenuListView.h"

@interface BlackListViewController ()
<UITableViewDelegate,
UITableViewDataSource,
UITextFieldDelegate,
BKMenuListViewDelegate>
{
    UIButton *currentBtn;
    
}
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, assign) NSInteger selectedIndex;

@property (nonatomic, strong) NSMutableArray *dataSourceArr;

//@property (nonatomic, assign) NSInteger page;
//0 待处理 1处理中 2已处理
@property (nonatomic, strong) NSString *processStatus;

@property (nonatomic, strong) BKMenuListView *menuListView;

@end

@implementation BlackListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setVCTitle:@"问题进度"];
    _processStatus = @"0";
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"BlackListTableViewCell" bundle:nil] forCellReuseIdentifier:@"BlackListTableViewCell"];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self loadMore];
    }];
    
    [self updateUI];
    [self loadSubViews];
}

- (void)updateUI{
    
    //    [self.dataSourceArr removeAllObjects];
    //    _page = 1;
    
    [self loadMore];
}

- (void)loadMore{
    WEAK_SELF;
    [HttpRequestTool problem_process:_processStatus
                        successBlock:^(id responObject) {
        
        NSArray *arr = (NSArray *)responObject;
        __weakSelf.dataSourceArr = [[NSMutableArray alloc]initWithArray:arr];
        [__weakSelf.tableView reloadData];
        [__weakSelf.tableView.mj_header endRefreshing];
    }
                        failureBlock:^(id err) {
        
        [self showAlertMsg:err];
        [__weakSelf.tableView.mj_header endRefreshing];
        
    }];
}
- (void)loadSubViews{
    
    [_topView addSubview:self.menuListView];
    
}

- (BKMenuListView *)menuListView{
    if (!_menuListView) {
        
        NSArray *arr = @[@"待处理",@"处理中",@"已处理"];
        
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
            _processStatus =@"0";
        }else if(indexNumber == 1){
            _processStatus =@"1";
        }else{
            _processStatus =@"2";
        }
        [self loadMore];
        
        //        [_tableView reloadData];
    }
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //    return _dataSourceArr.count;
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
    
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
    
    if (0 == _selectedIndex) {
        BlackListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BlackListTableViewCell"];
        cell.selectionStyle               = UITableViewCellSelectionStyleNone;
        cell.Btype =index;

        [cell setlabel:_dataSourceArr[index][@"count"] type:@"0"];
        return cell;
    }else if (1 == _selectedIndex) {
        
        BlackListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BlackListTableViewCell"];
        cell.selectionStyle               = UITableViewCellSelectionStyleNone;
        cell.Btype =index;

        [cell setlabel:_dataSourceArr[index][@"count"] type:@"1"];

        return cell;
    }else{
        BlackListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BlackListTableViewCell"];
        cell.selectionStyle               = UITableViewCellSelectionStyleNone;
        cell.Btype =index;

        [cell setlabel:_dataSourceArr[index][@"count"] type:@"2"];

        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    int index = (int)indexPath.section;
    switch (_selectedIndex) {
        case 0:
        {
            toBlackListViewController *VC = [[toBlackListViewController alloc]init];
            VC.titleStr = [NSString stringWithFormat:@"%@待处理", _dataSourceArr[index][@"category"]];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 1:
        {
            toBlackListViewController *VC = [[toBlackListViewController alloc]init];
            VC.titleStr = [NSString stringWithFormat:@"%@处理中", _dataSourceArr[index][@"category"]];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 2:
        {
            toBlackListViewController *VC = [[toBlackListViewController alloc]init];
            VC.titleStr = [NSString stringWithFormat:@"%@已处理", _dataSourceArr[index][@"category"]];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
            
        default:
            break;
    }
 
    
}



- (NSMutableArray *)dataSourceArr{
    
    if (!_dataSourceArr) {
        _dataSourceArr = [[NSMutableArray alloc]initWithCapacity:0];
    }
    
    return _dataSourceArr;
}


@end
