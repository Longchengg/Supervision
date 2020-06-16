//
//  MessageViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/14.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageTableViewCell.h"
//#import "FeedBackListTableViewCell.h"

@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic,strong) NSArray *dataSourceArr;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setVCTitle:@"消息"];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.rowHeight =  UITableViewAutomaticDimension;//设置cell的高度为自动计算，只有才xib或者storyboard上自定义的cell才会生效，而且需要设置好约束
    _tableview.estimatedRowHeight = 200;//必须设置好预估值
//    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableview registerNib:[UINib nibWithNibName:@"MessageTableViewCell" bundle:nil] forCellReuseIdentifier:@"MessageTableViewCell"];
    
    if (@available(iOS 11.0, *)) {
        self.tableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    _tableview.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self loadMore];
    }];
    
    [self updateUI];
    
}
- (void)updateUI{
    
//    [self.dataSourceArr removeAllObjects];
//    _page = 1;
//
//    [self loadMore];
    WEAK_SELF;
    [HttpRequestTool notice_message:@"1" size:@"50" SuccessBlock:^(id responObject) {
        __weakSelf.dataSourceArr = (NSArray *)responObject[@"list"];
        
        [__weakSelf.tableview reloadData];
    } failureBlock:^(id err) {
        
    }];
              
}

- (void)loadMore{
    
  
    
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
//    return 85.0f;
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

- ( UITableViewCell *)tableView:( UITableView *)tableView cellForRowAtIndexPath:( NSIndexPath *)indexPath
{
    NSInteger index = indexPath.row;
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageTableViewCell"];
    cell.selectionStyle          = UITableViewCellSelectionStyleNone;
    [cell settimeL:_dataSourceArr[index][@"time"] contL:_dataSourceArr[index][@"content"]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (NSArray *)dataSourceArr{
    
    if (!_dataSourceArr) {
        _dataSourceArr = [[NSArray alloc]init];
    }
    return _dataSourceArr;
}

@end
