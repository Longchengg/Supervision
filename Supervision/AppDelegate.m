//
//  AppDelegate.m
//  Supervision
//
//  Created by 龙成 on 2020/5/18.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "AppDelegate.h"

#import "TCBaseNavigationController.h"
#import "TCBaseTabBarController.h"

#import "LoginViewController.h"

#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BMKLocationkit/BMKLocationComponent.h>


@interface AppDelegate ()

@property (nonatomic, strong)TCBaseTabBarController *tabBar;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //初始化百度地图
    [self initBMKMap];
    
    if (@available(iOS 11.0, *)) {
        UITableView.appearance.estimatedRowHeight = 0;
        UITableView.appearance.estimatedSectionFooterHeight = 0;
        UITableView.appearance.estimatedSectionHeaderHeight = 0;
    }
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [[UITabBar appearance] setTranslucent:NO];
    [[UITabBar appearance] setTintColor:RGB(226,136,237)];
    
    [CTUserDefaults setToken:@"51BA1940-AB76-48EF-9060-0D9EA83FC9AA"];
    
    [self Login];
    //    [self initControllers];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)initBMKMap{
    
    //    BMKMapManager *mapManager = [[BMKMapManager alloc] init];
    //    // 如果要关注网络及授权验证事件，请设定generalDelegate参数
    //    BOOL ret = [mapManager start:BMKMap_key  generalDelegate:nil];
    //    if (!ret) {
    //        NSLog(@"启动引擎失败");
    //    }
    //
    //    [[BMKLocationAuth sharedInstance] checkPermisionWithKey:BMKMap_key authDelegate:self];
    
   
    
}
- (void)Login{
    
    LoginViewController *VC = [[LoginViewController alloc]init];
    TCBaseNavigationController *baseNav = [[TCBaseNavigationController alloc]initWithRootViewController:VC];
    self.window.rootViewController = baseNav;
}



- (void)loginOut{
    
    [CTUserDefaults setToken:@""];
    [CTUserDefaults setIsLogonSuccess:NO];
    
    [self Login];
}

- (void)loginSuccess:(NSDictionary *)dict{
    
    
    
    [self initControllers];
}


- (void)initControllers{
    
    self.tabBar = [[TCBaseTabBarController alloc]init];
    self.window.rootViewController = self.tabBar;
    
    
}




@end
