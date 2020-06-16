//
//  WhereGOViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/15.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "WhereGOViewController.h"
#import "ChuzhiCheckTopTableViewCell.h"
#import "ChuZhiCheckFirstCell.h"
#import "ChuZhiCheckLastCell.h"
#import "ChuZhiCheckSecondCell.h"
#import "WhereGOModel.h"
@interface WhereGOViewController()<
UITableViewDelegate,
UITableViewDataSource
>


@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableviewHight;

@property (nonatomic, strong) NSArray *dataSourceArr;
@property (nonatomic, strong) NSString *applyTime;
@property (nonatomic, strong) WhereGOModel *whereGOModel;


@end

@implementation WhereGOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setVCTitle:@"证书去向"];
    _tableview.delegate = self;
    _tableview.dataSource = self;
//    _tableview.rowHeight =  UITableViewAutomaticDimension;//设置cell的高度为自动计算，只有才xib或者storyboard上自定义的cell才会生效，而且需要设置好约束
//    _tableview.estimatedRowHeight = 200;//必须设置好预估值
//    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    
   [_tableview registerNib:[UINib nibWithNibName:@"ChuzhiCheckTopTableViewCell" bundle:nil] forCellReuseIdentifier:@"ChuzhiCheckTopTableViewCell"];
    [_tableview registerNib:[UINib nibWithNibName:@"ChuZhiCheckFirstCell" bundle:nil] forCellReuseIdentifier:@"ChuZhiCheckFirstCell"];
    [_tableview registerNib:[UINib nibWithNibName:@"ChuZhiCheckSecondCell" bundle:nil] forCellReuseIdentifier:@"ChuZhiCheckSecondCell"];
    [_tableview registerNib:[UINib nibWithNibName:@"ChuZhiCheckLastCell" bundle:nil] forCellReuseIdentifier:@"ChuZhiCheckLastCell"];
    
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
    [HttpRequestTool borrowing_history:_tpye targetId:_targetId SuccessBlock:^(id responObject) {
        __weakSelf.dataSourceArr = (NSArray *)responObject;
        __weakSelf.tableviewHight.constant = 140.0f + __weakSelf.dataSourceArr.count*80.0f;
        [__weakSelf.tableview reloadData];
    } failureBlock:^(id err) {
            
    
    }];
}

- (void)loadMore{
    
  
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataSourceArr.count + 1;
//    return 4;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
//        return _dataSourceArr.count;
    return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        return 140.0f;
    }
    return 80.0f;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{


    return 0.0f;

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
    //    NSInteger index = indexPath.section;
    int section = (int)indexPath.section;
    if (0 == section){
        ChuzhiCheckTopTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ChuzhiCheckTopTableViewCell"];
        cell.selectionStyle         = UITableViewCellSelectionStyleNone;//设置cell点击效果
        [cell setImageV:_tpye];
        return cell;
    }else{
        _whereGOModel = [WhereGOModel mj_objectWithKeyValues:_dataSourceArr[section - 1]];
        if(_dataSourceArr.count == 1){
                ChuZhiCheckFirstCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ChuZhiCheckFirstCell"];
                cell.selectionStyle         = UITableViewCellSelectionStyleNone;//设置cell点击效果
                [cell setCelllab1:_whereGOModel.borrower lab2:_whereGOModel.useRemark lab3:_whereGOModel.certList[0][@"returnStatus"] timeS:_whereGOModel.applyTime isHiddenLine:YES];
                return cell;
        }else if(_dataSourceArr.count ==2){
            if(1 == section){
                ChuZhiCheckFirstCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ChuZhiCheckFirstCell"];
                cell.selectionStyle         = UITableViewCellSelectionStyleNone;//设置cell点击效果
                [cell setCelllab1:_whereGOModel.borrower lab2:_whereGOModel.useRemark lab3:_whereGOModel.certList[0][@"returnStatus"] timeS:_whereGOModel.applyTime isHiddenLine:NO];
                return cell;
            }else{
                ChuZhiCheckLastCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ChuZhiCheckLastCell"];
                cell.selectionStyle        = UITableViewCellSelectionStyleNone;//设置cell点击效果
                [cell setCelllab1:_whereGOModel.borrower lab2:_whereGOModel.useRemark lab3:_whereGOModel.certList[0][@"returnStatus"] timeS:_whereGOModel.applyTime isHiddenLine:NO];
                return cell;
            }
        }else{
            if (1 == section){
                
                ChuZhiCheckFirstCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ChuZhiCheckFirstCell"];
                cell.selectionStyle         = UITableViewCellSelectionStyleNone;//设置cell点击效果
                [cell setCelllab1:_whereGOModel.borrower lab2:_whereGOModel.useRemark lab3:_whereGOModel.certList[0][@"returnStatus"] timeS:_whereGOModel.applyTime isHiddenLine:NO];
                return cell;
                
            }else if (_dataSourceArr.count == section){
                ChuZhiCheckLastCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ChuZhiCheckLastCell"];
                cell.selectionStyle        = UITableViewCellSelectionStyleNone;//设置cell点击效果
                [cell setCelllab1:_whereGOModel.borrower lab2:_whereGOModel.useRemark lab3:_whereGOModel.certList[0][@"returnStatus"] timeS:_whereGOModel.applyTime isHiddenLine:NO];
                return cell;
            }else{
                
                ChuZhiCheckSecondCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ChuZhiCheckSecondCell"];
                cell.selectionStyle          = UITableViewCellSelectionStyleNone;//设置cell点击效果
                [cell setCelllab1:_whereGOModel.borrower lab2:_whereGOModel.useRemark lab3:_whereGOModel.certList[0][@"returnStatus"] timeS:_whereGOModel.applyTime isHiddenLine:NO];
                return cell;
            }
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.section;
}

@end
