//
//  twoZhaotoubiaoViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/18.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "twoZhaotoubiaoViewController.h"
#import "BKMenuListView.h"
#import "StoubiaoViewController.h"
#import "FtoubiaoViewController.h"

@interface twoZhaotoubiaoViewController ()
<
UITextFieldDelegate,
BKMenuListViewDelegate,UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *topView;

@property (nonatomic, assign) NSInteger selectedIndex;

@property (nonatomic, strong) BKMenuListView *menuListView;

@property (nonatomic, strong) UIScrollView *farScrollView;

@end

@implementation twoZhaotoubiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self updateUI];
    [self loadSubViews];
}

- (void)updateUI{
    
    [self loadMore];
}

- (void)loadMore{
    [self createSubViews];
    [self addChildVC];
}
- (void)loadSubViews{
    [_topView addSubview:self.menuListView];
    
}

- (BKMenuListView *)menuListView{
    if (!_menuListView) {
        
        NSArray *arr = @[@"投标统计",@"已锁定人员",@"可使用人员"];
        
        _menuListView = [[BKMenuListView alloc] initWithListViewType:BKMenuListViewTypeDefault dataSourceArray:arr frame:CGRectMake(0, 0, SCREEN_WIDTH, 50) delegate:self];
        [_menuListView setValueBottomViewIsShow:NO];
        [_menuListView setListButtonWithFontSize:16.0f height:50 selectTitleColor:MColor normalTitleColor:SubTextColor];
        [_menuListView setListButtonWithSpacing:10.0f];
        [_menuListView setSliderViewBottom:5];
        [_menuListView setSliderViewHeight:2 color:MColor widthValue:0.3 andIsYuanJiao:YES];
        [_menuListView loadUI];
        [_menuListView setNormalSelectIndex:_selectedIndex];
    }
    
    return _menuListView;
}

#pragma mark -  MenuListViewDelegate
/**
 当前选择的下标
 
 @param indexNumber 下标
 */
- (void)menuListView:(BKMenuListView *)menuListView selectButtonCallbackIndex:(NSInteger)indexNumber {
    if (indexNumber < 0) {
        indexNumber = 0;
    }
    if (indexNumber != _selectedIndex) {
        _selectedIndex = indexNumber;
        //这个地方 处理跳转
        if (indexNumber == 0) {
            [self showChildVC:indexNumber];
        }else if(indexNumber == 1){
            [self showChildVC:indexNumber];
        }else{
            [self showChildVC:indexNumber];
        }
    }
}


- (void)createSubViews
{
    [self.view addSubview:self.farScrollView];
}

- (void)addChildVC
{
    FtoubiaoViewController *childVC0 = [[FtoubiaoViewController alloc] init];
    [self addChildViewController:childVC0];
    [self.farScrollView addSubview:childVC0.view];
    childVC0.view.frame = CGRectMake(0 * SCREEN_WIDTH, 0, SCREEN_WIDTH, self.farScrollView.self.frame.size.height);
    
    StoubiaoViewController *childVC1 = [[StoubiaoViewController alloc] init];
    childVC1.typeVC = @"1";
    [self addChildViewController:childVC1];
    [self.farScrollView addSubview:childVC1.view];
    childVC1.view.frame = CGRectMake(1 * SCREEN_WIDTH, 0, SCREEN_WIDTH, self.farScrollView.self.frame.size.height);

    StoubiaoViewController *childVC2 = [[StoubiaoViewController alloc] init];
    childVC2.typeVC = @"2";
    [self addChildViewController:childVC2];
    [self.farScrollView addSubview:childVC2.view];
    childVC2.view.frame = CGRectMake(2 * SCREEN_WIDTH, 0, SCREEN_WIDTH, self.farScrollView.self.frame.size.height);
    
}

#pragma mark -

- (void)showChildVC:(NSInteger)index
{
    CGFloat offsetX = index * SCREEN_WIDTH;
    if (index == 0) {
        FtoubiaoViewController *vc = self.childViewControllers[index];
        self.farScrollView.contentOffset = CGPointMake(index * SCREEN_WIDTH, 0);
        if (vc.isViewLoaded) {
            return;
        }
        [self.farScrollView addSubview:vc.view];
        vc.view.frame = CGRectMake(offsetX, 0, SCREEN_WIDTH, self.farScrollView.self.frame.size.height);
    }else{
        StoubiaoViewController *vc = self.childViewControllers[index];
        self.farScrollView.contentOffset = CGPointMake(index * SCREEN_WIDTH, 0);
        if (vc.isViewLoaded) {
            return;
        }
        [self.farScrollView addSubview:vc.view];
        vc.view.frame = CGRectMake(offsetX, 0, SCREEN_WIDTH, self.farScrollView.self.frame.size.height);
    }
    
}

#pragma mark - lazy loading

- (UIScrollView *)farScrollView
{
    if (!_farScrollView) {
        _farScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, Height_NavBar+50, SCREEN_WIDTH, SCREEN_HEIGHT - CGRectGetMaxY(self.menuListView.frame))];
        _farScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 3, 0);
        _farScrollView.pagingEnabled = YES;
        _farScrollView.bounces = NO;
        _farScrollView.showsHorizontalScrollIndicator = YES;
        _farScrollView.delegate = self;
    }
    return _farScrollView;
}
@end
