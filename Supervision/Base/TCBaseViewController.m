//
//  TCBaseViewController.m
//  Supervision
//
//  Created by 龙成 on 2019/10/23.
//  Copyright © 2019 ThinkingCollision. All rights reserved.
//

#import "TCBaseViewController.h"

@interface TCBaseViewController ()

@end

@implementation TCBaseViewController

- (void)viewWillDisappear:(BOOL)animated{
    NSArray *arr = self.navigationController.viewControllers;
    if (arr.count > 1) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }else{
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    NSArray *arr = self.navigationController.viewControllers;
    if (arr.count > 1) {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController setNavigationBarHidden:NO animated:YES];

    }else{
        [self.navigationController setNavigationBarHidden:YES animated:YES];

    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //处理导航栏有条线的问题
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];

    self.view.backgroundColor = RGB(255, 255, 255);
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [leftBtn setImage:[UIImage imageNamed:@"nav_left"] forState:UIControlStateNormal];
    
    [leftBtn sizeToFit];
    // 让按钮内部的所有内容左对齐
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    //设置内边距，让按钮靠近屏幕边缘
    leftBtn.contentEdgeInsets = UIEdgeInsetsMake(0, - 7, 0, 0);
    [leftBtn addTarget:self action:@selector(leftBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    _leftBtn = leftBtn;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
}

- (void)leftBtn:(UIButton *)leftBtn
{
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)setRightBtn:(NSString *)title
              color:(UIColor *)color{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
    
    [btn sizeToFit];
    // 让按钮内部的所有内容左对齐
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    //设置内边距，让按钮靠近屏幕边缘
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, - 7, 0, 0);
    [btn addTarget:self action:@selector(rightBtn:) forControlEvents:UIControlEventTouchUpInside];
    _rightBtn = btn;

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}

- (void)setRightBtnImage:(UIImage *)img{
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setBackgroundImage:img forState:UIControlStateNormal];
    [btn sizeToFit];
    // 让按钮内部的所有内容左对齐
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    //设置内边距，让按钮靠近屏幕边缘
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, - 7, 0, 0);
    [btn addTarget:self action:@selector(rightBtn:) forControlEvents:UIControlEventTouchUpInside];
    _rightBtn = btn;

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}

- (void)rightBtn:(UIButton *)rightBtn{
    
}

- (void)showAlertMsg:(NSString *)message
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    if (message) {
        
        hud.label.numberOfLines = 0;
        
        hud.label.text = message;
        hud.mode = MBProgressHUDModeText;
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = YES;
        // 2秒之后再消失
        [hud hideAnimated:YES afterDelay:2.0];
    }
    
}

- (void)setVCTitle:(NSString *)title{
    
    self.title = title;
    
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20.0f];
    normalAttrs[NSForegroundColorAttributeName] = RGB(51, 51, 51);

    [self.navigationController.navigationBar setTitleTextAttributes:normalAttrs];

}

- (void)setVCTitleColor:(UIColor *)color{
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: color}];

}
#pragma mark - 全局点击view收起键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
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
