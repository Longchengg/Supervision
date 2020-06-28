//
//  TLTabBarController.m
//  TabBar
//
//  Created by 故乡的云 on 2019/7/18.
//  Copyright © 2019 故乡的云. All rights reserved.
//

#import "TLTabBarController.h"
#import "TLAnimationTabBar.h"
#import "ZhaotoubiaoViewController.h"
#import "twoZhaotoubiaoViewController.h"

@interface TLTabBarController ()

@end

@implementation TLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //第一次进来导航标题
    self.navigationItem.title = @"全部投标项目";
    //左边按钮
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:@"nav_left"] forState:UIControlStateNormal];
    [leftBtn sizeToFit];
    // 让按钮内部的所有内容左对齐
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //设置内边距，让按钮靠近屏幕边缘
    leftBtn.contentEdgeInsets = UIEdgeInsetsMake(0, - 7, 0, 0);
    [leftBtn addTarget:self action:@selector(leftBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];

    
    [self addChildViewController:childViewController(@"全部投标项目", @"ic_bottom_bid", 0)];
    [self addChildViewController:childViewController(@"保证金管理", @"ic_bottom_deposit", 1)];
    [self addChildViewController:childViewController(@"投标人员统计", @"ic_bottom_statistics", 2)];

//    [self addChildViewController:childViewController2(UITabBarSystemItemBookmarks, 2)];
//    [self addChildViewController:childViewController(@"Tools", @"Tools_00028", 4)];
    
    
    self.tabBar.tintColor = RGB(16, 136, 237);
    if (@available(iOS 10.0, *)) {
        self.tabBar.unselectedItemTintColor = RGB(51, 51, 51);
    } else {
        // Fallback on earlier versions
    }
}
- (void)leftBtn:(UIButton *)leftBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

// MARK: - UITabBarItem创建函数
/// 自定义样式UITabBarItem
UIViewController *childViewController (NSString *title, NSString *imgName, NSUInteger tag) {
    if (tag == 0) {
        ZhaotoubiaoViewController *vc = [[ZhaotoubiaoViewController alloc] init];
        vc.typeVC = @"1";
        vc.view.backgroundColor = [UIColor whiteColor];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:imgName] tag:tag];
        setAnimation(vc.tabBarItem, tag);
        return vc;
    }else if(tag == 1){
        ZhaotoubiaoViewController *vc = [[ZhaotoubiaoViewController alloc] init];
        vc.typeVC = @"2";
        vc.view.backgroundColor = [UIColor whiteColor];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:imgName] tag:tag];
        setAnimation(vc.tabBarItem, tag);
        return vc;
    }else{
        twoZhaotoubiaoViewController *vc = [[twoZhaotoubiaoViewController alloc] init];
        vc.view.backgroundColor = [UIColor whiteColor];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:imgName] tag:tag];
        setAnimation(vc.tabBarItem, tag);
        return vc;
    }
}

/// 系统样式UITabBarItem
UIViewController *childViewController2 (UITabBarSystemItem systemItem, NSUInteger tag) {
    ZhaotoubiaoViewController *vc = [[ZhaotoubiaoViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:systemItem tag:tag];
    
    setAnimation(vc.tabBarItem, tag);
    
    return vc;
}

// MARK: - 给UITabBarItem绑定动画
/// 给UITabBarItem绑定动画
void setAnimation(UITabBarItem *item, NSInteger index) {
     item.animation = @[
                       bounceAnimation(), rotationAnimation(), transitionAniamtion(),
                       fumeAnimation(), frameAnimation()
                       ][index];
}


// MARK: - 创建动画函数
TLBounceAnimation *bounceAnimation(){
    TLBounceAnimation *anm = [TLBounceAnimation new];
    anm.isPlayFireworksAnimation = YES;
    return anm;
}

TLRotationAnimation *rotationAnimation(){
    TLRotationAnimation *anm = [TLRotationAnimation new];
    return anm;
}

TLTransitionAniamtion *transitionAniamtion(){
    TLTransitionAniamtion *anm = [TLTransitionAniamtion new];
    anm.direction = 1; // 1~6
    anm.disableDeselectAnimation = NO;
    return anm;
}

TLFumeAnimation *fumeAnimation(){
    TLFumeAnimation *anm = [TLFumeAnimation new];
    return anm;
}

TLFrameAnimation *frameAnimation(){
    TLFrameAnimation *anm = [TLFrameAnimation new];
    anm.images = imgs();
    anm.isPlayFireworksAnimation = YES;
    return anm;
}

NSArray *imgs (){
    NSMutableArray *temp = [NSMutableArray array];
    for (NSInteger i = 28 ; i <= 65; i++) {
        NSString *imgName = [NSString stringWithFormat:@"Tools_000%zi", i];
        CGImageRef img = [UIImage imageNamed:imgName].CGImage;
        [temp addObject:(__bridge id _Nonnull)(img)];
    }
    return temp;
}

// MARK: - UITabBarItemDelegate 监听TabBarItem点击事件
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    // TabBarItem被点击时会被调用
    NSLog(@"%s",__func__);
    self.navigationItem.title = item.title;
}
@end




