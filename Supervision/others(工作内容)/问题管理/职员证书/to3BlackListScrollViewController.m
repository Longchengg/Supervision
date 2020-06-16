//
//  to3BlackListScrollViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/10.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "to3BlackListScrollViewController.h"
#import "to2BlackListViewController.h"

#import "to2BlackListScrollTableViewCell.h"

@interface to3BlackListScrollViewController ()
<UITableViewDelegate,
UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSourceArr;

@property (nonatomic, strong) NSString *substringT;


@end

@implementation to3BlackListScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    [HttpRequestTool personCert:_processStatus certCategoryId:_certCategoryId page:@"1" size:@"50" SuccessBlock:^(id responObject) {
        NSArray *arr = (NSArray *)responObject[@"list"];
        __weakSelf.dataSourceArr = [[NSMutableArray alloc]initWithArray:arr];
        [self.tableView reloadData];
    } failureBlock:^(id err) {
        [self showAlertMsg:err];
    }];
}



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
//    _substringT =[NSString stringWithFormat:@"%@\n%@",_dataSourceArr[index][@"targetName"],_dataSourceArr[index][@"licenseContainNames"]];
    _substringT =[NSString stringWithFormat:@"%@",_dataSourceArr[index][@"targetName"]];
    if (![[NSString stringWithFormat:@"%@",_dataSourceArr[index][@"remark"]]isEqual:@"<null>"]) {
        _substringT =[NSString stringWithFormat:@"%@\n备注:%@",_substringT,_dataSourceArr[index][@"remark"]];
    }
    [cell setprocessStatus1:_processStatus label1:_dataSourceArr[index][@"certName"] label3:_dataSourceArr[index][@"validTime"] label4:_substringT label5:_dataSourceArr[index][@"forecastEndTime"]];
        
        return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    int index = (int)indexPath.section;
//            to2BlackListViewController *VC = [[to2BlackListViewController alloc]init];
//            VC.titleStr = [NSString stringWithFormat:@"%@待处理", _dataSourceArr[index][@"category"]];
//            [self.navigationController pushViewController:VC animated:YES];
 
    
}

- (NSMutableArray *)dataSourceArr{
    
    if (!_dataSourceArr) {
        _dataSourceArr = [[NSMutableArray alloc]initWithCapacity:0];
    }
    
    return _dataSourceArr;
}

@end
