//
//  yejiguanliViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/16.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "yejiguanliViewController.h"
#import "yejiguanliTableViewCell.h"
#import "to2BlackListViewController.h"
#import "to4BlackListViewController.h"
#import "BKMenuListView.h"
#import "yejiguanliModel.h"
#import "CGXPickerView.h"
@interface yejiguanliViewController ()<
UITableViewDelegate,
UITableViewDataSource,
yejiguanliTableViewCellDelegate
>
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *JBtn;
@property (weak, nonatomic) IBOutlet UIButton *YBtn;
@property (weak, nonatomic) IBOutlet UIButton *SBtn;
@property (nonatomic, strong) NSMutableArray *dataSourceArr;

//@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) NSArray *JBtnArr;
@property (nonatomic, strong) NSString *projectName;
@property (nonatomic, strong) NSString *buildStatus;
@property (nonatomic, strong) NSString *startYear;
@property (nonatomic, strong) yejiguanliModel *yeModel;
@property (nonatomic, strong) NSMutableArray *ishightArrU;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, strong) UIView *nullView;

@end

@implementation yejiguanliViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setVCTitle:@"业绩管理"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"yejiguanliTableViewCell" bundle:nil] forCellReuseIdentifier:@"yejiguanliTableViewCell"];
    
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
    [self updateUI];
}


