//
//  MineViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/5/18.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "MineViewController.h"
#import "MineViewModel.h"
#import "MineTopTableViewCell.h"
#import "MessageMainViewController.h"
#import "ShezhiViewController.h"
@interface MineViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet UILabel *lab3;
@property (weak, nonatomic) IBOutlet UILabel *lab4;
@property (weak, nonatomic) IBOutlet UILabel *lab5;
@property (weak, nonatomic) IBOutlet UILabel *lab6;
@property (weak, nonatomic) IBOutlet UILabel *lab7;
@property (weak, nonatomic) IBOutlet UILabel *lab8;
@property (weak, nonatomic) IBOutlet UILabel *lab9;
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) NSDictionary *Dict;
@property (nonatomic, strong) MineViewModel *mineViewModel;
@property (nonatomic, strong) NSString *phoneNum;


@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadMore];
}
- (void)loadMore{
    WEAK_SELF;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [HttpRequestTool user_companySuccessBlock:^(id responObject) {
            
            __weakSelf.mineViewModel = [MineViewModel mj_objectWithKeyValues:(MineViewModel *)responObject];
            [__weakSelf inview];
        } failureBlock:^(id err) {
            
        }];
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [HttpRequestTool client_serviceInfoSuccessBlock:^(id responObject) {
            
            __weakSelf.Dict = (NSDictionary *)responObject;
            __weakSelf.lab9.text = __weakSelf.Dict[@"serviceTime"];
            __weakSelf.phoneNum = __weakSelf.Dict[@"serviceMobile"];

            
        } failureBlock:^(id err) {
            
        }];
    });
//    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        
//        [HttpRequestTool user_companySuccessBlock:^(id responObject) {
//            
//            
//            
//        } failureBlock:^(id err) {
//            
//        }];
//    });
}
-(void)inview{
    _lab1.text = [NSString stringWithFormat:@"%@",_mineViewModel.companyName];
//    _lab2.text = [NSString stringWithFormat:@"%@",_mineViewModel.];
    _lab3.text = [NSString stringWithFormat:@"服务截止日期:%@",_mineViewModel.endTime];
    _lab4.text = [NSString stringWithFormat:@"%@",_mineViewModel.companyName];
    _lab5.text = [NSString stringWithFormat:@"法人：%@",_mineViewModel.legalpersonName];
    _lab6.text = [NSString stringWithFormat:@"电话：%@",_mineViewModel.legalpersonPhone];
    _lab7.text = [NSString stringWithFormat:@"地址：%@",_mineViewModel.companyAddress];
    _lab8.text = [NSString stringWithFormat:@"经办人-%@/%@",_mineViewModel.operatorName,_mineViewModel.operatorPhone];
//    _lab9.text = [NSString stringWithFormat:@"%@",_mineViewModel.];

}
- (IBAction)shezhiBtn:(id)sender {
    ShezhiViewController *VC = [[ShezhiViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}
- (IBAction)xiaoxiBtn:(id)sender {
    MessageMainViewController *VC = [[MessageMainViewController alloc]init];
     [self.navigationController pushViewController:VC animated:YES];
}
- (IBAction)phontBtn:(id)sender {
    NSString *telStr = _phoneNum;
    UIWebView *callWebView = [[UIWebView alloc] init];
    NSURL *telURL          = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",telStr]];
    [callWebView loadRequest:[NSURLRequest requestWithURL:telURL]];
    
    [self.view addSubview:callWebView];
}


#pragma mark -
#pragma mark    NSNotificationDelegate -- 通知回调

#pragma mark -
#pragma mark    delegate


#pragma mark -
#pragma mark    event


#pragma mark -
#pragma mark    method


#pragma mark -
#pragma mark    getter/setter

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
