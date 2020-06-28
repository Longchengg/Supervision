//
//  ShezhiViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/22.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "ShezhiViewController.h"
#import "YijianfankuiViewController.h"
#import "JPUSHService.h"

@interface ShezhiViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet UILabel *lab3;
@property (weak, nonatomic) IBOutlet UILabel *lab4;
@property (weak, nonatomic) IBOutlet UILabel *lab5;

@end

@implementation ShezhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setVCTitle:@"设置"];
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    
    //    CFShow(infoDictionary);
    // app名称
    
    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    
    // app版本
    
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
    // app build版本
    
    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    
    _lab1.text = [NSString stringWithFormat:@"版本号%@",app_Version];
    _lab2.text = @"版本更新";
    _lab3.text = app_Name;
    _lab4.text = @"意见反馈";
    _lab5.text = @"";
}
- (IBAction)btn1Click:(id)sender {
    NSString *urlString=@"https://apps.apple.com/cn/app/id1492881353"; //自己应用在App Store里的地址
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    
}
- (IBAction)btn2Click:(id)sender {
    YijianfankuiViewController *VC = [[YijianfankuiViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}
- (IBAction)btn3Click:(id)sender {
    
    //退出登录
    
    [HttpRequestTool uers_quitsuccessBlock:^(id responObject) {
        
        //取消极光绑定
        [JPUSHService registrationIDCompletionHandler:^(int resCode, NSString *registrationID) {
            NSLog(@"resCode : %d,registrationID: %@",resCode,registrationID);
            
            [HttpRequestTool client_push_unBind:registrationID successBlock:^(id responObject) {
                
                [ShareApp loginOut];
                
            } failureBlock:^(id err) {
                
            }];
        }];
    } failureBlock:^(id err) {
        
    }];
}


@end
