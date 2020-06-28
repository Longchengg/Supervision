//
//  AppDelegate.m
//  Supervision
//
//  Created by 龙成 on 2020/5/18.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "AppDelegate.h"

// 引入 JPush 功能所需头文件
#import "JPUSHService.h"
// iOS10 注册 APNs 所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
// 如果需要使用 idfa 功能所需要引入的头文件（可选）
#import <AdSupport/AdSupport.h>

#import "TCBaseNavigationController.h"
#import "TCBaseTabBarController.h"

#import "LoginViewController.h"


@interface AppDelegate ()<JPUSHRegisterDelegate>

@property (nonatomic, strong)TCBaseTabBarController *tabBar;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    //Required
       //notice: 3.0.0 及以后版本注册可以这样写，也可以继续用之前的注册方式
       JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
       if (@available(iOS 12.0, *)) {
           entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound|JPAuthorizationOptionProvidesAppNotificationSettings;
       } else {
           entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
       }
       
       [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];

       // Optional
       // 获取 IDFA
       // 如需使用 IDFA 功能请添加此代码并在初始化方法的 advertisingIdentifier 参数中填写对应值
   //    NSString *advertisingId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
       
       // Required
       // init Push
       // notice: 2.1.5 版本的 SDK 新增的注册方法，改成可上报 IDFA，如果没有使用 IDFA 直接传 nil
       [JPUSHService setupWithOption:launchOptions appKey:@"3c4a8dc8f1880c8efd4013d8"
                             channel:@"App Store"
                    apsForProduction:NO
               advertisingIdentifier:nil];
       
       NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
       [defaultCenter addObserver:self selector:@selector(networkDidReceiveMessage:) name:kJPFNetworkDidReceiveMessageNotification object:nil];
       
       [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    
    
    
    
    if (@available(iOS 11.0, *)) {
        UITableView.appearance.estimatedRowHeight = 0;
        UITableView.appearance.estimatedSectionFooterHeight = 0;
        UITableView.appearance.estimatedSectionHeaderHeight = 0;
    }
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [[UITabBar appearance] setTranslucent:NO];
    [[UITabBar appearance] setTintColor:RGB(226,136,237)];
    
    //    [CTUserDefaults setToken:@"51BA1940-AB76-48EF-9060-0D9EA83FC9AA"];
    
    //判断缓存 登录状态
    if ([CTUserDefaults isLoginSuccess]) {
        [self initControllers];
    }else{
        [self Login];
        
    }
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
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

- (void)loginSuccess:(NSString *)token{
    
    [CTUserDefaults setToken:token];
    [CTUserDefaults setIsLogonSuccess:YES];
    
    [self initControllers];
}


- (void)initControllers{
    
    self.tabBar = [[TCBaseTabBarController alloc]init];
    self.window.rootViewController = self.tabBar;
    
    
}


#pragma mark- JPUSHRegisterDelegate

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //Optional
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

#pragma mark- JPUSHRegisterDelegate
- (void)networkDidReceiveMessage:(NSNotification *)notification {
    
    
    NSDictionary * userInfo = [notification userInfo];
    NSString *content = [userInfo valueForKey:@"content"];
    NSLog(@"%@",content);
    NSDictionary *extras = [userInfo valueForKey:@"extras"];
    
    if (extras) {
        NSString *extra_type = extras[@"extra_type"];
        
        if ([extra_type isEqualToString:@"conversation"]) {
            //会话消息
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ChatInfoNotification" object:nil userInfo:extras];
            [self registerNotification:extras isChat:YES];

        }else if([extra_type isEqualToString:@"sys_notify"]){
            //处理系统消息
            NSString *notify_type = extras[@"notify_type"];
            if ([notify_type isEqualToString:@"confirm_arrive"]){
                
//                NSMutableArray *chatList = [NSMutableArray arrayWithArray:[UserDefaults chatList]];
//
//                NSString *userid = [NSString stringWithFormat:@"%@",extras[@"user_id"]];
//                NSPredicate *predicate = [NSPredicate predicateWithFormat:@"user_id CONTAINS %@ ",userid];
//
//                //筛选出来的名称
//                NSArray *filterModels =  [chatList filteredArrayUsingPredicate:predicate];
//
//                if (filterModels.count != 0) {
//                    NSDictionary *chatModel = filterModels[0];
//                    [chatList removeObject:chatModel];
//                    [UserDefaults setChatList:chatList];
//                }
                
            }
            [[NSNotificationCenter defaultCenter] postNotificationName:@"SysNotification" object:nil userInfo:extras];
            [self registerNotification:extras isChat:NO];

        }
        
    }
    
}

//使用 UNNotification 本地通知
- (void)registerNotification:(NSDictionary *)extras isChat:(BOOL )isChat{
    
    if (@available(iOS 10.0, *)) {
        NSString *body = extras[@"content"];
        NSString *nickName = extras[@"nickname"];

        JPushNotificationContent *content = [[JPushNotificationContent alloc] init];
        content.title = @"通知";
        if (isChat) {
            content.subtitle = nickName;
            content.body = body;

        }else{
            NSString *str = extras[@"str"];
            content.body = str;
        }
        content.badge = @(-1);
        content.categoryIdentifier = @"Custom Category Name";

        // 1s 后提醒 iOS 10 以上支持
        JPushNotificationTrigger *trigger1 = [[JPushNotificationTrigger alloc] init];
        trigger1.timeInterval = 1;

        JPushNotificationRequest *request = [[JPushNotificationRequest alloc] init];
        request.requestIdentifier = @"sampleRequest";
        request.content = content;
        request.trigger = trigger1;
        request.completionHandler = ^(id result) {
          
        };
        [JPUSHService addNotification:request];
    }
}

// iOS 12 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification API_AVAILABLE(ios(10.0)){
    if (notification && [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //从通知界面直接进入应用
    }else{
        //从通知设置界面进入应用
    }
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler  API_AVAILABLE(ios(10.0)){
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler(UNNotificationPresentationOptionBadge | UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有 Badge、Sound、Alert 三种类型可以选择设置
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler  API_AVAILABLE(ios(10.0)){
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler();  // 系统要求执行这个方法
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    // Required, iOS 7 Support
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    // Required, For systems with less than or equal to iOS 6
    [JPUSHService handleRemoteNotification:userInfo];
}


@end
