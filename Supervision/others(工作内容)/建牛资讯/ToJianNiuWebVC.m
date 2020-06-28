//
//  ToJianNiuWebVC.m
//  Supervision
//
//  Created by 龙成 on 2020/6/21.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "ToJianNiuWebVC.h"

@interface ToJianNiuWebVC ()<
UIWebViewDelegate
>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) NSString *webViewcont;

@end

@implementation ToJianNiuWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _titelStr;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, Height_NavBar, SCREEN_WIDTH, SCREEN_HEIGHT - Height_NavBar)];
    self.scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.scrollView];
    [self setUI];
}


- (void)setUI
{
  WEAK_SELF;
  [HttpRequestTool policy_article_get:_webId
                     SuccessBlock:^(id responObject) {
      __weakSelf.webViewcont = (NSString *)responObject[@"content"];
      [self setupMainView];

  } failureBlock:^(id err) {
  
      
  }];
//    }
}

-(void)setupMainView{
    
    _webView = [[UIWebView alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, 0)];
    _webView.delegate = self;
    _webView.scrollView.bounces = NO;
    _webView.scrollView.showsHorizontalScrollIndicator = NO;
    _webView.scrollView.scrollEnabled = NO;
    [_webView sizeToFit];
    [_webView loadHTMLString:_webViewcont baseURL:nil];
    [self.scrollView addSubview:_webView];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    _webView = webView;
    //获取页面高度（像素）
    NSString * clientheight_str = [_webView stringByEvaluatingJavaScriptFromString: @"document.body.clientHeight"];
    float clientheight = [clientheight_str floatValue];
    //设置到WebView上
    _webView.frame = CGRectMake(0, 0, self.view.frame.size.width, clientheight);
    //获取WebView最佳尺寸（点）
    CGSize frame = [webView sizeThatFits:_webView.frame.size];
    //获取内容实际高度（像素）
    NSString * height_str= [_webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('webview_content_wrapper').clientHeight + parseInt(window.getComputedStyle(document.getElementsByTagName('body')[0]).getPropertyValue('margin-top'))  + parseInt(window.getComputedStyle(document.getElementsByTagName('body')[0]).getPropertyValue('margin-bottom'))"];
    float height = [height_str floatValue];
    //内容实际高度（像素）* 点和像素的比
    height = height * frame.height / clientheight;
    //再次设置WebView高度（点）
    _webView.frame = CGRectMake(0, 0, self.view.frame.size.width, clientheight + 30);//这里有坑
    //设置能滑动的位置
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, clientheight + 30);
}

@end
