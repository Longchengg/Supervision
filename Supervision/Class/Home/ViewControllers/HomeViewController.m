//
//  HomeViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/5/18.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "HomeViewController.h"

#import "HomeTopTableViewCell.h"
#import "HomeQuickTableViewCell.h"
#import "HomeAlertTableViewCell.h"
///
@interface HomeViewController ()
<UITableViewDelegate,
UITableViewDataSource,
HomeTopTableViewCellDelegate,
HomeQuickTableViewCellDelegate>{
    /// 当前选中黑名单按钮
    UIButton *currentBlackListBtn;
}

/// 主页面tableView
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic, strong) NSMutableArray *alertList;
@end

@implementation HomeViewController

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
    [_tableView registerNib:[UINib nibWithNibName:@"HomeTopTableViewCell" bundle:nil] forCellReuseIdentifier:@"HomeTopTableViewCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"HomeQuickTableViewCell" bundle:nil] forCellReuseIdentifier:@"HomeQuickTableViewCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"HomeAlertTableViewCell" bundle:nil] forCellReuseIdentifier:@"HomeAlertTableViewCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"HomeChuZhiTableViewCell" bundle:nil] forCellReuseIdentifier:@"HomeChuZhiTableViewCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"HomeEnterpriseTableViewCell" bundle:nil] forCellReuseIdentifier:@"HomeEnterpriseTableViewCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"HomePersonTableViewCell" bundle:nil] forCellReuseIdentifier:@"HomePersonTableViewCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"HomeCarTableViewCell" bundle:nil] forCellReuseIdentifier:@"HomeCarTableViewCell"];
    
    
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
        
        [HttpRequestTool indexMessageSuccessBlock:^(id responObject) {
            
            NSArray *arr = (NSArray *)responObject;
            [__weakSelf.alertList addObjectsFromArray:arr];
            
            NSIndexSet *setIndex = [NSIndexSet indexSetWithIndex:0];
            
            
            [__weakSelf.tableView reloadSections:setIndex withRowAnimation:UITableViewRowAnimationNone];
        } failureBlock:^(id err) {
            
        }];
    });

    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (0 == section) {
        return 1;
    }else if( 3== section){
        
    }
    return 1;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int section = (int)indexPath.section;
    int row     = (int)indexPath.row;
    
    if (0 == section) {
        if (0 == row) {
            return 330.0f;
        }
    }else if(1 == section){
        
        return 110.0f;
    }else if(2 == section){
        
        return 170.0f;
    }else if( 3== section){
        return 1155.0f;
    }else{
        return 115.0f;
        
    }
    return 115.0f;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (0 == section) {
        return Height_StatusBar;
        
    }else{
        if (1 == section) {
            return 60.0f;
        }
        return 40.0f;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.0001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (0 == section) {
        UIView *view = [[UIView alloc]init];
        
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.colors = @[(__bridge id)RGB(0,90,186).CGColor, (__bridge id)RGB(0,90,186).CGColor, (__bridge id)RGB(0,90,186).CGColor];
        gradientLayer.locations = @[@0.0, @0.5, @1.0];
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1.0, 0);
        gradientLayer.frame = CGRectMake(0, 0, SCREEN_WIDTH, Height_StatusBar);
        [view.layer addSublayer:gradientLayer];
        
        return view;
    }else{
        
        UIView *view = [[UIView alloc]init];
        view.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40.0f);
        
        UILabel *titleLab = [[UILabel alloc]init];
        titleLab.textColor = TextColor;
        titleLab.font = [UIFont boldSystemFontOfSize:18.0f];
        [view addSubview:titleLab];
        
        if (1 == section) {
            titleLab.text = @"信息助手";
            view.frame = CGRectMake(0, 0, SCREEN_WIDTH, 60.0f);
            
            
        }else if (2 == section){
            titleLab.text = @"分类查询工具";
            
        }else if (3 == section){
            titleLab.text = @"建牛独家";
            
        }else if (4 == section){
            titleLab.text = @"资讯甄选";
            
        }else if (5 == section){
            titleLab.text = @"招标公告查询";
            
        }
        titleLab.frame = CGRectMake(15.0f, 11.0f, [NSString widthForString:titleLab.text fontSize:18.0f andHight:18.0f], 18.0f);
        
        if (1 == section) {
            UILabel *tipLab  = [[UILabel alloc]initWithFrame:CGRectMake(titleLab.right + 10.0f, titleLab.top + 7.0f, 100.0f, 10.0f)];
            tipLab.text      = @"两分钟前更新";
            tipLab.textColor = RGB(153, 153, 153);
            tipLab.font      = [UIFont systemFontOfSize:10.0f];
            [view addSubview:tipLab];
            
            NSArray *arr = @[@"日23",@"周128",@"月427"];
            
            UIButton *abtn;
            for (NSString *title in arr) {
                
                float width = [NSString widthForString:title fontSize:12.0f andHight:12.0f] + 20;
                
                UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(15 + abtn.right , titleLab.bottom + 11, width, 12)];
                
                [btn setTitle:title forState:UIControlStateNormal];
                [btn setTitleColor:TextColor forState:UIControlStateNormal];
                [btn.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
                
                [btn setImage:[UIImage imageNamed:@"上升"] forState:UIControlStateNormal];
                
                [UIButton LeftImageToRight:btn];
                abtn = btn;
                
                [view addSubview:btn];
                
            }
            
        }else if (3 == section){
            
            NSArray *arr = @[@"企业",@"人员",@"车辆"];
            
            
            for (int i = 0; i < arr.count; i ++) {
                
                NSString *title = arr[i];
                UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(titleLab.right + 5 + 40*i , titleLab.top + 4, 40, 14)];
                
                [btn setTitle:title forState:UIControlStateNormal];
                [btn setTitleColor:SubTextColor forState:UIControlStateNormal];
                [btn setTitleColor:ButtonColor forState:UIControlStateSelected];
                
                [btn.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
                btn.tag = 1000 + i;
                [btn addTarget:self action:@selector(selectBlackListType:) forControlEvents:UIControlEventTouchUpInside];
                [view addSubview:btn];
                
            }
            
        }
        
        UIButton *moreBtn = [[UIButton alloc]initWithFrame:CGRectMake(view.width - 55.0f, 10.0f, 40.0f, 20.0f)];
        
        [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
        [moreBtn setTitleColor:RGB(110, 124, 153) forState:UIControlStateNormal];
        [moreBtn.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        
        [moreBtn setImage:[UIImage imageNamed:@"更多_gray"] forState:UIControlStateNormal];
        
        [UIButton LeftImageToRight:moreBtn];
        [moreBtn addTarget:self action:@selector(moreBtn:) forControlEvents:UIControlEventTouchUpInside];
        moreBtn.tag = section;
        [view addSubview:moreBtn];
        
        return view;
    }
    
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return [[UIView alloc]init];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int section = (int)indexPath.section;
    int row     = (int)indexPath.row;
    
    if (0 == section) {
        if (0 == row) {
            HomeTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTopTableViewCell"];
            cell.selectionStyle        = UITableViewCellSelectionStyleNone;
            cell.delegate              = self;
            cell.dataSource            = _alertList;
            return cell;
            
        }else{
            HomeQuickTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeQuickTableViewCell"];
            cell.selectionStyle          = UITableViewCellSelectionStyleNone;
            cell.delegate                = self;
            return cell;
        }
    }else if (1 == section){
        
        HomeAlertTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeAlertTableViewCell"];
        cell.selectionStyle          = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if (2 == section){
        
        HomeAlertTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeAlertTableViewCell"];
        cell.selectionStyle          = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if (3 == section){
        
        HomeAlertTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeAlertTableViewCell"];
               cell.selectionStyle          = UITableViewCellSelectionStyleNone;
               return cell;
        
    }else{
        
        HomeAlertTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeAlertTableViewCell"];
        cell.selectionStyle          = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    int section = (int)indexPath.section;
    int row     = (int)indexPath.row;
    
    switch (section) {
        case 0:
        {
            if (0 == row) {
                
            }
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

#pragma mark - HomeTopTableViewCellDelegate
#pragma mark - 查看详情
- (void)didClickDetailsBtn:(UIButton *)button{
    
    NSLog(@"查看详情");
}
#pragma mark - 预警通知
- (void)didClickWorkSpaceBtn:(UIButton *)button{
    NSLog(@"预警通知");
    
}
#pragma mark - 搜索
- (void)didClickSearchBtn:(UIButton *)button{
    
    NSLog(@"搜索");
}

#pragma mark - HomeQuickTableViewCellDelegate
#pragma mark - 监管单位
- (void)didClickTopBtn1:(UIButton *)button {
}

#pragma mark - 监管企业
- (void)didClickTopBtn2:(UIButton *)button {
    
}

#pragma mark - 非企业从业人员
- (void)didClickTopBtn3:(UIButton *)button {
    
}

#pragma mark - 效率统计
- (void)didClickTopBtn4:(UIButton *)button {
    NSLog(@"效率统计");
}

#pragma mark - 交通运输
- (void)didClickBottomBtn1:(UIButton *)button {
    
}

#pragma mark - 质量溯源
- (void)didClickBottomBtn2:(UIButton *)button {
    
    
}

#pragma mark - 场站安全
- (void)didClickBottomBtn3:(UIButton *)button {
    
}

#pragma mark - 项目验收
- (void)didClickBottomBtn4:(UIButton *)button {
    
    
}

#pragma mark - 更多
- (void)moreBtn:(UIButton *)sender{
    
    NSLog(@"%ld",(long)sender.tag);
}

#pragma mark - 查看人员
- (void)checkPersonDetail:(NSInteger )index{
    NSLog(@"%ld",(long)index);
    
}
#pragma mark - 查看车辆
- (void)checkCarDetail:(NSInteger )section row:(NSInteger )row{
    NSLog(@"%ld--%ld",(long)section,(long)row);
    
}

- (NSMutableArray *)alertList{
    
    if (!_alertList) {
        _alertList = [[NSMutableArray alloc]initWithCapacity:0];
    }
    
    return _alertList;
}

@end
