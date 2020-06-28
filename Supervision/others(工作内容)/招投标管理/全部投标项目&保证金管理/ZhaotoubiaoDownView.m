//
//  ZhaotoubiaoDownView.m
//  Supervision
//
//  Created by 龙成 on 2020/6/19.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "ZhaotoubiaoDownView.h"
#import "ZhaotoubiaoDownCell.h"
#import "to2CityViewCell.h"
@interface ZhaotoubiaoDownView ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) ZhaotoubiaoItem *zhaotoubiaoItem;

@end
@implementation ZhaotoubiaoDownView

- (void)awakeFromNib{
  [super awakeFromNib];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.rowHeight =  UITableViewAutomaticDimension;//设置cell的高度为自动计算，只有才xib或者storyboard上自定义的cell才会生效，而且需要设置好约束
    _tableview.estimatedRowHeight = 200;//必须设置好预估值
//    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableview registerNib:[UINib nibWithNibName:@"ZhaotoubiaoDownCell" bundle:nil] forCellReuseIdentifier:@"ZhaotoubiaoDownCell"];
    [_tableview registerNib:[UINib nibWithNibName:@"to2CityViewCell" bundle:nil] forCellReuseIdentifier:@"to2CityViewCell"];

    if (@available(iOS 11.0, *)) {
        self.tableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
//        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
       return _zhaotoubiaoModel.bidPersonDTOList.count;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int section = (int)indexPath.section;
    if (section == 0) {
        return 340.0f;
    }else{
        return 35.0f;
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

- ( UITableViewCell *)tableView:( UITableView *)tableView cellForRowAtIndexPath:( NSIndexPath *)indexPath
{
    NSInteger index = indexPath.section;
    NSInteger indexRow = indexPath.row;
    if (index == 0) {
        ZhaotoubiaoDownCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZhaotoubiaoDownCell"];
        cell.selectionStyle          = UITableViewCellSelectionStyleNone;
        [cell projectName:_zhaotoubiaoModel.projectName bidCategoryName:_zhaotoubiaoModel.bidCategoryName projectPlace:_zhaotoubiaoModel.projectPlace registerStart:_zhaotoubiaoModel.registerStart registerEnd:_zhaotoubiaoModel.registerEnd bidStart:_zhaotoubiaoModel.bidStart bidPlace:_zhaotoubiaoModel.bidPlace operatorName:_zhaotoubiaoModel.operatorName operatorPhone:_zhaotoubiaoModel.operatorPhone bidStatus:_zhaotoubiaoModel.bidStart marginFee:_zhaotoubiaoModel.marginFee marginEnd:_zhaotoubiaoModel.marginEnd marginStatus:_zhaotoubiaoModel.marginStatus];
        return cell;
    }else{
        to2CityViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"to2CityViewCell"];
        cell.selectionStyle          = UITableViewCellSelectionStyleNone;
        _zhaotoubiaoItem = [ZhaotoubiaoItem mj_objectWithKeyValues:_zhaotoubiaoModel.bidPersonDTOList[indexRow]];
        [cell setzhaolab1:_zhaotoubiaoItem.certName lab2:@"" lab3:_zhaotoubiaoItem.personName];
        return cell;
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
