//
//  YijianfankuiViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/22.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "YijianfankuiViewController.h"
#import "PlaceholderTextView.h"
@interface YijianfankuiViewController ()<
UITextFieldDelegate
>

@property (weak, nonatomic) IBOutlet UIView *viewT;
@property (nonatomic,strong) NSString *context;
@end

@implementation YijianfankuiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"意见反馈"];
    //    _textView.delegate = self;
    PlaceholderTextView *textView = [[PlaceholderTextView alloc]init];
    textView.placeholderLabel.font = [UIFont systemFontOfSize:15];
    textView.placeholder = @"请输入您宝贵的意见或建议，200字以内";
    textView.font = [UIFont systemFontOfSize:15];
    if (@available(iOS 13.0, *)) {
        textView.backgroundColor = [UIColor systemGray6Color];
    } else {
        // Fallback on earlier versions
    }
//    textView.frame = (CGRect){10,10,CGRectGetWidth(self.view.frame)-70,180};
    textView.frame = (CGRect){10,10,SCREEN_WIDTH-70,180};
    textView.maxLength = 200;
    //    textView.layer.cornerRadius = 5.f;
    //    textView.layer.borderColor = [[UIColor grayColor]colorWithAlphaComponent:0.3].CGColor;
    //    textView.layer.borderWidth = 0.5f;
    [self.viewT addSubview:textView];
    
    [textView didChangeText:^(PlaceholderTextView *textView) {
        NSLog(@"%@",textView.text);
        self->_context = textView.text;
    }];
}

- (IBAction)didBtn:(id)sender {
    if (_context == nil || [_context isEqualToString:@""]) {
        [self showAlertMsg:@"请先输入内容"];
        return;
    }
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"温馨提示"
                                                                   message:@"是否确认提交此条信息"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
        
    }];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
        
        [HttpRequestTool feedback:self->_context platform:@"2" successBlock:^(id responObject) {
            [self showAlertMsg:@"提交成功"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.navigationController popViewControllerAnimated:YES];
            });
        } failureBlock:^(id err) {
            
        }];
        
    }];
    
    [alert addAction:cancelAction];
    [alert addAction:defaultAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
    
}


@end
