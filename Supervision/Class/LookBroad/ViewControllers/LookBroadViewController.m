//
//  LookBroadViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/5/18.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "LookBroadViewController.h"
#import "LookBroadTopTableViewCell.h"
#import "LookBroadViewModel.h"
@interface LookBroadViewController ()<
UITableViewDelegate,
UITableViewDataSource
>

/// 主页面tableView
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic, strong) NSMutableArray *alertList;

/// 证书统计元数据
@property (nonatomic, copy) NSDictionary *cert_stasticDict;

@property (nonatomic, strong) LookBroadViewModel *lookBroadViewModel;

@end

@implementation LookBroadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initData];
}

#pragma mark - 初始化一些必要的数据
- (void)initData{
    
    //数据初始化
    //对tableView进行必要的初始化
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"LookBroadTopTableViewCell" bundle:nil] forCellReuseIdentifier:@"LookBroadTopTableViewCell"];
    
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self reloadVideoList];
    
    
}
- (void)reloadVideoList{
    WEAK_SELF;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [HttpRequestTool infoSuccessBlock:^(id responObject) {
            __weakSelf.lookBroadViewModel = [LookBroadViewModel mj_objectWithKeyValues:responObject];
            
//            NSIndexSet *setIndex = [NSIndexSet indexSetWithIndex:0];
//            [__weakSelf.tableView reloadSections:setIndex withRowAnimation:UITableViewRowAnimationNone];
            [self.tableView reloadData];
        } failureBlock:^(id err) {
            
        }];
    });
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (0 == section) {
        return 1;
    }
    return 6;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (0 == indexPath.section) {
        return 330;
    }
    return 55.0f;
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
    
    int section = (int)indexPath.section;
    int row     = (int)indexPath.row;
    
    if (0 == section) {
        LookBroadTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LookBroadTopTableViewCell"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;//设置cell点击效果
        cell.alertCount = _lookBroadViewModel.alertCount;
        cell.expiredCount = _lookBroadViewModel.expiredCount;
        
        return cell;
    }else{
        static NSString *identifier = @"LookBroadCellIdentifier";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
            cell.accessoryType   = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle  = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor whiteColor];
            
            cell.textLabel.textColor = TextColor;
            cell.textLabel.font      = [UIFont systemFontOfSize:14.0f];
            cell.detailTextLabel.textColor = SubTextColor;
            cell.detailTextLabel.font      = [UIFont systemFontOfSize:12.0f];
        }
        
        NSArray *arr = @[@"资质证书",@"备案信息",@"CA锁",@"安全许可证",@"企业人员",@"投标预警"];
        NSArray *arrimg = @[@"个人资料",@"修改密码",@"设置",@"隐私条款",@"意见与反馈",@"意见与反馈"];
        cell.imageView.image = [UIImage imageNamed:arrimg[row]];
        
        cell.textLabel.text  = arr[row];
        
        //        cell.detailTextLabel.text =arrdetail[row];
        if (row == 0) {
            if ( _lookBroadViewModel.bidEnoughAlertMessage == nil) {
                _lookBroadViewModel.bidEnoughAlertMessage = @"暂无";
            }
            cell.detailTextLabel.text = _lookBroadViewModel.bidEnoughAlertMessage;
        }
        if (row == 1) {
            if ( _lookBroadViewModel.fourlib == nil) {
                cell.detailTextLabel.text = @"暂无";
            }
            cell.detailTextLabel.text = [NSString stringWithFormat:@"有效期%@",_lookBroadViewModel.fourlib[@"validTime"]];
        }
        if (row == 2) {
            if ( _lookBroadViewModel.calock == nil) {
                cell.detailTextLabel.text = @"暂无";
            }
            cell.detailTextLabel.text = [NSString stringWithFormat:@"有效期%@",_lookBroadViewModel.calock[@"validTime"]];
        }
        if (row == 3) {
            if ( _lookBroadViewModel.comSafetyLicenseDTO == nil) {
                cell.detailTextLabel.text = @"暂无";
            }
            cell.detailTextLabel.text = [NSString stringWithFormat:@"有效期%@",_lookBroadViewModel.calock[@"validTime"]];
        }
        if (row == 4) {
            if ( _lookBroadViewModel.personCertAlertMessage == nil) {
                _lookBroadViewModel.personCertAlertMessage = @"暂无";
            }
            cell.detailTextLabel.textColor = [UIColor redColor];
//            label.lineBreakMode = NSLineBreakByTruncatingTail;
//            label.numberOfLines = 2;
            cell.detailTextLabel.numberOfLines = 3;
            cell.detailTextLabel.text = _lookBroadViewModel.personCertAlertMessage;
        }
        if (row == 5) {
            if ( _lookBroadViewModel.companyLicenseDTO == nil) {
                cell.detailTextLabel.text = @"暂无";;
            }else{
                cell.detailTextLabel.text = _lookBroadViewModel.companyLicenseDTO[@""];
            }
        }
        
        
        
        
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(65, 54, SCREEN_WIDTH - 80, 1);
        layer.backgroundColor = LineColor;
        
        [cell.layer addSublayer:layer];
        
        return cell;
        
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    switch (indexPath.row) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:{
            
        }
            break;
        case 3:{
        }
            break;
        case 4:{
        }
            break;
        default:
            
            break;
    }
    
}


@end