-(void)loadData:(BOOL)loadMore{

    if (loadMore) {
        _page ++;
        
    }else{
        _page = 1;
        
    }
    WEAK_SELF;
    [HttpRequestTool client_performance:[NSString stringWithFormat:@"%ld",(long)_page] size:@"10" projectName:_projectName buildStatus:_buildStatus startYear:_startYear SuccessBlock:^(id responObject) {
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
        
        __weakSelf.ishightArrU = [[NSMutableArray alloc]initWithCapacity:0];
        for (int i = 0; i<__weakSelf.dataSourceArr.count; i++) {
            [__weakSelf.ishightArrU addObject:@"NO"];
        }
        [[NSUserDefaults standardUserDefaults]setObject:__weakSelf.ishightArrU forKey:@"ishightArr"];
        [[NSUserDefaults standardUserDefaults]synchronize];
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
        _nullView = [[UIView alloc]initWithFrame:CGRectMake(0, _topView.bottom, SCREEN_WIDTH, SCREEN_HEIGHT-_topView.bottom)];
        //图片的显示是需要载体的；需要放在UIImageView；
        UIImageView *imgView = [[UIImageView alloc]init];
        //图片显示在屏幕上的大小是由载体控制的；
        //现在把载体的大小设置成图片的大小，使用图片的大小设置UIImageView的长宽；
        imgView.frame = CGRectMake(SCREEN_WIDTH/2 - 65 , SCREEN_HEIGHT/2 - 50 -_topView.bottom, 130, 100);
        [imgView setImage:[UIImage imageNamed:@"empty_license"]];
        
        [_nullView addSubview:imgView];

    }
    return _nullView;
}
- (void)updateUI{
     WEAK_SELF;
       [HttpRequestTool bid_type_allSuccessBlock:^(id responObject) {
           NSMutableArray *nameArray = [NSMutableArray array];
           for (NSDictionary *dictValue in (NSMutableArray *)responObject) {
               NSString *nameValue = [dictValue objectForKey:@"name"];
               if (nameValue == nil || [nameValue isKindOfClass:[NSNull class]]) {
                   nameValue = @"未知";
               }
               [nameArray addObject:nameValue];
           }
           __weakSelf.JBtnArr = nameArray;
       } failureBlock:^(id err) {
           [self showAlertMsg:err];
       }];

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataSourceArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     _yeModel = [yejiguanliModel mj_objectWithKeyValues:_dataSourceArr[indexPath.section]];
     _ishightArrU = [[NSUserDefaults standardUserDefaults]objectForKey:@"ishightArr"];
    
        if ([_ishightArrU[indexPath.section] isEqual:@"YES"]) {
            return 135.0f + 25.0f*(_yeModel.smallComPerformancePersonDTOS.count);
        }else{
            return 135.0f;
        }
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
    
    yejiguanliTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"yejiguanliTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    _ishightArrU = [[NSUserDefaults standardUserDefaults]objectForKey:@"ishightArr"];
    _yeModel = [yejiguanliModel mj_objectWithKeyValues:_dataSourceArr[index]];
     [cell setnameT:_yeModel.projectName stateT:_yeModel.buildStatus contT:_yeModel.categoryName moneyT:_yeModel.bidAmount startT:_yeModel.startTime endT:_yeModel.completeTime tagIndex:index ishightArr:_ishightArrU tableArr:_yeModel.smallComPerformancePersonDTOS];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    int index = (int)indexPath.section;
    
}
#pragma mark - cell按钮 delegate
-(void)didClicktagIndex:(NSInteger)Sindex {
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:Sindex]; //你需要更新的组数
    [_tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - 顶部按钮

- (IBAction)JieBtn:(id)sender {
    if (_JBtn.selected == NO) {
        [CGXPickerView showStringPickerWithTitle:@"业绩类型" DataSource:_JBtnArr DefaultSelValue:_JBtnArr[0] IsAutoSelect:NO ResultBlock:^(id selectValue, id selectRow) {
               NSLog(@"%@",selectValue);
            self->_projectName = selectValue;
            [self->_JBtn setTitle:[NSString stringWithFormat:@"%@  ",selectValue]  forState:UIControlStateNormal];
            self->_JBtn.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
            self->_JBtn.selected = YES;
            [self loadData:NO];
           }];
    }else{
        _JBtn.selected = NO;
        _projectName = nil;
        [_JBtn setTitle:@"业绩类型  " forState:UIControlStateNormal];
        _JBtn.backgroundColor = [UIColor whiteColor];
        [self loadData:NO];
    }

}

- (IBAction)yuHuanBtn:(id)sender {
      if (_YBtn.selected == NO) {
          [CGXPickerView showStringPickerWithTitle:@"工程进度" DataSource:@[@"在建", @"已竣工"] DefaultSelValue:@"在建" IsAutoSelect:NO ResultBlock:^(id selectValue, id selectRow) {
              NSLog(@"%@",selectValue);
              if ([selectValue isEqual:@"在建"]) {
                  self->_buildStatus = @"1";
              }else{
                  self->_buildStatus = @"2";
              }
              [self->_YBtn setTitle:[NSString stringWithFormat:@"%@  ",selectValue]  forState:UIControlStateNormal];
              self->_YBtn.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
              self->_YBtn.selected = YES;
              [self loadData:NO];
          }];
      }else{
          _YBtn.selected = NO;
          _buildStatus = nil;
          [_YBtn setTitle:@"工程进度  " forState:UIControlStateNormal];
          _YBtn.backgroundColor = [UIColor whiteColor];
          [self loadData:NO];
      }

}
- (IBAction)shiHuanBtn:(id)sender {
     if (_SBtn.selected == NO) {
         NSString *defaultSelValue = [[CGXPickerView showStringPickerDataSourceStyle:CGXStringPickerViewStyleyear] objectAtIndex:20];
         [CGXPickerView showStringPickerWithTitle:@"开工时间" DefaultSelValue:defaultSelValue IsAutoSelect:NO ResultBlock:^(id selectValue, id selectRow) {
             NSLog(@"%@",selectValue);
             self->_startYear = [selectValue stringByReplacingOccurrencesOfString:@"年" withString:@""];
             [self->_SBtn setTitle:[NSString stringWithFormat:@"%@  ",selectValue] forState:UIControlStateNormal];
             self->_SBtn.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
             self->_SBtn.selected = YES;
             [self loadData:NO];
         } Style:CGXStringPickerViewStyleyear];
     }else{
          _SBtn.selected = NO;
          _startYear = nil;
          [_SBtn setTitle:@"开工时间  " forState:UIControlStateNormal];
          _SBtn.backgroundColor = [UIColor whiteColor];
          [self loadData:NO];
      }
}
- (NSMutableArray *)dataSourceArr{
    if (!_dataSourceArr) {
        _dataSourceArr = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _dataSourceArr;
}


   



@end
