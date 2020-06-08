//
//  LookBroadViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/5/18.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "LookBroadViewController.h"
#import "LookBroadTopTableViewCell.h"

@interface LookBroadViewController ()<
UITableViewDelegate,
UITableViewDataSource
>

/// 主页面tableView
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic, strong) NSMutableArray *alertList;

/// 证书统计元数据
@property (nonatomic, copy) NSDictionary *cert_stasticDict;


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
    //    [self reloadVideoList];
    
    
}
- (void)reloadVideoList{
    WEAK_SELF;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [HttpRequestTool indexMessageSuccessBlock:^(id responObject) {
            
            NSArray *arr = (NSArray *)responObject;
            [__weakSelf.alertList addObjectsFromArray:arr];
            
            NSIndexSet *setIndex = [NSIndexSet indexSetWithIndex:0];
            
            
            [__weakSelf.tableView reloadSections:setIndex withRowAnimation:UITableViewRowAnimationNone];
        } failureBlock:^(id err) {
            
        }];
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [HttpRequestTool cert_stasticSuccessBlock:^(id responObject) {
            
            __weakSelf.cert_stasticDict = (NSDictionary *)responObject;
            
            
            NSIndexSet *setIndex = [NSIndexSet indexSetWithIndex:0];
            
            
            [__weakSelf.tableView reloadSections:setIndex withRowAnimation:UITableViewRowAnimationNone];
            
        } failureBlock:^(id err) {
            
        }];
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [HttpRequestTool redPointSuccessBlock:^(id responObject) {
            
            //            __weakSelf.redPointModel = [HomeRedPointModel mj_objectWithKeyValues:responObject];
            
            
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
    if (0 == section) {
//        UIView *view = [[UIView alloc]init];
//        
//        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//        gradientLayer.colors = @[(__bridge id)RGB(0,90,186).CGColor, (__bridge id)RGB(0,90,186).CGColor, (__bridge id)RGB(0,90,186).CGColor];
//        gradientLayer.locations = @[@0.0, @0.5, @1.0];
//        gradientLayer.startPoint = CGPointMake(0, 0);
//        gradientLayer.endPoint = CGPointMake(1.0, 0);
//        gradientLayer.frame = CGRectMake(0, 0, SCREEN_WIDTH, Height_StatusBar);
//        [view.layer addSublayer:gradientLayer];
//        
//        return view;
        return [[UIView alloc]init];

    }else{
        return [[UIView alloc]init];
        
    }
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
            cell.detailTextLabel.font      = [UIFont systemFontOfSize:14.0f];
        }
        
        NSArray *arr = @[@"资质证书",@"备案信息",@"CA锁",@"安全许可证",@"企业人员",@"投标预警"];
        NSArray *arrdetail = @[@"资质证书",@"备案信息",@"CA锁",@"安全许可证",@"企业人员",@"投标预警"];
        NSArray *arrimg = @[@"个人资料",@"修改密码",@"设置",@"隐私条款",@"意见与反馈",@"意见与反馈"];
        cell.imageView.image = [UIImage imageNamed:arrimg[row]];
        
        cell.textLabel.text  = arr[row];
        
        cell.detailTextLabel.text =arrdetail[row];
        
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
