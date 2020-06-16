//
//  CertificatemanagementCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/16.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "CertificatemanagementCell.h"
#import "toCertificatemanagementCell.h"
#import "tocertificatemanagementModel.h"
@interface CertificatemanagementCell ()<
UITableViewDelegate,
UITableViewDataSource
>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet UILabel *lab3;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (nonatomic, strong) NSArray *tableArr;
@property (nonatomic, strong) NSString *Pname;
@property (nonatomic, strong) tocertificatemanagementModel *cellModel;



@end
@implementation CertificatemanagementCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerNib:[UINib nibWithNibName:@"toCertificatemanagementCell" bundle:nil] forCellReuseIdentifier:@"toCertificatemanagementCell"];
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        //        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
}
-(void)setCell:(NSString *)personName
      certName:(NSString *)certName
    safetyCert:(NSString *)safetyCert
    backStatus:(NSString *)backStatus
    lockStatus:(NSString *)lockStatus
professionList:(NSArray *)professionList
     cellIndex:(NSInteger)cellIndex{
    _tableArr = professionList;
    if (_tableArr) {
        _lab1.text = [NSString stringWithFormat:@"%@",personName];
        _lab2.text = [NSString stringWithFormat:@"%@",certName];
        if ([[NSString stringWithFormat:@"%@",safetyCert]  isEqual: @"<null>"]) {
            _lab3.text = [NSString stringWithFormat:@"其他证书:无"];
        }else{
            _lab3.text = [NSString stringWithFormat:@"其他证书:%@",safetyCert];
        }
        if ([[NSString stringWithFormat:@"%@",lockStatus] isEqual:@"0"]) {
            [_btn1 setTitle:[NSString stringWithFormat:@"空闲"] forState:UIControlStateNormal];
            _btn1.backgroundColor = RGB(144,201,108);
        }else if ([[NSString stringWithFormat:@"%@",lockStatus] isEqual:@"1"]) {
            [_btn1 setTitle:[NSString stringWithFormat:@"已分配"] forState:UIControlStateNormal];
            _btn1.backgroundColor = RGB(80,169,236);
        }else {
            [_btn1 setTitle:[NSString stringWithFormat:@"锁定中"] forState:UIControlStateNormal];
            _btn1.backgroundColor = [UIColor orangeColor];
        }
        if ([[NSString stringWithFormat:@"%@",backStatus] isEqual:@"0"]) {
            [_btn2 setTitle:[NSString stringWithFormat:@"空闲"] forState:UIControlStateNormal];
            _btn2.backgroundColor = RGB(144,201,108);
        }else if([[NSString stringWithFormat:@"%@",backStatus] isEqual:@"1"]) {
            [_btn2 setTitle:[NSString stringWithFormat:@"预借出"] forState:UIControlStateNormal];
            _btn2.backgroundColor = [UIColor orangeColor];
        }else{
            [_btn2 setTitle:[NSString stringWithFormat:@"借出"] forState:UIControlStateNormal];
            _btn2.backgroundColor = RGB(80,169,236);
        }
        [_tableView reloadData];
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _tableArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 25.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.000f;
    
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
    int index = (int)indexPath.row;
    toCertificatemanagementCell *cell = [tableView dequeueReusableCellWithIdentifier:@"toCertificatemanagementCell"];
    cell.selectionStyle        = UITableViewCellSelectionStyleNone;
    _cellModel = [tocertificatemanagementModel mj_objectWithKeyValues:_tableArr[index]];
    if ([[NSString stringWithFormat:@"%@",_cellModel.professionName]  isEqual: @"<null>"]||[[NSString stringWithFormat:@"%@",_cellModel.professionName]  isEqual: @"(null)"]) {
        _Pname = [NSString stringWithFormat:@"%@",_lab2.text];
    }else{
        _Pname = [NSString stringWithFormat:@"%@(%@)",_lab2.text,_cellModel.professionName];
    }
    [cell setCertifititle:_Pname context:_cellModel.alertStatus];
    return cell;
}


@end
