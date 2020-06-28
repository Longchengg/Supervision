//
//  ZhaotoubiaoViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/18.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "ZhaotoubiaoViewController.h"
#import "ZhaotoubiaoTableViewCell.h"
#import "BKMenuListView.h"
#import "ZhaotoubiaoModel.h"
#import "CGXPickerView.h"
#import "ZhaotoubiaoDownView.h"

@interface ZhaotoubiaoViewController ()<
UITableViewDelegate,
UITableViewDataSource
>
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *JBtn;
@property (weak, nonatomic) IBOutlet UIButton *YBtn;
@property (weak, nonatomic) IBOutlet UIButton *SBtn;
@property (nonatomic, strong) NSMutableArray *dataSourceArr;

@property (nonatomic, strong) NSString *JBtnText;

@property (nonatomic, strong) NSArray *JBtnArr;
@property (nonatomic, strong) NSArray *JBtnidArr;
@property (nonatomic, strong) NSString *categoryId;
@property (nonatomic, strong) NSString *bidStatus;
@property (nonatomic, strong) NSString *openBidYear;
@property (nonatomic, strong) NSString *marginStatus;
@property (nonatomic, strong) ZhaotoubiaoModel *zhaotoubiaoModel;
@property (nonatomic, strong) NSMutableArray *ishightArrU;

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) UIView *nullView;
@property (nonatomic, strong) UIButton *bottomView;
//@property (nonatomic, strong) NSArray *bottomViewArr;
@property (nonatomic,strong) ZhaotoubiaoDownView *ymPikerView;


@end

@implementation ZhaotoubiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    [self setVCTitle:@"业绩管理"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"ZhaotoubiaoTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZhaotoubiaoTableViewCell"];
    
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
    [self btnview];
}
-(void)btnview{
    if ([_typeVC isEqual:@"1"]) {
        _JBtnText = @"招标类型  ";
        [_JBtn setTitle:@"招标类型  " forState:UIControlStateNormal];
        [self updateUI];
    }else{
        _JBtnText = @"保证金状态  ";
        [_JBtn setTitle:@"保证金状态  " forState:UIControlStateNormal];
    }
}
- (void)updateUI{
    WEAK_SELF;
    [HttpRequestTool bid_type_allSuccessBlock:^(id responObject) {
        NSMutableArray *nameArray = [NSMutableArray array];
        NSMutableArray *idArray = [NSMutableArray array];
        for (NSDictionary *dictValue in (NSMutableArray *)responObject) {
            NSString *nameValue = [dictValue objectForKey:@"name"];
            if (nameValue == nil || [nameValue isKindOfClass:[NSNull class]]) {
                nameValue = @"未知";
            }
            [nameArray addObject:nameValue];
            NSString *idValue = [dictValue objectForKey:@"id"];
            if (idValue == nil || [idValue isKindOfClass:[NSNull class]]) {
                idValue = @"未知";
            }
            [idArray addObject:idValue];
        }
        __weakSelf.JBtnArr = nameArray;
        __weakSelf.JBtnidArr = idArray;
    } failureBlock:^(id err) {
        [self showAlertMsg:err];
    }];
    
}

