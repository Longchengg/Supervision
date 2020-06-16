//
//  toQualificationsViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/15.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "toQualificationsViewController.h"
#import "toQualificationsTableViewCell.h"
#import "WhereGOViewController.h"
#import "to2QualificationsTableViewCell.h"
#import "to3QualificationsTableViewCell.h"
#import "tocertificatemanagementModel.h"
@interface toQualificationsViewController ()<
UITableViewDelegate,
UITableViewDataSource,
toQualificationsTableViewCellDelegate
>

/// 主页面tableView
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSourceArr;
@property (nonatomic, strong) tocertificatemanagementModel *tocellMode;

@end

@implementation toQualificationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initData];
}

#pragma mark - 初始化一些必要的数据
- (void)initData{
    
    [self setVCTitle:@"资质证书详情"];
    //对tableView进行必要的初始化
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight =  UITableViewAutomaticDimension;//设置cell的高度为自动计算，只有才xib或者storyboard上自定义的cell才会生效，而且需要设置好约束
    _tableView.estimatedRowHeight = 200;//必须设置好预估值
    [_tableView registerNib:[UINib nibWithNibName:@"toQualificationsTableViewCell" bundle:nil] forCellReuseIdentifier:@"toQualificationsTableViewCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"to2QualificationsTableViewCell" bundle:nil] forCellReuseIdentifier:@"to2QualificationsTableViewCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"to3QualificationsTableViewCell" bundle:nil] forCellReuseIdentifier:@"to3QualificationsTableViewCell"];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if ([_typeVC isEqual:@"3"] ||[_typeVC isEqual:@"4"] ) {
               return 2;
       }
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (0 == section) {
        return 1;
    }
    if (2 == section) {
        return 1;
    }
    if ([_typeVC isEqual:@"1"]) {
            return 6;
    }else if ([_typeVC isEqual:@"2"]) {
            return 3;
    }else if([_typeVC isEqual:@"3"]){
            return 6;
    }else{
        return 6 + _toQualificationsModel.professionList.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (0 == indexPath.section) {
        if (_toQualificationsModel.image) {
            return 180;
        }else{
            return 50;
        }
    }
    return _tableView.rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (1 == section) {
        return 10.0f;
    }
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
    
    int section = (int)indexPath.section;
    int row     = (int)indexPath.row;
    if ([_typeVC isEqual:@"1"]) {
        if (0 == section) {
              toQualificationsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"toQualificationsTableViewCell"];
              cell.selectionStyle=UITableViewCellSelectionStyleNone;//设置cell点击效果
              cell.delegate = self;
              [cell setlab1:_toQualificationsModel.alertStatus[@"status"] lab2:@"预警信息" lab3:_toQualificationsModel.backStatus lab4:@"证书去向" lab1S:_toQualificationsModel.alertStatus[@"desc"] imaget:_toQualificationsModel.image];
              return cell;
          }else if(1 == section){
              to2QualificationsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"to2QualificationsTableViewCell"];
              cell.selectionStyle=UITableViewCellSelectionStyleNone;
              if (row == 0) {
                  [cell setLal:@"资质类型" zzRlabe:_toQualificationsModel.licenseCategory];
              }
              if (row == 1) {
                  [cell setLal:@"资质等级" zzRlabe:_toQualificationsModel.level];
              }
              if (row == 2) {
                   [cell setLal:@"发证日期" zzRlabe:_toQualificationsModel.licenseCode];
              }
              if (row == 3) {
                   [cell setLal:@"证书编号" zzRlabe:_toQualificationsModel.signTime];
              }
              if (row == 4) {
                   [cell setLal:@"证书有效期" zzRlabe:_toQualificationsModel.validTime];
              }
              if (row == 5) {
                   [cell setLal:@"发证机关" zzRlabe:_toQualificationsModel.signOrgan];
              }
              
              return cell;
          }else{
              to3QualificationsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"to3QualificationsTableViewCell"];
              cell.selectionStyle=UITableViewCellSelectionStyleNone;//设置cell点击效果
              [cell settitle:@"资质名称" context: _toQualificationsModel.licenseContainNames];
              return cell;
          }
    }else if ([_typeVC isEqual:@"2"]) {
        if (0 == section) {
              toQualificationsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"toQualificationsTableViewCell"];
              cell.selectionStyle=UITableViewCellSelectionStyleNone;//设置cell点击效果
              cell.delegate = self;
              [cell setlab1:_toQualificationsModel.alertStatus[@"status"] lab2:@"预警信息" lab3:_toQualificationsModel.backStatus lab4:@"证书去向" lab1S:_toQualificationsModel.alertStatus[@"desc"] imaget:_toQualificationsModel.image];
              return cell;
          }else if(1 == section){
              to2QualificationsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"to2QualificationsTableViewCell"];
              cell.selectionStyle=UITableViewCellSelectionStyleNone;
              if (row == 0) {
                  [cell setLal:@"证书名称" zzRlabe:@"安全生产许可证"];
              }
              if (row == 1) {
                  [cell setLal:@"证书编号" zzRlabe:_toQualificationsModel.safetyLicenseCode];
              }
              if (row == 2) {
                   [cell setLal:@"到期日期" zzRlabe:_toQualificationsModel.validTime];
              }
              return cell;
          }else{
              to3QualificationsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"to3QualificationsTableViewCell"];
              cell.selectionStyle=UITableViewCellSelectionStyleNone;//设置cell点击效果
              [cell settitle:@"资质范围" context: _toQualificationsModel.scopeDesc];
              return cell;
          }
    }else if([_typeVC isEqual:@"3"]){
        if (0 == section) {
              toQualificationsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"toQualificationsTableViewCell"];
              cell.selectionStyle=UITableViewCellSelectionStyleNone;//设置cell点击效果
              cell.delegate = self;
              [cell setlab1:_toQualificationsModel.alertStatus[@"status"] lab2:@"预警信息" lab3:_toQualificationsModel.backStatus lab4:@"证书去向" lab1S:_toQualificationsModel.alertStatus[@"desc"] imaget:_toQualificationsModel.image];
              return cell;
          }else {
              to2QualificationsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"to2QualificationsTableViewCell"];
              cell.selectionStyle=UITableViewCellSelectionStyleNone;
              
              if (row == 0) {
                  [cell setLal:@"证书名称" zzRlabe:_toQualificationsModel.certificateName];
              }
              if (row == 1) {
                  [cell setLal:@"类型" zzRlabe:_toQualificationsModel.certificateCategory];
              }
              if (row == 2) {
                   [cell setLal:@"颁发机构" zzRlabe:_toQualificationsModel.signOrgan];
              }
              if (row == 3) {
                   [cell setLal:@"使用地区" zzRlabe:_toQualificationsModel.regions];
              }
              if (row == 4) {
                   [cell setLal:@"购买时间" zzRlabe:_toQualificationsModel.buyTime];
              }
              if (row == 5) {
                   [cell setLal:@"到期时间" zzRlabe:_toQualificationsModel.validTime];
              }
              
              return cell;
          }
    }else {
        if (0 == section) {
              toQualificationsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"toQualificationsTableViewCell"];
              cell.selectionStyle=UITableViewCellSelectionStyleNone;//设置cell点击效果
              cell.delegate = self;
              [cell setlab1xxx:_toQualificationsModel.lockStatus lab2:@"锁定状态" lab3:_toQualificationsModel.backStatus lab4:@"证书去向" lab1S:@"" imaget:_toQualificationsModel.image];
              return cell;
          }else {
              to2QualificationsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"to2QualificationsTableViewCell"];
              cell.selectionStyle=UITableViewCellSelectionStyleNone;
              
              //              @property (nonatomic, copy) NSArray *professionList; //  professionName  //alertStatus  //status   desc
              
              if (row == 0) {
                  [cell setLal:@"证书名称" zzRlabe:_toQualificationsModel.certName];
              }
              else if (row == 1) {
                  [cell setLal:@"证书编号" zzRlabe:_toQualificationsModel.certCode];
              }
              else if (row == 2 + _toQualificationsModel.professionList.count) {
                  [cell setLal:@"到期时间" zzRlabe:_toQualificationsModel.certValidTime];
              }
              else if (row == 3 + _toQualificationsModel.professionList.count) {
                  [cell setLal:@"其他证书" zzRlabe:_toQualificationsModel.safetyCert];
              }
              else if (row == 4 + _toQualificationsModel.professionList.count) {
                  [cell setLal:@"社保开始日期" zzRlabe:_toQualificationsModel.socialSecurityStart];
              }
              else if (row == 5 + _toQualificationsModel.professionList.count) {
                  [cell setLal:@"社保结束日期" zzRlabe:_toQualificationsModel.socialSecurityEnd];
              }else{
                  _tocellMode = [tocertificatemanagementModel mj_objectWithKeyValues:_toQualificationsModel.professionList[row - 2]];
                  NSString *Tname;
                  if ([[NSString stringWithFormat:@"%@",_tocellMode.professionName]  isEqual: @"<null>"]||[[NSString stringWithFormat:@"%@",_tocellMode.professionName]  isEqual: @"(null)"]) {
                      Tname = [NSString stringWithFormat:@"%@",_toQualificationsModel.certName];
                  }else{
                      Tname = [NSString stringWithFormat:@"%@(%@)",_toQualificationsModel.certName,_tocellMode.professionName];
                  }
                  [cell setLalz:Tname zzRlabe:_tocellMode.alertStatus];
              }
              
              return cell;
          }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
#pragma mark - delegate
-(void)didClicktoQualifications{
    NSLog(@"历史去向");
    WhereGOViewController *VC = [[WhereGOViewController alloc]init];
    VC.targetId = _toQualificationsModel.ID;
    // 证书类型：1资质证书、2安全许可证、3数字证书、4职员证书
    VC.tpye = _typeVC;
    [self.navigationController pushViewController:VC animated:YES];
    
}

@end
