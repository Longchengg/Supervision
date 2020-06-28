//
//  StoubiaoViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/19.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "StoubiaoViewController.h"
#import "BWTopMenuView.h"
#import "CertificatemanagementScroVC.h"
#import "CertificatemanagementModel.h"
#import "TtoubiaoViewController.h"

@interface StoubiaoViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *idArray;

@property (nonatomic, strong) BWTopMenuView *menuView;
@property (nonatomic, strong) UIScrollView *farScrollView;

@end

@implementation StoubiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadMore];
  
}
- (void)loadMore{
    WEAK_SELF;
    [HttpRequestTool bid_lock_certSuccessBlock:^(id responObject) {
        __weakSelf.titleArray = (NSArray *)responObject;
        NSMutableArray *nameArray = [NSMutableArray array];
              NSMutableArray *idArray = [NSMutableArray array];
              for (NSDictionary *dictValue in (NSMutableArray *)responObject) {
                  NSString *nameValue = [dictValue objectForKey:@"certName"];
                  if (nameValue == nil || [nameValue isKindOfClass:[NSNull class]]) {
                      nameValue = @"未知";
                  }
                  [nameArray addObject:nameValue];
                  NSString *idValue = [dictValue objectForKey:@"certId"];
                  if (idValue == nil || [idValue isKindOfClass:[NSNull class]]) {
                      idValue = @"未知";
                  }
                  [idArray addObject:idValue];
              }
              __weakSelf.titleArray = nameArray;
              __weakSelf.idArray = idArray;
        
        [self createSubViews];
        [self addChildVC];
    } failureBlock:^(id err) {
//        [self showAlertMsg:err];
    }];
}

- (void)createSubViews
{
    [self.view addSubview:self.menuView];
    [self.view addSubview:self.farScrollView];
}

- (void)addChildVC
{
    for (int i = 0; i < self.titleArray.count; i++) {
        TtoubiaoViewController *childVC = [[TtoubiaoViewController alloc] init];
        childVC.typeVC = _typeVC;
        [self addChildViewController:childVC];
        childVC.lockCertId = _idArray[i];
        if (i == 0) {
            [self.farScrollView addSubview:childVC.view];
            childVC.view.frame = CGRectMake(i * SCREEN_WIDTH, 0, SCREEN_WIDTH, self.farScrollView.Bw_height);
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
    TtoubiaoViewController *vc = self.childViewControllers[index];
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


- (BWTopMenuView *)menuView
{
    if (!_menuView) {
        _menuView = [[BWTopMenuView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
        _menuView.selectColor = MColor;
        _menuView.defaultColor = SubTextColor;
        _menuView.lineColor = MColor;
        [_menuView setTitleArray:_titleArray];
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
