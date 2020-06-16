//
//  UserDelegateViewController.m
//  schoolRun
//
//  Created by 龙成 on 2019/9/11.
//  Copyright © 2019 龙成. All rights reserved.
//

#import "UserDelegateViewController.h"

@interface UserDelegateViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation UserDelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"用户协议";
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"协议.docx" ofType:nil];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    [_webView loadRequest:@"https://saas.jz-rck.com/protocol.html"];
//    [_webView loadData:data MIMEType:@"application/vnd.openxmlformats-officedocument.wordprocessingml.document" textEncodingName:@"UTF-8" baseURL:[NSURL fileURLWithPath:NSTemporaryDirectory()]];

    _webView.scalesPageToFit = YES;


    
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
