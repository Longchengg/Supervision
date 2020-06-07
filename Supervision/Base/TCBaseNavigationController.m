//
//  TCBaseNavigationController.m
//  Supervision
//
//  Created by 龙成 on 2019/10/23.
//  Copyright © 2019 ThinkingCollision. All rights reserved.
//

#import "TCBaseNavigationController.h"

@interface TCBaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation TCBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationBarHidden:YES animated:NO];
    
    //设置右滑返回手势的代理为自身
    __weak typeof(self) weakself = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = (id)weakself;
    }
}

#pragma mark - UIGestureRecognizerDelegate
//这个方法是在手势将要激活前调用：返回YES允许右滑手势的激活，返回NO不允许右滑手势的激活
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        //屏蔽调用rootViewController的滑动返回手势，避免右滑返回手势引起死机问题
        if (self.viewControllers.count < 2 ||
            self.visibleViewController == [self.viewControllers objectAtIndex:0]) {
            return NO;
        }
    }
    //这里就是非右滑手势调用的方法啦，统一允许激活
    return YES;
}

/**
 *  通过拦截push方法来设置每个push进来的控制器的返回按钮
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
   
    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器
        
        viewController.hidesBottomBarWhenPushed = YES; // 隐藏底部的工具条
        
        
    
    }
    
    //一旦调用super的pushViewController方法,就会创建子控制器viewController的view并调用viewController的viewDidLoad方法。可以在viewDidLoad方法中重新设置自己想要的左上角按钮样式
    [super pushViewController:viewController animated:animated];
    
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