-(void)loadData:(BOOL)loadMore{
    
    if (loadMore) {
        _page ++;
        
    }else{
        _page = 1;
        
    }
    WEAK_SELF;
    [HttpRequestTool bid_query:[NSString stringWithFormat:@"%ld",(long)_page] size:@"10" categoryId:_categoryId bidStatus:_bidStatus openBidYear:_openBidYear marginStatus:_marginStatus  SuccessBlock:^(id responObject) {
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataSourceArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_typeVC isEqual:@"1"]) {
        return 100.0f;
    }else{
        return 120.0f;
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
    ZhaotoubiaoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZhaotoubiaoTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _zhaotoubiaoModel = [ZhaotoubiaoModel mj_objectWithKeyValues:_dataSourceArr[index]];
    if ([_typeVC isEqual:@"1"]) {
        [cell projectName:_zhaotoubiaoModel.projectName bidStatus:_zhaotoubiaoModel.bidStatus bidCategoryName:_zhaotoubiaoModel.bidCategoryName projectPlace:_zhaotoubiaoModel.projectPlace registerStart:_zhaotoubiaoModel.registerStart registerEnd:_zhaotoubiaoModel.registerEnd bidStart:_zhaotoubiaoModel.bidStart];
        
    }else{
        [cell projectName:_zhaotoubiaoModel.projectName marginStatus:_zhaotoubiaoModel.marginStatus marginFee:_zhaotoubiaoModel.marginFee projectPlace:_zhaotoubiaoModel.projectPlace operatorName:_zhaotoubiaoModel.operatorName operatorPhone:_zhaotoubiaoModel.operatorPhone marginEnd:_zhaotoubiaoModel.marginEnd bidStart:_zhaotoubiaoModel.bidStart];
    }
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    int index = (int)indexPath.section;
    _zhaotoubiaoModel = [ZhaotoubiaoModel mj_objectWithKeyValues:_dataSourceArr[index]];
    [self bottomViewClick];
    
}
#pragma mark - cell按钮 delegate
-(void)didClicktagIndex:(NSInteger)Sindex {
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:Sindex]; //你需要更新的组数
    [_tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - 顶部按钮

- (IBAction)JieBtn:(id)sender {
    if (_JBtn.selected == NO) {
        if ([_typeVC isEqual:@"1"]) {
            [CGXPickerView showStringPickerWithTitle:@"招标类型" DataSource:_JBtnArr DefaultSelValue:_JBtnArr[0] IsAutoSelect:NO ResultBlock:^(id selectValue, id selectRow) {
                NSString *rowStr = [NSString stringWithFormat:@"%@",selectRow];
                int row = [rowStr intValue];
                self->_categoryId = [NSString stringWithFormat:@"%@",self->_JBtnidArr[row]];
                [self->_JBtn setTitle:[NSString stringWithFormat:@"%@  ",selectValue]  forState:UIControlStateNormal];
                self->_JBtn.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
                self->_JBtn.selected = YES;
                [self loadData:NO];
            }];
        }else{
            [CGXPickerView showStringPickerWithTitle:@"保证金状态" DataSource:@[@"待交", @"已交",@"待退", @"已退"] DefaultSelValue:@"待交" IsAutoSelect:NO ResultBlock:^(id selectValue, id selectRow) {
                NSLog(@"%@",selectRow);
                self->_marginStatus = selectRow;
                [self->_JBtn setTitle:[NSString stringWithFormat:@"%@  ",selectValue]  forState:UIControlStateNormal];
                self->_JBtn.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
                self->_JBtn.selected = YES;
                [self loadData:NO];
            }];
        }
        
    }else{
        _JBtn.selected = NO;
        if ([_typeVC isEqual:@"1"]) {
            _categoryId = nil;
        }else{
            _marginStatus = nil;
        }
        [_JBtn setTitle:_JBtnText forState:UIControlStateNormal];
        _JBtn.backgroundColor = [UIColor whiteColor];
        [self loadData:NO];
    }
    
}

- (IBAction)yuHuanBtn:(id)sender {
    if (_YBtn.selected == NO) {
        [CGXPickerView showStringPickerWithTitle:@"投标状态" DataSource:@[@"待报名", @"待投标",@"待交保证金", @"待开标",@"已中标", @"未中标"] DefaultSelValue:@"待报名" IsAutoSelect:NO ResultBlock:^(id selectValue, id selectRow) {
            NSLog(@"%@",selectRow);
            self->_bidStatus = selectRow;
            [self->_YBtn setTitle:[NSString stringWithFormat:@"%@  ",selectValue]  forState:UIControlStateNormal];
            self->_YBtn.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
            self->_YBtn.selected = YES;
            [self loadData:NO];
        }];
    }else{
        _YBtn.selected = NO;
        _bidStatus = nil;
        [_YBtn setTitle:@"投标状态  " forState:UIControlStateNormal];
        _YBtn.backgroundColor = [UIColor whiteColor];
        [self loadData:NO];
    }
    
}
- (IBAction)shiHuanBtn:(id)sender {
    if (_SBtn.selected == NO) {
        NSString *defaultSelValue = [[CGXPickerView showStringPickerDataSourceStyle:CGXStringPickerViewStyleyear] objectAtIndex:20];
        [CGXPickerView showStringPickerWithTitle:@"开标时间" DefaultSelValue:defaultSelValue IsAutoSelect:NO ResultBlock:^(id selectValue, id selectRow) {
            NSLog(@"%@",selectValue);
            self->_openBidYear = [selectValue stringByReplacingOccurrencesOfString:@"年" withString:@""];
            [self->_SBtn setTitle:[NSString stringWithFormat:@"%@  ",selectValue] forState:UIControlStateNormal];
            self->_SBtn.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
            self->_SBtn.selected = YES;
            [self loadData:NO];
        } Style:CGXStringPickerViewStyleyear];
    }else{
        _SBtn.selected = NO;
        _openBidYear = nil;
        [_SBtn setTitle:@"开标时间  " forState:UIControlStateNormal];
        _SBtn.backgroundColor = [UIColor whiteColor];
        [self loadData:NO];
    }
}
- (void)bottomViewClick{
    _bottomView = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _bottomView.backgroundColor = RGBA(0, 0, 0, 0.3);
    [_bottomView addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    _ymPikerView = [[[NSBundle mainBundle] loadNibNamed:@"ZhaotoubiaoDownView" owner:nil options:nil] objectAtIndex:0];
    _ymPikerView.zhaotoubiaoModel = _zhaotoubiaoModel;
    _ymPikerView.frame = CGRectMake(0, SCREEN_HEIGHT - 380,SCREEN_WIDTH , 380);
    [_bottomView addSubview:self.ymPikerView];
    [ShareApp.window addSubview:self.bottomView];
}

-(void)back{
    [self.bottomView removeFromSuperview];
}

- (NSMutableArray *)dataSourceArr{
    if (!_dataSourceArr) {
        _dataSourceArr = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _dataSourceArr;
}



@end
