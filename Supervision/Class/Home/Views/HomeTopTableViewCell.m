//
//  HomeTopTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/5/21.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "HomeTopTableViewCell.h"
#import "WCScrollLabelView.h"

@interface HomeTopTableViewCell()<WCScrollLabelViewDelegate>
{
    WCScrollLabelView *scrollLabelView1;
    WCScrollLabelView *scrollLabelView2;
    WCScrollLabelView *scrollLabelView3;
    
}
@property (weak, nonatomic) IBOutlet UIView *noticeview;
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *titles1;
@property (nonatomic, strong) NSMutableArray *titles2;


@end

@implementation HomeTopTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.titles= [NSMutableArray arrayWithObjects:@"这是第一条这是第一条这是第一条这是第一条",@"这是第二条这是",@"三三三三",nil];
    
    self.titles1= [[NSMutableArray alloc]initWithCapacity:0];
    NSMutableIndexSet  *indexes = [NSMutableIndexSet indexSetWithIndexesInRange:NSMakeRange(0, self.titles.count)];
    [self.titles1 insertObjects:self.titles atIndexes:indexes];
    [self.titles1 insertObject:self.titles1[0] atIndex:self.titles1.count];
    [self.titles1 removeObjectAtIndex:0];
    
    self.titles2 = [[NSMutableArray alloc]initWithCapacity:0];
    NSMutableIndexSet  *indexes1 = [NSMutableIndexSet indexSetWithIndexesInRange:NSMakeRange(0, self.titles1.count)];
    [self.titles2 insertObjects:self.titles1 atIndexes:indexes1];
    [self.titles2 insertObject:self.titles2[0] atIndex:self.titles2.count];
    [self.titles2 removeObjectAtIndex:0];
    
    if (_titles.count>2) {
        scrollLabelView1 = [[WCScrollLabelView alloc] initWithFrame:CGRectMake(5, 56, _noticeview.width + 20, 15)];
        scrollLabelView2 = [[WCScrollLabelView alloc] initWithFrame:CGRectMake(5, 56 + 20, _noticeview.width + 20, 15)];
        scrollLabelView3 = [[WCScrollLabelView alloc] initWithFrame:CGRectMake(5, 56 + 20 + 20, _noticeview.width + 20, 15)];
        
        [self initUI:scrollLabelView1 arr:_titles titleColor:RGBA(0, 0, 0, 1)];
        
        
        [self initUI:scrollLabelView2 arr:_titles1 titleColor:RGBA(0, 0, 0, 0.5)];
        
        [self initUI:scrollLabelView3 arr:_titles2 titleColor:RGBA(0, 0, 0, 0.2)];
        
    }else if (_titles.count>1){
        scrollLabelView1 = [[WCScrollLabelView alloc] initWithFrame:CGRectMake(5, 56, _noticeview.width + 20, 15)];
        scrollLabelView2 = [[WCScrollLabelView alloc] initWithFrame:CGRectMake(5, 56 + 20, _noticeview.width + 20, 15)];
        
        [self initUI:scrollLabelView1 arr:_titles titleColor:RGBA(0, 0, 0, 1)];
        
        //数组第一个元素放到最后
        [self.titles insertObject:self.titles[0] atIndex:self.titles.count];
        //移除第一个
        [self.titles removeObjectAtIndex:0];
        [self initUI:scrollLabelView2 arr:_titles titleColor:RGBA(0, 0, 0, 0.5)];
    }else{
        scrollLabelView1 = [[WCScrollLabelView alloc] initWithFrame:CGRectMake(5, 56 + 20, _noticeview.width + 20, 15)];
        [self initUI:scrollLabelView1 arr:_titles titleColor:RGBA(0, 0, 0, 1)];
    }
}

- (void)initUI:(WCScrollLabelView *)scrollLabelView
           arr:(NSMutableArray *)arr
    titleColor:(UIColor *)titleColor{
    
    scrollLabelView.backgroundColor = [UIColor whiteColor];
    scrollLabelView.delegate = self;
    scrollLabelView.titleArray = arr;
    //设置label的字体
    scrollLabelView.titleFont = [UIFont systemFontOfSize:15];
    //设置文字颜色
    scrollLabelView.titleColor = titleColor;
    //设置停留时间
    scrollLabelView.stayInterval = 3.f;
    //设置滚动动画时间
    scrollLabelView.animationDuration = 2.f;
    //设置对齐方式
    scrollLabelView.textAligment = NSTextAlignmentCenter;
    //设置内边距
    scrollLabelView.contentInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [_noticeview addSubview:scrollLabelView];
    //开始滚动
    [scrollLabelView beginScrolling];
    
}

- (IBAction)didClickWorkSpaceBtn:(id)sender {
    
    if ([_delegate respondsToSelector:@selector(didClickWorkSpaceBtn:)]) {
        
        [_delegate didClickWorkSpaceBtn:sender];
    }
    
}
- (IBAction)didClickDetailsBtn:(id)sender {
     if ([_delegate respondsToSelector:@selector(didClickDetailsBtn:)]) {
           
           [_delegate didClickDetailsBtn:sender];
       }
    }
        
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
        [super setSelected:selected animated:animated];
        
        // Configure the view for the selected state
    }
        
        @end
