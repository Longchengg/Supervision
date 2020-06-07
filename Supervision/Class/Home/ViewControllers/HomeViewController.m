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
#import "HomeFindToolCell.h"
#import "HomeManagerCell.h"
#import "HomeInformationSelectionCell.h"

#import "HomeRedPointModel.h"

@interface HomeViewController ()
<UITableViewDelegate,
UITableViewDataSource,
HomeTopTableViewCellDelegate,
HomeQuickTableViewCellDelegate>{
    
}

/// 主页面tableView
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic, strong) NSMutableArray *alertList;


/// 证书统计元数据
@property (nonatomic, copy) NSDictionary *cert_stasticDict;

@property (nonatomic, strong) HomeRedPointModel *redPointModel;

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
    [_tableView registerNib:[UINib nibWithNibName:@"HomeFindToolCell" bundle:nil] forCellReuseIdentifier:@"HomeFindToolCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"HomeManagerCell" bundle:nil] forCellReuseIdentifier:@"HomeManagerCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"HomeInformationSelectionCell" bundle:nil] forCellReuseIdentifier:@"HomeInformationSelectionCell"];


    
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
            
            __weakSelf.redPointModel = [HomeRedPointModel mj_objectWithKeyValues:responObject];
            
            
        } failureBlock:^(id err) {
            
        }];
    });
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int section = (int)indexPath.section;
    int row     = (int)indexPath.row;
    
    if (0 == section) {
        return 330.0f;

    }else if(1 == section){
        return 115.0f;

    }else if(2 == section){
        return 120.0f;

    }else if(3 == section){
        return 350.0f;

    }else{
        
        return 140.0f;
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int section = (int)indexPath.section;
    int row     = (int)indexPath.row;
    
    
    if (0 == section) {
        HomeTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTopTableViewCell"];
        cell.selectionStyle        = UITableViewCellSelectionStyleNone;
        cell.delegate              = self;
        cell.dataSource            = _alertList;
        return cell;
        
    }else if (1 == section){
        HomeQuickTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeQuickTableViewCell"];
        cell.selectionStyle          = UITableViewCellSelectionStyleNone;
        cell.delegate                = self;
        cell.dict                    = _cert_stasticDict;
        return cell;
    }else if (2 == section){
        HomeFindToolCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeFindToolCell"];
        cell.selectionStyle    = UITableViewCellSelectionStyleNone;
        
        return cell;
        
    }else if (3 == section){
        HomeManagerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeManagerCell"];
        cell.selectionStyle   = UITableViewCellSelectionStyleNone;
        
        return cell;

    }else{
        HomeInformationSelectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeInformationSelectionCell"];
        cell.selectionStyle   = UITableViewCellSelectionStyleNone;
        
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
- (void)didClickQuickBtn:(NSInteger)index{
    
    NSLog(@"查看详情 -- %ld",index);
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
