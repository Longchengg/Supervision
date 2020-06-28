//
//  yejiguanliTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/16.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "yejiguanliTableViewCell.h"
#import "yejiguanliModel.h"
#import "CertificateViewCell.h"

@interface yejiguanliTableViewCell()<
UITableViewDelegate,
UITableViewDataSource
>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *nameT;
@property (weak, nonatomic) IBOutlet UILabel *stateT;
@property (weak, nonatomic) IBOutlet UILabel *contT;
@property (weak, nonatomic) IBOutlet UILabel *moneyT;
@property (weak, nonatomic) IBOutlet UILabel *startT;
@property (weak, nonatomic) IBOutlet UILabel *endT;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@property (nonatomic, strong) NSArray *tableArr;
@property (nonatomic, strong) NSMutableArray *isHightArrU;
@property (nonatomic, strong) yejiguanliItem *yejiguanliItem;


@end
@implementation yejiguanliTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    [_tableView registerNib:[UINib nibWithNibName:@"CertificateViewCell" bundle:nil] forCellReuseIdentifier:@"CertificateViewCell"];
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
//        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

-(void)setnameT:(NSString *)nameT
         stateT:(NSString *)stateT
          contT:(NSString *)contT
         moneyT:(NSString *)moneyT
         startT:(NSString *)startT
           endT:(NSString *)endT
       tagIndex:(NSInteger)tagIndex
     ishightArr:(NSMutableArray *)ishightArr
       tableArr:(NSArray *)tableArr{
        _tableArr = tableArr;
        _isHightArrU = [[NSUserDefaults standardUserDefaults]objectForKey:@"ishightArr"];
        if (_tableArr) {
            if (nameT == nil) {
                nameT =@"-";
            }
            if (contT == nil) {
                contT =@"-";
            }
            if (moneyT == nil) {
                moneyT =@"-";
            }
            if (startT == nil) {
                startT =@"-";
            }
            if (endT == nil) {
                endT =@"-";
            }
            _nameT.text = [NSString stringWithFormat:@"%@",nameT];
            if ([stateT isEqual:@"1"]) {
                _stateT.text = [NSString stringWithFormat:@"在建"];
                _stateT.textColor = [UIColor orangeColor];
            }else{
                _stateT.text = [NSString stringWithFormat:@"已竣工"];
                _stateT.textColor = RGB(144,201,108);
            }
            _contT.text = [NSString stringWithFormat:@"%@",contT];
            _moneyT.text = [NSString stringWithFormat:@"中标金额:%@",moneyT];
            _startT.text = [NSString stringWithFormat:@"开工时间:%@",startT];
            _endT.text = [NSString stringWithFormat:@"开工时间:%@",endT];
            _btn.tag = tagIndex;
            if ([_isHightArrU[tagIndex] isEqual:@"YES"]) {
                _btn.selected = YES;
            }else{
                _btn.selected = NO;
            }
            [_tableView reloadData];
        }
}


- (IBAction)didBtnClick:(UIButton *)sender {
    if (_btn.selected == NO) {
        _btn.selected =YES;
        _isHightArrU = [[NSUserDefaults standardUserDefaults]objectForKey:@"ishightArr"];

        NSMutableArray *newArray = [_isHightArrU mutableCopy];
        [newArray replaceObjectAtIndex:sender.tag withObject:@"YES"];
        _isHightArrU = newArray;
        [[NSUserDefaults standardUserDefaults]setObject:_isHightArrU forKey:@"ishightArr"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        if ([_delegate respondsToSelector:@selector(didClicktagIndex:)]) {
            [_delegate didClicktagIndex:sender.tag];
        }
    }else{
        _btn.selected =NO;
           _isHightArrU = [[NSUserDefaults standardUserDefaults]objectForKey:@"ishightArr"];
          NSMutableArray *newArray = [_isHightArrU mutableCopy];
          [newArray replaceObjectAtIndex:sender.tag withObject:@"NO"];
          _isHightArrU = newArray;
          [[NSUserDefaults standardUserDefaults]setObject:_isHightArrU forKey:@"ishightArr"];
          [[NSUserDefaults standardUserDefaults]synchronize];
        if ([_delegate respondsToSelector:@selector(didClicktagIndex:)]) {
            [_delegate didClicktagIndex:sender.tag];
        }
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
    
    int index = (int)indexPath.row;
   _yejiguanliItem = [yejiguanliItem mj_objectWithKeyValues:_tableArr[index]];
    CertificateViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CertificateViewCell"];
    cell.selectionStyle        = UITableViewCellSelectionStyleNone;
    [cell seyejitLal:_yejiguanliItem.certName Rlabe:_yejiguanliItem.personName];
    return cell;
}


@end
