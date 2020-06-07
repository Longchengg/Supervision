//
//  ShowImageTool.m
//  cjbapp
//
//  Created by 龙成 on 2020/3/30.
//  Copyright © 2020 cjbapp. All rights reserved.
//

#import "ShowImageTool.h"

@interface ShowImageTool()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ShowImageTool

+ (ShowImageTool *)shareClient
{
    static ShowImageTool *_shareClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareClient = [[ShowImageTool alloc] init];
        
    });
    return _shareClient;
}

- (void)showImage:(NSArray *)imageArr andIndex:(NSInteger )index{

    if (imageArr.count == 0) {
        return;
    }
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [window addSubview:_scrollView];
    
    _scrollView.backgroundColor = RGB(0, 0, 0);
    //滚动式图的代理
//    _scrollView.delegate = self;
    
    /**
     滚动范围(手动拖拽时的范围)
     如果不写就不能手动拖拽(但是定时器可以让图片滚动)
     */
    _scrollView.contentSize = CGSizeMake(imageArr.count * SCREEN_WIDTH, SCREEN_HEIGHT);
    
    //分页滚动效果 yes
    _scrollView.pagingEnabled = YES;
    
    //能否滚动
    _scrollView.scrollEnabled = YES;
    
    //弹簧效果 NO
    _scrollView.bounces = NO;
    
    //滚动视图的起始偏移量
    _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH*index, 0);
    
    //垂直滚动条
    _scrollView.showsVerticalScrollIndicator = NO;
    
    //水平滚动条
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    for (int i = 0; i < imageArr.count; i ++) {
        //初始化图片视图
        UIImageView * imgV = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        //给图片视图添加图片 通过图片数组
        NSString *str = imageArr[i];
        if (![str containsString:@"http"]) {
            str =   [NSString stringWithFormat:@"%@%@",HttpRequestImageURL,str];
        }

        [imgV sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@"LoadImg"]];
        
        UIImage *image = imgV.image;
        float high = SCREEN_WIDTH * (image.size.height / image.size.width);
        
        imgV.frame = CGRectMake(SCREEN_WIDTH *i, (SCREEN_HEIGHT - high)/2, SCREEN_WIDTH, high);
        //让图片可以与用户交互
        imgV.userInteractionEnabled = YES;
        
        //初始化一个点击手势
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImage:)];
        
        //把点击手势添加到图片上
        [imgV addGestureRecognizer:tap];
        
        //把图片视图 添加 到滚动视图上
        [_scrollView addSubview:imgV];
        
    }
    
}

- (void)hideImage:(UITapGestureRecognizer*)tap{

    [UIView animateWithDuration:0.3 animations:^{
        self.scrollView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.scrollView removeFromSuperview];
    }];
}

@end
