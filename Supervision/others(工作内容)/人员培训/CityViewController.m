//
//  CityViewController.m
//  Tabel
//
//  Created by 龙成 on 2019/9/27.
//  Copyright © 2019 China. All rights reserved.
//

#import "CityViewController.h"
#import "CityTableViewCell.h"
#import "CityViewModel.h"
#import "toCityViewController.h"
@interface CityViewController () <UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *mainTableView; //主
@property (strong, nonatomic) UITableView *subTableView; //次
@property (strong, nonatomic) NSArray *cityList; //左板块数据
@property (strong, nonatomic) NSArray *idList; //左板块ID
@property (strong, nonatomic) NSArray *rightList; //右板块数据

@property (assign, nonatomic) NSInteger selIndex;//主列表当前选中的行
@property (assign, nonatomic) NSIndexPath *subSelIndex;//子列表当前选中的行
@property (assign, nonatomic) BOOL clickRefresh;//是否是点击主列表刷新子列表,系统刚开始默认为NO
@property (copy, nonatomic) NSString *province; //选中的省
@property (copy, nonatomic) NSString *area; //选中的地区

@property (strong, nonatomic) CityViewModel *cityViewModel; //右板块数据

@property (nonatomic, strong) UIView *nullView;


@end

@implementation CityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setVCTitle:@"人员培训"];
    [self loadMore];
}
- (void)loadMore{
    WEAK_SELF;
    [HttpRequestTool training_board_allSuccessBlock:^(id responObject) {
        NSMutableArray *nameArray = [NSMutableArray array];
        NSMutableArray *idArray = [NSMutableArray array];
        for (NSDictionary *dictValue in (NSMutableArray *)responObject) {
            NSString *nameValue = [dictValue objectForKey:@"board"];
            if (nameValue == nil || [nameValue isKindOfClass:[NSNull class]]) {
                nameValue = @"未知";
            }
            [nameArray addObject:nameValue];
            NSString *idValue = [dictValue objectForKey:@"id"];
            if (idValue == nil || [idValue isKindOfClass:[NSNull class]]) {
                idValue = @"未知";
            }
            [idArray addObject:idValue];
        }
        [nameArray insertObject:@"全部" atIndex:0];
        [idArray insertObject:@"" atIndex:0];
        __weakSelf.cityList = nameArray;
        __weakSelf.idList = idArray;
        [self rightViewLoad:@""];
        [self addTableView];
    } failureBlock:^(id err) {
        
    }];
}

-(void)rightViewLoad:(NSString *)trainingBoardId{
    WEAK_SELF;
    [HttpRequestTool training_list:trainingBoardId SuccessBlock:^(id responObject) {
        __weakSelf.rightList = (NSArray *)responObject;
        [self->_subTableView reloadData];
        
        if (__weakSelf.rightList.count == 0) {
            __weakSelf.subTableView.hidden = YES;
            [__weakSelf.view addSubview:__weakSelf.nullView];
        }else{
            __weakSelf.subTableView.hidden = NO;
            [__weakSelf.nullView removeFromSuperview];
        }
        
    } failureBlock:^(id err) {
            
    }];
}
- (UIView *)nullView{
    
    if (!_nullView) {
        _nullView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 5, Height_NavBar, SCREEN_WIDTH / 5 * 4, SCREEN_HEIGHT - Height_NavBar)];
        //图片的显示是需要载体的；需要放在UIImageView；
        UIImageView *imgView = [[UIImageView alloc]init];
        //图片显示在屏幕上的大小是由载体控制的；
        //现在把载体的大小设置成图片的大小，使用图片的大小设置UIImageView的长宽；
        imgView.frame = CGRectMake(SCREEN_WIDTH*2 / 5 - 65 , SCREEN_HEIGHT/2 - 50 - Height_NavBar, 130, 100);
        [imgView setImage:[UIImage imageNamed:@"empty_license"]];
        
        [_nullView addSubview:imgView];
        
    }
    return _nullView;
}
#pragma mark 创建两个tableView
- (void)addTableView {
    //刚开始，默认选中第一行
    _selIndex = 0;
    _province = _cityList[0]; //赋值
    //一级列表和二级列表
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(5, Height_NavBar, SCREEN_WIDTH / 5, SCREEN_HEIGHT - Height_NavBar) style:UITableViewStylePlain];
    _mainTableView.backgroundColor = RGB(240, 240, 240);
    _mainTableView.dataSource = self;
    _mainTableView.delegate = self;
    _mainTableView.showsVerticalScrollIndicator = NO;
    _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_mainTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone]; //默认省份选中第一行
    [self.view addSubview:_mainTableView];
    
    _subTableView = [[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 5, Height_NavBar, SCREEN_WIDTH / 5 * 4, SCREEN_HEIGHT - Height_NavBar) style:UITableViewStylePlain];
    _subTableView.dataSource = self;
    _subTableView.delegate = self;
    _subTableView.showsVerticalScrollIndicator = NO;
    _subTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_subTableView];
    
    [self.subTableView registerNib:[UINib nibWithNibName:@"CityTableViewCell" bundle:nil] forCellReuseIdentifier:@"CityTableViewCell"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
     if ([tableView isEqual:_mainTableView]) {
         return 50.0f;
       }else {
           return 240.0f;
       }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([tableView isEqual:_mainTableView]) {
        return _cityList.count;
    }else {
        return _rightList.count;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView isEqual:_mainTableView]) {
        static NSString *mainCellId = @"mainTableView";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mainCellId];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mainCellId];
        }
        cell.backgroundColor = RGB(240, 240, 240);
        cell.textLabel.text = _cityList[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:15.0f];;
        UIView *view = [[UIView alloc]initWithFrame:cell.frame];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 5, 50)];
        label.backgroundColor = RGB(23,126,252);
        [view addSubview:label];
        view.backgroundColor = [UIColor whiteColor];
        cell.selectedBackgroundView = view;
        return cell;
    } else {
        CityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityTableViewCell"];
        if (!cell) {
            cell = [[CityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CityTableViewCell"];
        }
        _cityViewModel = [CityViewModel mj_objectWithKeyValues:_rightList[indexPath.row]];
        [cell settrainingName:_cityViewModel.trainingName timeFW:[NSString stringWithFormat:@"%@-%@",_cityViewModel.registerStart,_cityViewModel.registerEnd] trainingTypeDesc:_cityViewModel.trainingTypeDesc trainingPlace:_cityViewModel.trainingPlace trainingFeeOne:_cityViewModel.trainingFeeOne registerStatusDesc:_cityViewModel.registerStatusDesc personNumber:_cityViewModel.personNumber];
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView isEqual:_mainTableView]) {
        _province = _cityList[indexPath.row];
        _selIndex = indexPath.row;
        _clickRefresh = YES;
        [self rightViewLoad:_idList[_selIndex]];
    }else {
        _clickRefresh = NO;
        _subSelIndex = indexPath;
        _cityViewModel = [CityViewModel mj_objectWithKeyValues:_rightList[indexPath.row]];
        toCityViewController *VC = [[toCityViewController alloc]init];
        VC.trainingId = _cityViewModel.ID;
        [self.navigationController pushViewController:VC animated:YES];
    }
}
@end
