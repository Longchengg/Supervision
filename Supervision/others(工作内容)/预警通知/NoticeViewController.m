//
//  NoticeViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/8.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "NoticeViewController.h"
#import "NoticeTableViewCell.h"
//#import "FeedBackListTableViewCell.h"

@interface NoticeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic,strong) NSMutableArray *dataSourceArr;

@end

@implementation NoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //    self.view.backgroundColor=[UIColor redColor];
    [self setVCTitle:@"预警通知"];
    self.dataSourceArr = _dataSource;
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.rowHeight =  UITableViewAutomaticDimension;//设置cell的高度为自动计算，只有才xib或者storyboard上自定义的cell才会生效，而且需要设置好约束
    _tableview.estimatedRowHeight = 200;//必须设置好预估值
//    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableview registerNib:[UINib nibWithNibName:@"NoticeTableViewCell" bundle:nil] forCellReuseIdentifier:@"NoticeTableViewCell"];
    
    if (@available(iOS 11.0, *)) {
        self.tableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    
    [self updateUI];
    
}
- (void)updateUI{
    
//    [self.dataSourceArr removeAllObjects];
//    _page = 1;
//
//    [self loadMore];
    WEAK_SELF;
      
          
//          [HttpRequestTool infoSuccessBlock:^(id responObject) {
              
//              NSArray *arr = (NSArray *)responObject;
//              [__weakSelf.dataSourceArr addObjectsFromArray:arr];
//
//              NSIndexSet *setIndex = [NSIndexSet indexSetWithIndex:0];
              //              [__weakSelf.tableview reloadSections:setIndex withRowAnimation:UITableViewRowAnimationNone];
//          } failureBlock:^(id err) {
//
//          }];
}

- (void)loadMore{
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
        return _dataSourceArr.count;
//    return 3;
    
    
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
    //    ChatHomeModelItemVO *dict = [self.messageArr objectAtIndex:indexPath.row];
    //    NSLog(@"%@",dict.senderId);
    //    NSLog(@"%@",[UserTool user].user_id);
    //    NoticeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_id"];
    NoticeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NoticeTableViewCell"];
    cell.selectionStyle          = UITableViewCellSelectionStyleNone;
    cell.labelStr = _dataSourceArr[indexPath.row];
    
    
//    CALayer *layer = [CALayer layer];
//    layer.frame = CGRectMake(67.5, 84.5, SCREEN_WIDTH - 67.5 - 15, 0.5);
//    layer.backgroundColor = LineColor;
//    [cell.layer addSublayer:layer];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //    FeedBackDetailViewController *VC = [[FeedBackDetailViewController alloc]init];
    //
    //    [self.navigationController pushViewController:VC animated:YES];
}


- (NSMutableArray *)dataSourceArr{
    
    if (!_dataSourceArr) {
        _dataSourceArr = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _dataSourceArr;
}

@end
