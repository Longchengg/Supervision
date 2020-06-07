//
//  LoginViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/5/18.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "LoginViewController.h"
#import "UserDelegateViewController.h"
#import "TCBaseNavigationController.h"
#import "TCBaseTabBarController.h"

//定时器
NSInteger const endTimes1 = 59;
//协议
static int *agreement = 0;

@interface LoginViewController ()<UITextFieldDelegate>
{
    //倒计时
    NSInteger _countDown;
    //定时器
    NSTimer * _timer;
    //验证码
    NSString * _verificationCode;
}
@property (weak, nonatomic) IBOutlet UIView *viewline1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightline1;
@property (weak, nonatomic) IBOutlet UIView *viewline2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightline2;
@property (weak, nonatomic) IBOutlet UIButton *codebutton;
@property (weak, nonatomic) IBOutlet UITextField *phoneN;
@property (weak, nonatomic) IBOutlet UITextField *CodeN;
@property (weak, nonatomic) IBOutlet UIButton *CodeTime;
@property (weak, nonatomic) IBOutlet UIButton *agreeIcon;

@property (nonatomic ,strong) NSTimer *timer;
@property (nonatomic ,assign) NSInteger count;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //顶部safa颜色适配
    [self safeview];
    
    //建立委托关系
    self.phoneN.delegate = self;
    self.CodeN.delegate = self;
    //初始化倒计时
    _countDown = endTimes1;
    
}
-(void)safeview
{
    UIView *view = [[UIView alloc]init];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)RGB(16, 136, 237).CGColor, (__bridge id)RGB(13, 129, 242).CGColor, (__bridge id)RGB(13, 127, 243).CGColor];
    gradientLayer.locations = @[@0.0, @0.5, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = CGRectMake(0, 0, SCREEN_WIDTH, Height_StatusBar + 30);
    [view.layer addSublayer:gradientLayer];
    [self.view addSubview:view];
}

- (IBAction)phoneNClick:(id)sender {
    self.viewline1.backgroundColor = RGB(0,168,242);
    self.viewline2.backgroundColor = RGB(214, 214, 218);
    self.heightline1.constant = 2;
    self.heightline2.constant = 1;
}

- (IBAction)CodeNClick:(id)sender {
    self.viewline1.backgroundColor = RGB(214, 214, 218);
    self.viewline2.backgroundColor = RGB(0,168,242);
    self.heightline1.constant = 1;
    self.heightline2.constant = 2;
}

//验证码
- (IBAction)codebuttonClick:(id)sender {
    if(self.phoneN.text.length != 11){
        [self showAlertMsg:@"请输入正确手机号"];
        return;
    }
    self.codebutton.selected = YES;
    [self.codebutton setTitle:@"重新发送60s" forState:UIControlStateHighlighted];
    //开启定时器
    if(_timer==nil){
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(action) userInfo:nil repeats:YES];
    }
    WEAK_SELF;
       [HttpRequestTool sendCode:self.phoneN.text
                         type:@"1"
                 successBlock:^(id responObject) {
        
        [self showAlertMsg:@"验证码发送成功"];
    } failureBlock:^(id err) {
        
        [self showAlertMsg:err];
    }];
    
}
//登录
- (IBAction)login:(id)sender {
    WEAK_SELF;
       [HttpRequestTool uersLogin:@"18888888888"
                       verifyCode:@"666666"
                     successBlock:^(id responObject) {
           
           NSString *token = (NSString *)responObject;
           [CTUserDefaults setToken:token];
           
           TCBaseTabBarController * tvc = [[TCBaseTabBarController alloc]init];
           self.view.window.rootViewController = tvc;
       } failureBlock:^(id err) {
           
       }];
}

#pragma mark - 验证码按钮
-(void)action{
    if(_countDown>0){
        _countDown--;
        [self.codebutton setTitle:[NSString stringWithFormat:@"重新发送%lds",_countDown] forState:UIControlStateNormal];
    }else{
        self.codebutton.selected = NO;
        [self.codebutton setTitle:@"获取验证码" forState:UIControlStateNormal];
        //重置时间
        _countDown = endTimes1;
        //关闭定时器
        [_timer invalidate];
        //重置_timer
        _timer = nil;
        
    }
}

#pragma mark - 按钮事件
-(void)dismissKeyBoard
{
    [self.view endEditing:YES];
}
#pragma mark - 键盘下拉
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    self.viewline1.backgroundColor = RGB(214, 214, 218);
    self.viewline2.backgroundColor = RGB(214, 214, 218);
    self.heightline1.constant = 1;
    self.heightline2.constant = 1;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    return YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //关闭定时器
    [_timer invalidate];
}

#pragma mark - 用户协议

- (IBAction)IconButtonClick:(id)sender {
    self.agreeIcon.selected = !self.agreeIcon.selected;
}
- (IBAction)agreeButtonClick:(id)sender {
    UserDelegateViewController *VC = [[UserDelegateViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}



@end
