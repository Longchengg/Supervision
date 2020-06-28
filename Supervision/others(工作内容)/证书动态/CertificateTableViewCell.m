//
//  CertificateTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/12.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "CertificateTableViewCell.h"
#import "CertificateModel.h"
#import "CertificateViewCell.h"
@interface CertificateTableViewCell ()<
UITableViewDelegate,
UITableViewDataSource
>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *nameT;
@property (weak, nonatomic) IBOutlet UILabel *phoneT;
@property (weak, nonatomic) IBOutlet UILabel *returnT;
@property (weak, nonatomic) IBOutlet UILabel *treturnT;
@property (weak, nonatomic) IBOutlet UILabel *conT;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@property (nonatomic, strong) NSArray *tableArr;
@property (nonatomic, strong) NSMutableArray *isHightArrU;

//@property (nonatomic, strong) CertificateModel *certificateModel;
@property (nonatomic, strong) CertificateItem *certificateItem;


@end
@implementation CertificateTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
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
-(void)setborrower:(NSString *)borrower borrowerPhone:(NSString *)borrowerPhone applyTime:(NSString *)applyTime returnTime:(NSString *)returnTime useRemark:(NSString *)useRemark tagIndex:(NSInteger )tagIndex ishightArr:(NSMutableArray *)ishightArr tableArr:(NSArray *)tableArr{
    _tableArr = tableArr;
    _isHightArrU = [[NSUserDefaults standardUserDefaults]objectForKey:@"ishightArr"];
    
    if (_tableArr) {
        if ([[NSString stringWithFormat:@"%@",useRemark]  isEqual: @"<null>"]||[[NSString stringWithFormat:@"%@",useRemark]  isEqual: @"(null)"]) {
            useRemark = [NSString stringWithFormat:@"-"];
        }
        _nameT.text = [NSString stringWithFormat:@"借证人 %@",borrower];
        _phoneT.text = [NSString stringWithFormat:@"电话:%@",borrowerPhone];
        _returnT.text = [NSString stringWithFormat:@"借证时间:%@",applyTime];
        _treturnT.text = [NSString stringWithFormat:@"预计归还:%@",returnTime];
        _conT.text = [NSString stringWithFormat:@"用途:%@",useRemark];
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
        _certificateItem.isHight = YES;
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
        _certificateItem.isHight = NO;
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
    //    return 1;
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
    _certificateItem = [CertificateItem mj_objectWithKeyValues:_tableArr[index]];
    CertificateViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CertificateViewCell"];
    cell.selectionStyle        = UITableViewCellSelectionStyleNone;
    [cell setLal:_certificateItem.displayCertName Rlabe:_certificateItem.returnStatus];
    return cell;
}


//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
////    _btn.selected = _btn.selected;
////    NSLog(@"%ld",(long)_btn.tag);
//
//}

@end
