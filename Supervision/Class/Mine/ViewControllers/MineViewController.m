//
//  MineViewController.m
//  Supervision
//
//  Created by 龙成 on 2020/5/18.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "MineViewController.h"

#import "MineTopTableViewCell.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [_tableView registerNib:[UINib nibWithNibName:@"MineTopTableViewCell" bundle:nil] forCellReuseIdentifier:@"MineTopTableViewCell"];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (0 == section) {
        return 1;
    }
    return 5;
    

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (0 == indexPath.section) {
        return 240;
    }
    return 55.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (0 == section) {
        return 0.0001f;
    }
    return 40.0f;

}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.0001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (0 == section) {
        return [[UIView alloc]init];
    }
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
    
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 11, 80, 18)];

    titleLab.text = @"功能";

    titleLab.textColor = TextColor;
    titleLab.font = [UIFont boldSystemFontOfSize:18.0f];
    
    [view addSubview:titleLab];
    

    return view;
    
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return [[UIView alloc]init];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int section = (int)indexPath.section;
    int row     = (int)indexPath.row;

    if (0 == section) {
        MineTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineTopTableViewCell"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;//设置cell点击效果
        return cell;
    }else{
        static NSString *identifier = @"MineCellIdentifier";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
            cell.accessoryType   = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle  = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor whiteColor];
            
            cell.textLabel.textColor = TextColor;
            cell.textLabel.font      = [UIFont systemFontOfSize:14.0f];
            cell.detailTextLabel.textColor = SubTextColor;
            cell.detailTextLabel.font      = [UIFont systemFontOfSize:14.0f];
        }
        
        NSArray *arr = @[@"个人资料",@"修改密码",@"设置",@"隐私条款",@"意见与反馈"];
        
        cell.imageView.image = [UIImage imageNamed:arr[row]];
        
        cell.textLabel.text  = arr[row];
        
        
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(65, 54, SCREEN_WIDTH - 80, 1);
        layer.backgroundColor = LineColor;
        
        [cell.layer addSublayer:layer];

        return cell;

    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    
    switch (indexPath.row) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:{
            
        }
            break;
        case 3:{
        }
            break;
        case 4:{
        }
            break;
        default:
            
            break;
    }
    
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
