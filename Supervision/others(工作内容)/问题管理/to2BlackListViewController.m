//
//  to2BlackListViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/9.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "to2BlackListViewController.h"
#import "BWTopMenuView.h"
#import "to2BlackListScrollViewController.h"
#import "to3BlackListScrollViewController.h"
#import "to3BlackListSrcollModel.h"

@interface to2BlackListViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) NSArray *numberArr;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *PersontitleArray;
@property (nonatomic, strong) BWTopMenuView *menuView;
@property (nonatomic, strong) to3BlackListSrcollModel *to3Model;
@property (nonatomic, strong) UIScrollView *farScrollView;

@end

@implementation to2BlackListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setVCTitle:_titleStr];
    [self loadMore];
  
}
- (void)loadMore{
    WEAK_SELF;
           if ([_typeVC  isEqual: @"0"]) {
               [HttpRequestTool companyProb:_processStatus SuccessBlock:^(id responObject) {
                     NSDictionary *arr = (NSDictionary *)responObject;
                     __weakSelf.numberArr = @[arr[@"license"],arr[@"safetyLicense"],arr[@"fourlib"],arr[@"ca"],arr[@"digitalLicense"]];
                       [self createSubViews];
                       [self addChildVC];
                 } failureBlock:^(id err) {
                     [self showAlertMsg:err];
                 }];
           }else{
               [HttpRequestTool personProb:_processStatus SuccessBlock:^(id responObject) {
                   __weakSelf.PersontitleArray = (NSArray *)responObject;
                       [self createSubViews];
                       [self addChildVC];
                 } failureBlock:^(id err) {
                     [self showAlertMsg:err];
                 }];
           }
    
}

- (void)createSubViews
{
    [self.view addSubview:self.menuView];
    [self.view addSubview:self.farScrollView];
}

- (void)addChildVC
{
    for (int i = 0; i < self.titleArray.count; i++) {
        if ([_typeVC  isEqual: @"0"]) {
            to2BlackListScrollViewController *childVC = [[to2BlackListScrollViewController alloc] init];
                   [self addChildViewController:childVC];
                   childVC.titleStr = self.titleArray[i];
                   childVC.processStatus = _processStatus;
                   if (i == 0) {
                       [self.farScrollView addSubview:childVC.view];
                       childVC.view.frame = CGRectMake(i * SCREEN_WIDTH, 0, SCREEN_WIDTH, self.farScrollView.Bw_height);
                   }
        }else{
            to3BlackListScrollViewController *childVC = [[to3BlackListScrollViewController alloc] init];
                   [self addChildViewController:childVC];
            _to3Model = [to3BlackListSrcollModel mj_objectWithKeyValues:_titleArray[i]];
            childVC.certCategoryId =_to3Model.certCategoryId;
                   childVC.processStatus = _processStatus;
                   if (i == 0) {
                       [self.farScrollView addSubview:childVC.view];
                       childVC.view.frame = CGRectMake(i * SCREEN_WIDTH, 0, SCREEN_WIDTH, self.farScrollView.Bw_height);
                   }
            }
    }
}

#pragma mark -
- (void)menuViewTitleClick:(NSInteger)tag
{
    NSString *title = [NSString stringWithFormat:@"%@", self.titleArray[tag]];
    //    self.title = title;
    [self showChildVC:tag];
}


- (void)showChildVC:(NSInteger)index
{
    CGFloat offsetX = index * SCREEN_WIDTH;
    to2BlackListScrollViewController *vc = self.childViewControllers[index];
    //    vc.titleString = self.titleArray[index];
    self.farScrollView.contentOffset = CGPointMake(index * SCREEN_WIDTH, 0);
    if (vc.isViewLoaded) {
        return;
    }
    [self.farScrollView addSubview:vc.view];
    vc.view.frame = CGRectMake(offsetX, 0, SCREEN_WIDTH, self.farScrollView.Bw_height);
}




#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / SCREEN_WIDTH;
    NSString *title = [NSString stringWithFormat:@"%@", self.titleArray[index]];
    //    self.title = title;
    //    titleStr
    [self showChildVC:index];
    [self.menuView setSelectButtonWithTag:index];
}

#pragma mark - lazy loading

- (NSArray *)titleArray
{
    if (!_titleArray) {
        if ([_typeVC  isEqual: @"0"]) {
            _titleArray = @[@"资质证书", @"安全生产许可证", @"四库一平台", @"CA锁", @"数字证书"];
        }else{
            _titleArray = _PersontitleArray;
        }
    }
    return _titleArray;
}

- (BWTopMenuView *)menuView
{
    if (!_menuView) {
        _menuView = [[BWTopMenuView alloc] initWithFrame:CGRectMake(0, Height_NavBar, SCREEN_WIDTH, 50)];
        _menuView.selectColor = MColor;
        _menuView.defaultColor = SubTextColor;
        _menuView.lineColor = MColor;
        if ([_typeVC isEqual:@"0"]) {
            [_menuView setTextArray:self.titleArray NumArray:self.numberArr];
        }else{
            [_menuView setModelArray:self.titleArray];
        }
        __weak typeof(self) weakSelf = self;
        _menuView.titleButtonClick = ^(NSInteger tag, UIButton * _Nonnull button) {
            [weakSelf menuViewTitleClick:tag];
        };
    }
    return _menuView;
}

- (UIScrollView *)farScrollView
{
    if (!_farScrollView) {
        _farScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.menuView.frame), SCREEN_WIDTH, SCREEN_HEIGHT - CGRectGetMaxY(self.menuView.frame))];
        _farScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * self.titleArray.count, 0);
        _farScrollView.pagingEnabled = YES;
        _farScrollView.bounces = NO;
        _farScrollView.showsHorizontalScrollIndicator = YES;
        _farScrollView.delegate = self;
    }
    return _farScrollView;
}

@end
