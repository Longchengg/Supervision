//
//  CertificateViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/12.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "CertificateViewController.h"
#import "CertificateTableViewCell.h"
#import "to2BlackListViewController.h"
#import "to4BlackListViewController.h"
#import "BKMenuListView.h"
#import "YearMonthPikerView.h"
#import "CertificateModel.h"
@interface CertificateViewController ()<
UITableViewDelegate,
UITableViewDataSource,
YearMonthPikerViewDelegate,
CertificateTableViewCellDelegate
>


@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *JBtn;
@property (weak, nonatomic) IBOutlet UIButton *YBtn;
@property (weak, nonatomic) IBOutlet UIButton *SBtn;

@property (nonatomic,strong) YearMonthPikerView *ymPikerView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, assign) NSInteger selectedIndex;

@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) NSString *applyTime;
@property (nonatomic, strong) NSString *returnTime;
@property (nonatomic, strong) NSString *realReturnTime;
@property (nonatomic, strong) CertificateModel *certificateModel;

@property (nonatomic, assign) NSInteger sectionIndex;
@property (nonatomic, assign) BOOL isHight;
@property (nonatomic, strong) NSMutableArray *ishightArrU;




@end

@implementation CertificateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setVCTitle:@"证书动态"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"CertificateTableViewCell" bundle:nil] forCellReuseIdentifier:@"CertificateTableViewCell"];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self loadMore];
    }];
    
    [self updateUI];
}

- (void)updateUI{
    
    //    [self.dataSourceArr removeAllObjects];
    //    _page = 1;
    
    [self loadMore];
}

- (void)loadMore{
    WEAK_SELF;
    [HttpRequestTool client_cert_borrow:@"1" size:@"50" applyTime:_applyTime returnTime:_returnTime realReturnTime:_realReturnTime SuccessBlock:^(id responObject) {
        __weakSelf.dataSource = (NSArray *)responObject[@"list"];
        __weakSelf.ishightArrU = [[NSMutableArray alloc]initWithCapacity:0];
        for (int i = 0; i<__weakSelf.dataSource.count; i++) {
            [__weakSelf.ishightArrU addObject:@"NO"];
        }
        [[NSUserDefaults standardUserDefaults]setObject:__weakSelf.ishightArrU forKey:@"ishightArr"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        [__weakSelf.tableView reloadData];
        [__weakSelf.tableView.mj_header endRefreshing];
    } failureBlock:^(id err) {
        [self showAlertMsg:err];
        [__weakSelf.tableView.mj_header endRefreshing];
    }];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //    return _dataSourceArr.count;
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    _certificateModel = [CertificateModel mj_objectWithKeyValues:_dataSource[indexPath.section]];
     _ishightArrU = [[NSUserDefaults standardUserDefaults]objectForKey:@"ishightArr"];
    if (_certificateModel.certList.count == 0) {
        return 110.0f;
    }else if(_certificateModel.certList.count <4){
        return 110.0f + 25.0f*(_certificateModel.certList.count);
    }else{
        if ([_ishightArrU[indexPath.section] isEqual:@"YES"]) {
            return 110.0f + 25.0f*(_certificateModel.certList.count);
        }else{
            return 110.0f + 25.0f*3;
        }
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
    
    CertificateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CertificateTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    _ishightArrU = [[NSUserDefaults standardUserDefaults]objectForKey:@"ishightArr"];
    _certificateModel = [CertificateModel mj_objectWithKeyValues:_dataSource[index]];
    [cell setborrower:_certificateModel.borrower borrowerPhone:_certificateModel.borrowerPhone applyTime:_certificateModel.applyTime returnTime:_certificateModel.returnTime useRemark:_certificateModel.useRemark tagIndex:index ishightArr:_ishightArrU tableArr:_certificateModel.certList];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    int index = (int)indexPath.section;
//   [ShareApp.window addSubview:self.bottomView];

}
#pragma mark - cell按钮 delegate
-(void)didClicktagIndex:(NSInteger)Sindex {
    _sectionIndex = Sindex;
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:Sindex]; //你需要更新的组数
    [_tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - 顶部按钮

- (IBAction)JieBtn:(id)sender {
    if (_JBtn.selected == NO) {
        _selectedIndex = 0;
        [ShareApp.window addSubview:self.bottomView];
    }else{
        _JBtn.selected = NO;
        _applyTime = nil;
        [_JBtn setTitle:@"借证时间  " forState:UIControlStateNormal];
        _JBtn.backgroundColor = [UIColor whiteColor];
        [self loadMore];
    }

}

- (IBAction)yuHuanBtn:(id)sender {
      if (_YBtn.selected == NO) {
          _selectedIndex = 1;
          [ShareApp.window addSubview:self.bottomView];
      }else{
          _YBtn.selected = NO;
          _returnTime = nil;
          [_YBtn setTitle:@"预计归还  " forState:UIControlStateNormal];
          _YBtn.backgroundColor = [UIColor whiteColor];
          [self loadMore];
      }

}
- (IBAction)shiHuanBtn:(id)sender {
     if (_SBtn.selected == NO) {
          _selectedIndex = 2;
          [ShareApp.window addSubview:self.bottomView];
      }else{
          _SBtn.selected = NO;
          _realReturnTime = nil;
          [_SBtn setTitle:@"实际归还  " forState:UIControlStateNormal];
          _SBtn.backgroundColor = [UIColor whiteColor];
          [self loadMore];
      }
}

#pragma mark - 底部时间选择器
-(void)selectedDate:(NSString *)YearStr MonthStr:(NSString *)MonthStr{
    //如果月份是单个字节前面补0
    if (MonthStr.length == 1) {
        MonthStr = [NSString stringWithFormat:@"0%@",MonthStr];
    }
    NSString *timeT = [NSString stringWithFormat:@"%@-%@",YearStr,MonthStr];
    if (_selectedIndex == 0) {
        _applyTime = timeT;
        [_JBtn setTitle:[NSString stringWithFormat:@"%@  ",timeT]  forState:UIControlStateNormal];
        _JBtn.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
        _JBtn.selected = YES;
    }else if(_selectedIndex == 1){
        _returnTime = timeT;
        [_YBtn setTitle:[NSString stringWithFormat:@"%@  ",timeT]  forState:UIControlStateNormal];
        _YBtn.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
        _YBtn.selected = YES;
    }else{
        _realReturnTime = timeT;
        [_SBtn setTitle:[NSString stringWithFormat:@"%@  ",timeT] forState:UIControlStateNormal];
        _SBtn.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
        _SBtn.selected = YES;
    }

    [self loadMore];
    [self.bottomView removeFromSuperview];
}

- (void)cancelBtn{
    [self.bottomView removeFromSuperview];
}


- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _bottomView.backgroundColor = RGBA(0, 0, 0, 0.3);
        
        [_bottomView addSubview:self.ymPikerView];
    }
    
    return _bottomView;
}
- (YearMonthPikerView *)ymPikerView{
    
    if (_ymPikerView) {
        return _ymPikerView;
    }
     _ymPikerView = [[[NSBundle mainBundle] loadNibNamed:@"YearMonthPikerView" owner:nil options:nil] objectAtIndex:0];
    _ymPikerView.frame = CGRectMake(0, SCREEN_HEIGHT - 240,SCREEN_WIDTH , 240);
    _ymPikerView.delegate = self;
    return _ymPikerView;
}


@end
