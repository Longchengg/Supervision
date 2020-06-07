//
//  TCBaseTabBarController.m
//  Supervision
//
//  Created by 龙成 on 2019/10/23.
//  Copyright © 2019 ThinkingCollision. All rights reserved.
//

#import "TCBaseTabBarController.h"
#import "TCBaseNavigationController.h"
#import "CSTabBar.h"

@interface TCBaseTabBarController ()<UITabBarControllerDelegate>

@end

@implementation TCBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    [self initUI];
    [self initCenterT];
}
#pragma mark -中间tabbar 凸起
-(void)initCenterT{
    _csTabbar = [[CSTabBar alloc] init];
    [_csTabbar.centerBtn addTarget:self action:@selector(centerBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    //利用KVC 将自己的tabbar赋给系统tabBar
    [self setValue:_csTabbar forKeyPath:@"tabBar"];
    self.csTabbar.tintColor = RGB(51, 51, 51);
    //透明设置为NO，显示白色，view的高度到tabbar顶部截止，YES的话到底部
    self.csTabbar.translucent = NO;
    self.csTabbar.position              = CSTabBarCenterButtonPositionBulge;
    self.csTabbar.centerImage           = [UIImage imageNamed:@"tabbar_add_yellow"];
    self.csTabbar.centerSelectedImage   = [UIImage imageNamed:@"tabbar_add_yellow"];
}
// 重写选中事件， 处理中间按钮选中问题
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    _csTabbar.centerBtn.selected = (tabBarController.selectedIndex == 1);
}


- (void)centerBtnAction:(UIButton *)button {
    //    NSInteger count = self.viewControllers.count;
    self.selectedIndex = 1;//关联中间按钮
    [self tabBarController:self didSelectViewController:self.viewControllers[self.selectedIndex]];
}

-(void)initUI{
    
    
    
    NSArray *titleArr = @[@"首页",@"看板",@"我的"];
    
    NSArray *iconArr = @[@"首页",@"",@"我的"];
    NSArray *selectIconArr = @[@"首页-选中",@"",@"我的-选中"];
    
    NSArray *controllerArr = @[@"HomeViewController",@"LookBroadViewController",@"MineViewController"];
    
    for(NSInteger i = 0;i < controllerArr.count;i++)
    {
        
        UIViewController *viewController = [[NSClassFromString(controllerArr[i]) alloc]init];
        
        UIImage *barItemImage           = [UIImage imageNamed:iconArr[i]];
        barItemImage                    = [barItemImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *selectedBarItemImage   = [UIImage imageNamed:selectIconArr[i]];
        selectedBarItemImage            = [selectedBarItemImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UITabBarItem *barItem           = [[UITabBarItem alloc] init];
        barItem.title                   = titleArr[i];
        barItem.image                   = barItemImage;
        barItem.selectedImage           = selectedBarItemImage;
        barItem.tag                     = i;
        //barItem字体大小
        NSDictionary *selectDict        = @{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:12],NSForegroundColorAttributeName:RGB(16, 136, 237)};
        NSDictionary *normalDict        = @{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:12],NSForegroundColorAttributeName:RGB(51, 51, 51)};
        //未选中字体颜色
        [barItem setTitleTextAttributes:normalDict forState:UIControlStateNormal];
        //选中字体颜色
        [barItem setTitleTextAttributes:selectDict forState:UIControlStateSelected];
        
        TCBaseNavigationController *nav = [[TCBaseNavigationController alloc]initWithRootViewController:viewController];
        nav.tabBarItem        = barItem;

        [self addChildViewController:nav];

    }
    
    
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
