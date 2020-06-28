//
//  JianNiuWebViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/21.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "JianNiuWebViewController.h"
#import "SYProgressWebView.h"

@interface JianNiuWebViewController () <SYProgressWebViewDelegate,UIDocumentInteractionControllerDelegate>

@property (nonatomic, strong) SYProgressWebView *webView;
@property (nonatomic, strong) NSString *webViewStr;
/**
 documentInteractionController，用来显示或者分享log文件内容
 */
@property (nonatomic, strong) UIDocumentInteractionController *documentController ;


@end

@implementation JianNiuWebViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setUI];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if (self.webView)
    {
        [self.webView timerKill];
    }
}

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor clearColor];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
}

- (void)dealloc
{
    self.webView = nil;
    
    NSLog(@"%@ 被释放了!!!", self);
}

#pragma mark - 创建视图

- (void)setUI
{
  WEAK_SELF;
  [HttpRequestTool policy_article_get:_webId
                     SuccessBlock:^(id responObject) {
     
      __weakSelf.webViewStr = (NSString *)responObject[@"content"];
      [self webViewUIPush];

  } failureBlock:^(id err) {
  
      
  }];
//    }
}

#pragma mark 网页视图

- (void)webViewUIPush
{
    NSString *url = _webViewStr;
//    NSString *url = @"http://www.hao123.com";
//    NSString *url = @"http://www.toutiao.com";
//    NSString *url = @"http://192.168.3.100:8089/ecsapp/appInventoryModel/intoTotalInvView?account=jie.zheng&token=1";
    
    
 
    WeakWebView;
    // 方法1 实例化
//    self.webView = [[ZLCWebView alloc] initWithFrame:self.view.bounds];
    // 方法2 实例化
    self.webView = [[SYProgressWebView alloc] init];
    [self.view addSubview:self.webView];
    self.webView.frame = self.view.bounds;
//    self.webView.url = url;
    _webView.delegate = self;
//    _webView.scrollView.bounces = NO;
//    _webView.scrollView.showsHorizontalScrollIndicator = NO;
//    _webView.scrollView.scrollEnabled = NO;
//    [_webView sizeToFit];
    [self.webView sizeToFit];
   
    [self.webView loadRequestWithHTML:_webViewStr];
    self.webView.isBackRoot = NO;
    self.webView.showActivityView = YES;
    self.webView.showActionButton = YES;
    [self.webView reloadUI];
    [self.webView loadRequest:^(SYProgressWebView *webView, NSString *title, NSURL *url) {
        NSLog(@"准备加载。title = %@, url = %@", title, url);
        weakWebView.title = title;
    } didStart:^(SYProgressWebView *webView) {
        NSLog(@"开始加载。");
    } didFinish:^(SYProgressWebView *webView, NSString *title, NSURL *url) {
        NSLog(@"成功加载。title = %@, url = %@", title, url);
        weakWebView.title = title;
    } didFail:^(SYProgressWebView *webView, NSString *title, NSURL *url, NSError *error) {
        NSLog(@"失败加载。title = %@, url = %@, error = %@", title, url, error);
        weakWebView.title = title;
    }];
}
//- (void)webViewDidFinishLoad:(UIWebView *)webView
//{
//    _webView = webView;
//    //获取页面高度（像素）
//    NSString * clientheight_str = [_webView stringByEvaluatingJavaScriptFromString: @"document.body.clientHeight"];
//    float clientheight = [clientheight_str floatValue];
//    //设置到WebView上
//    _webView.frame = CGRectMake(0, 200, self.view.frame.size.width, clientheight);
//    //获取WebView最佳尺寸（点）
//    CGSize frame = [webView sizeThatFits:_webView.frame.size];
//    //获取内容实际高度（像素）
//    NSString * height_str= [_webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('webview_content_wrapper').clientHeight + parseInt(window.getComputedStyle(document.getElementsByTagName('body')[0]).getPropertyValue('margin-top'))  + parseInt(window.getComputedStyle(document.getElementsByTagName('body')[0]).getPropertyValue('margin-bottom'))"];
//    float height = [height_str floatValue];
//    //内容实际高度（像素）* 点和像素的比
//    height = height * frame.height / clientheight;
//    //再次设置WebView高度（点）
//    _webView.frame = CGRectMake(0, 200, self.view.frame.size.width, clientheight + 30);//这里有坑
//    //设置能滑动的位置
////    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH,200 + clientheight + 30);
//}
- (void)webViewUIPresent
{
    NSString *url = @"https://www.baidu.com";
//    NSString *url = @"http://www.hao123.com";
//    NSString *url = @"http://www.toutiao.com";
//    NSString *url = @"http://192.168.3.100:8089/ecsapp/appInventoryModel/intoTotalInvView?account=jie.zheng&token=1";
    

    // 方法1 实例化
//    self.webView = [[ZLCWebView alloc] initWithFrame:self.view.bounds];
    // 方法2 实例化
    self.webView = [[SYProgressWebView alloc] init];
    [self.view addSubview:self.webView];
    self.webView.frame = self.view.bounds;
    self.webView.url = url;
    self.webView.isBackRoot = NO;
    self.webView.showActivityView = YES;
    self.webView.showActionButton = YES;
    self.webView.backButton.backgroundColor = [UIColor yellowColor];
    self.webView.forwardButton.backgroundColor = [UIColor greenColor];
    self.webView.reloadButton.backgroundColor = [UIColor brownColor];
    [self.webView reloadUI];
    self.webView.delegate = self;
}

#pragma mark 取消按钮

//- (void)navigationItemButtonUI
//{
//    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    backButton.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
//    backButton.imageEdgeInsets = UIEdgeInsetsMake(0.0, -20.0, 0.0, 0.0);
//    [backButton setImage:[UIImage imageNamed:@"backPreviousImage"] forState:UIControlStateNormal];
//    [backButton addTarget:self action:@selector(backPreviousController) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc ] initWithCustomView:backButton];
//}

#pragma mark - 响应事件

- (void)backPreviousController
{
    if (self.webView)
    {
        if (self.webView.isBackRoot)
        {
            [self.webView stopLoading];
            
            if ([self.navigationController.viewControllers indexOfObject:self] == 0)
            {
                [self dismissViewControllerAnimated:YES completion:nil];
            }
            else
            {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }
        else
        {
            if ([self.webView canGoBack])
            {
                [self.webView goBack];
            }
            else
            {
                if ([self.navigationController.viewControllers indexOfObject:self] == 0)
                {
                    [self dismissViewControllerAnimated:YES completion:nil];
                }
                else
                {
                    [self.navigationController popToRootViewControllerAnimated:YES];
                }
            }
        }
    }
}

#pragma mark - SYProgressWebViewDelegate

- (void)progressWebViewDidStartLoad:(SYProgressWebView *)webview
{
    NSLog(@"开始加载。");
}

- (void)progressWebView:(SYProgressWebView *)webview title:(NSString *)title shouldStartLoadWithURL:(NSURL *)url
{
    NSLog(@"准备加载。title = %@, url = %@", title, url);
    self.title = title;
}

- (void)progressWebView:(SYProgressWebView *)webview title:(NSString *)title didFinishLoadingURL:(NSURL *)url
{
    NSLog(@"成功加载。title = %@, url = %@", title, url);
    self.title = title;
}

- (void)progressWebView:(SYProgressWebView *)webview title:(NSString *)title didFailToLoadURL:(NSURL *)url error:(NSError *)error
{
    NSLog(@"失败加载。title = %@, url = %@, error = %@", title, url, error);
    self.title = title;
}



@end
