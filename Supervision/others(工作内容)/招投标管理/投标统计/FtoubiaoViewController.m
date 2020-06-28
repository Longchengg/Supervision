//
//  FtoubiaoViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/6/19.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "FtoubiaoViewController.h"
#import "JXCircleModel.h"
#import "JXCircleRatioView.h"


#define PIE_HEIGHT  250
#define Radius 70.5 //圆形比例图的半径

@interface FtoubiaoViewController ()
@property(nonatomic, strong) JXCircleRatioView *circleView_one;
@property(nonatomic, strong) NSMutableArray *data1;
@property (weak, nonatomic) IBOutlet UIView *circleview;
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet UILabel *lab3;
@property (weak, nonatomic) IBOutlet UILabel *lab4;
@property (weak, nonatomic) IBOutlet UILabel *lab5;
@property (weak, nonatomic) IBOutlet UILabel *lab6;
@property(nonatomic, strong) NSDictionary *NSDict;
@property(nonatomic, strong) NSArray *titleArray;
@property(nonatomic, strong) NSArray *arr1;
@property(nonatomic, strong) NSArray *arr2;
@property(nonatomic, strong) NSArray *arr3;
@property(nonatomic, strong) NSArray *arr4;
@property(nonatomic, strong) NSArray *arr5;
@property(nonatomic, strong) NSArray *arr6;


@end

@implementation FtoubiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadMore];
}
- (void)loadMore{
    WEAK_SELF;
    [HttpRequestTool get_all_lockSuccessBlock:^(id responObject) {
        __weakSelf.NSDict = (NSDictionary *)responObject[@"市政"];
        __weakSelf.arr1 = __weakSelf.NSDict[@"二级注册建造师"];
        __weakSelf.arr2 = __weakSelf.NSDict[@"施工员"];
        __weakSelf.arr3 = __weakSelf.NSDict[@"质量员"];
        __weakSelf.arr4 = __weakSelf.NSDict[@"专职安全员C证"];
        __weakSelf.arr5 = __weakSelf.NSDict[@"材料员"];
        __weakSelf.arr6 = __weakSelf.NSDict[@"标准员"];

        __weakSelf.lab1.text = [NSString stringWithFormat:@"二级注册建造师%lu人",(unsigned long)__weakSelf.arr1.count];
        __weakSelf.lab2.text = [NSString stringWithFormat:@"施工员%lu人",(unsigned long)__weakSelf.arr2.count];
        __weakSelf.lab3.text = [NSString stringWithFormat:@"质量员%lu人",(unsigned long)__weakSelf.arr3.count];
        __weakSelf.lab4.text = [NSString stringWithFormat:@"专职安全员C证%lu人",(unsigned long)__weakSelf.arr4.count];
        __weakSelf.lab5.text = [NSString stringWithFormat:@"材料员%lu人",(unsigned long)__weakSelf.arr5.count];
        __weakSelf.lab6.text = [NSString stringWithFormat:@"标准员%lu人",(unsigned long)__weakSelf.arr6.count];

      //添加圆形比例图
      [self.circleview addSubview:self.circleView_one];
    } failureBlock:^(id err) {
        [self showAlertMsg:err];
    }];
}
- (NSMutableArray *)data1{
    if (_data1 == nil) {
        _data1 = [NSMutableArray array];
        
        NSArray *colors = @[RGB(0, 150, 255),RGB(0, 145, 147),RGB(118, 214, 255),RGB(255, 212, 121),RGB(255, 147, 0),RGB(255, 126, 121)];
        NSArray *numbers = @[[NSString stringWithFormat:@"%lu",(unsigned long)_arr1.count],[NSString stringWithFormat:@"%lu",(unsigned long)_arr2.count],[NSString stringWithFormat:@"%lu",(unsigned long)_arr3.count],[NSString stringWithFormat:@"%lu",(unsigned long)_arr4.count],[NSString stringWithFormat:@"%lu",(unsigned long)_arr5.count],[NSString stringWithFormat:@"%lu",(unsigned long)_arr6.count]];
        
        for (int i = 0; i < numbers.count; i++) {
            JXCircleModel *model = [[JXCircleModel alloc]init];
            model.color = colors[i];
            model.number = numbers[i];
            [_data1  addObject:model];
        }
        
    }
    return _data1;
}


- (JXCircleRatioView *)circleView_one{
    if (!_circleView_one) {
        _circleView_one = [[JXCircleRatioView alloc]initWithFrame:CGRectMake(0, 0, 150, 150)  andDataArray:self.data1 CircleRadius:60];
        _circleView_one.backgroundColor = [UIColor whiteColor];
    }
    return _circleView_one;
}




@end
