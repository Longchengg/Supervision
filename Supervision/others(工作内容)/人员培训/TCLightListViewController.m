//
//  TCLightListViewController.m
//  linli
//
//  Created by 黄琦 on 2019/12/31.
//  Copyright © 2019 ThinkingCollision. All rights reserved.
//

#import "TCLightListViewController.h"

//#import "TCGoodsDetailViewController.h"

//#import "TCMallModel.h"

#import "MJRefresh.h"

@interface TCLightListViewController ()
<UITableViewDelegate,
UITableViewDataSource,
UITextFieldDelegate>{
    UIButton *currentBtn;
    UIButton *currentIndexBtn;
}

@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *menListArr;
@property (nonatomic, strong) UIView *searchView;

@property (nonatomic, strong) NSMutableArray *dataSourceArr;

@property (nonatomic, assign) int page;

@property (nonatomic, strong) UITextField *searchTextField;

@property (nonatomic, strong) UIScrollView *leftScrollView;

@property (nonatomic, strong) UIView *alittleOrangeView;

@property (nonatomic, copy) NSString *goods_category_id;

@property (nonatomic, copy) NSString *field;

@property (nonatomic, copy) NSString *keyword;

@property (nonatomic, assign) NSInteger selectIndex;
@end

@implementation TCLightListViewController

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar addSubview:self.searchView];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [self.searchView removeFromSuperview];
}

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
    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self loadMore];
    }];
    
//    if (KAllGoodsStyle == _mallCategoryStyle) {
//
//        [HttpRequestTool wingCategorySuccessBlock:^(id RequestObject) {
//            self.menListArr = [TCGoodsCategoryListModel mj_objectArrayWithKeyValuesArray:RequestObject];
//            [self initView];
//        } failureBlock:^(id err) {
//
//        }];
//    }else{
//        [HttpRequestTool lightCategory:[NSString stringWithFormat:@"%lu",(unsigned long)_mallCategoryStyle]
//                          successBlock:^(id RequestObject) {
//            self.menListArr = [TCGoodsCategoryListModel mj_objectArrayWithKeyValuesArray:RequestObject];
//            [self initView];
//
//        } failureBlock:^(id err) {
//
//        }];
//    }
   
}

- (void)initView{
    
    
    
    _selectIndex = 0;
    _keyword = @"";
    [self.leftView setBackgroundColor:RGB(247, 247, 247)];
    
    [self.leftView addSubview:self.leftScrollView];
    
    
}

- (UIView *)searchView{
    
    if (!_searchView) {
        
        _searchView = [[UIView alloc]initWithFrame:CGRectMake(45.5,7, SCREEN_WIDTH - 54, 30)];
        _searchView.backgroundColor = RGB(247, 247, 247);
        _searchView.layer.cornerRadius = 15.0f;
        _searchView.layer.masksToBounds = YES;
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 7.5, 15, 15)];
        imageView.image = [UIImage imageNamed:@"black_search"];
        
        [_searchView addSubview:imageView];
        
        _searchTextField = [[UITextField alloc]initWithFrame:CGRectMake(imageView.right + 10,0, SCREEN_WIDTH - 90, 30)];
        _searchTextField.delegate = self;
        _searchTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"搜索商品" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:SubTextColor}];
        _searchTextField.returnKeyType = UIReturnKeySearch;
        
        [_searchTextField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
        
        [_searchView addSubview:_searchTextField];
    }
    
    return _searchView;
}

- (void)updateUI{
    
    self.page = 1;
    [self.dataSourceArr removeAllObjects];
    
    switch (_selectIndex) {
        case 0:
        {
            _field = @"";
            
        }
            break;
        case 1:
        {
            _field = @"price";
            
        }
            break;
        case 2:
        {    _field = @"sales";
            
            
        }
            break;
        default:
            break;
    }
    [self loadMore];

}

- (void)loadMore{
    
    if (KAllGoodsStyle == _mallCategoryStyle) {
        
//        [HttpRequestTool serviceWingList:[NSString stringWithFormat:@"%d",_page]
//                       goods_category_id:_goods_category_id
//                                   field:_field
//                                 keyword:_keyword
//                            community_id:[TCUserDefaults communityID]
//                            successBlock:^(id RequestObject) {
//
//            [self.tableView.mj_footer endRefreshing];
//
//            NSArray *arr = [TCMallItem mj_objectArrayWithKeyValuesArray:RequestObject];
//            [self.dataSourceArr addObjectsFromArray:arr];
//
//            if (arr.count == 10) {
//                self.page ++;
//            }else{
//                [self.tableView.mj_footer endRefreshingWithNoMoreData];
//            }
//
//            [self.tableView reloadData];
//        } failureBlock:^(id err) {
//            [self.tableView.mj_footer endRefreshingWithNoMoreData];
//
//        }];
//    }else{
//        [HttpRequestTool lightGoods:[NSString stringWithFormat:@"%d",_page]
//                                pid:[NSString stringWithFormat:@"%lu",(unsigned long)_mallCategoryStyle]
//                  goods_category_id:_goods_category_id
//                              field:_field
//                            keyword:_keyword
//                       community_id:[TCUserDefaults communityID]
//                       successBlock:^(id RequestObject) {
//
//            [self.tableView.mj_footer endRefreshing];
//
//            NSArray *arr = [TCMallItem mj_objectArrayWithKeyValuesArray:RequestObject];
//            [self.dataSourceArr addObjectsFromArray:arr];
//
//            if (arr.count == 10) {
//                self.page ++;
//            }else{
//                [self.tableView.mj_footer endRefreshingWithNoMoreData];
//            }
//
//            [self.tableView reloadData];
//        } failureBlock:^(id err) {
//            [self.tableView.mj_footer endRefreshingWithNoMoreData];
//
//        }];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (self.dataSourceArr.count == 0) {
        return 1;
    }else{

        return _dataSourceArr.count;
        
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.dataSourceArr.count == 0) {
        return _tableView.height;
    }else{

        return 103.0f;
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 42.0f;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.0001f;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 88, 40)];
    
//    for (int i = 0; i < 3; i ++) {
//        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(view.width/3*i, 5, view.width/3, 30)];
//        [btn setTitleColor:TitleColor forState:UIControlStateNormal];
//        [btn setTitleColor:RedColor forState:UIControlStateSelected];
//        [btn.titleLabel setFont:[UIFont systemFontOfSize:13.0f]];
//        NSString *title;
//        switch (i) {
//            case 0:
//            {
//                title = @"综合排序";
//            }
//                break;
//            case 1:
//            {
//                title = @"按价格";
//
//            }
//                break;
//            case 2:
//            {
//                title = @"按销量";
//
//            }
//                break;
//            default:
//                break;
//        }
//
//        [btn setTitle:title forState:UIControlStateNormal];
//
//        btn.tag = i;
//        if (_selectIndex == i) {
//            currentIndexBtn = btn;
//            btn.selected = YES;
//        }
//
//        [btn addTarget:self action:@selector(selectIndex:) forControlEvents:UIControlEventTouchUpInside];
//        [view addSubview:btn];
//    }
    
    
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(14, 39.5, view.width - 16, 0.5);
    layer.backgroundColor = LineColor;
    
    [view.layer addSublayer:layer];
    
    return view;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return [[UIView alloc]init];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *identifier = @"LightListCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        cell.accessoryType   = UITableViewCellAccessoryNone;
        cell.selectionStyle  = UITableViewCellSelectionStyleNone;
        
        
    }else{
        [cell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    if (self.dataSourceArr.count == 0) {
        cell.backgroundColor = [UIColor whiteColor];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((_tableView.width - 200)/2, 40, 200, 125)];
        imageView.image = [UIImage imageNamed:@"无商品"];
        [cell addSubview:imageView];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(imageView.left, imageView.bottom + 20, imageView.width, 40.0f)];
        label.text = @"无相关商品";
        label.textColor = SubTextColor;
        label.font = [UIFont systemFontOfSize:16.0f];
        label.numberOfLines = 0;
        label.textAlignment = NSTextAlignmentCenter;
        
        [cell addSubview:label];
    }else{
        cell.backgroundColor = RGB(247, 247, 247);

//        TCMallItem *item = [TCMallItem mj_objectWithKeyValues:[self.dataSourceArr safeObjectAtIndex:indexPath.row]];
//        [self loadCell:cell andIndexPath:indexPath item:item];

    }
    

    return cell;
    
}

- (void)loadCell:(UITableViewCell *)cell andIndexPath:(NSIndexPath *)indexPath {

    UIView *view = [cell viewWithTag:1000];
    
    if (!view) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 88, 103)];
        view.tag = 1000;
        view.backgroundColor = RGB(255, 255, 255);
        [cell addSubview:view];
        
        
    }
    
    UIImageView *imageView = [view viewWithTag:1001];
    if (!imageView) {
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(8.5, 6.5, 90, 90)];
        imageView.tag = 1001;
        imageView.layer.cornerRadius = 2.0f;
        imageView.layer.masksToBounds = YES;
        [view addSubview:imageView];
    }
    
    
    UILabel *nameLab = [view viewWithTag:1002];
    if (!nameLab) {
        nameLab = [[UILabel alloc]initWithFrame:CGRectMake(imageView.right + 12.5, 0, (view.width - imageView.right - 25), 40)];
        nameLab.tag = 1002;
        nameLab.textColor = TextColor;
        nameLab.font = [UIFont boldSystemFontOfSize:16.0f];
        nameLab.numberOfLines = 0;
        [view addSubview:nameLab];
        
    }
    
    UILabel *detailLab = [view viewWithTag:1003];
    if (!detailLab) {
        detailLab = [[UILabel alloc]initWithFrame:CGRectMake(imageView.right + 12.5, nameLab.bottom, (view.width - imageView.right - 25 ), 30)];
        detailLab.tag = 1003;
        detailLab.numberOfLines = 0;
        detailLab.textColor = SubTextColor;
        detailLab.font = [UIFont systemFontOfSize:12.0f];
        [view addSubview:detailLab];
    }
    
    UILabel *priceLab = [view viewWithTag:1005];
    if (!priceLab) {
        priceLab = [[UILabel alloc]initWithFrame:CGRectMake(imageView.right + 12.5, detailLab.bottom + 10, 100, 18.5f)];
        priceLab.tag = 1005;
        priceLab.textColor = [UIColor redColor];
        priceLab.font = [UIFont boldSystemFontOfSize:18.5f];
        [view addSubview:priceLab];
    }
    
    
    UIButton *addBtn = [view viewWithTag:2000 + indexPath.row];
    if (!addBtn) {
        for (UIView *subView in view.subviews) {
            if ([subView isKindOfClass:[UIButton class]]) {
                [subView removeFromSuperview];
            }
        }
        
        addBtn = [[UIButton alloc]initWithFrame:CGRectMake(view.width - 36, 69, 21, 21)];
        addBtn.tag = 2000 + indexPath.row;
        [addBtn setImage:[UIImage imageNamed:@"buy"] forState:UIControlStateNormal];
        [addBtn addTarget:self action:@selector(addBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [view addSubview:addBtn];
    }
    
    
//    [imageView setImageWithURL: [NSURL URLWithString:item.image]];
//    nameLab.text = item.goods_name;
//    detailLab.text = item.goods_info;
//
//    priceLab.text = [NSString stringWithFormat:@"￥%.2f",item.price.floatValue];

    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]initWithString:priceLab.text];
    
    [attrString addAttribute:NSFontAttributeName
                       value:[UIFont systemFontOfSize:12.0f]
                       range:NSMakeRange(0, 1)];
    
    NSString *lastStr;
    NSString *firstStr;
    
    if ([priceLab.text containsString:@"."]) {
        NSRange range = [priceLab.text rangeOfString:@"."];
        lastStr = [priceLab.text substringFromIndex:range.location];
        firstStr = [priceLab.text substringToIndex:range.location];
    }
    
    [attrString addAttribute:NSFontAttributeName
                       value:[UIFont systemFontOfSize:12.5]
                       range:NSMakeRange(firstStr.length, lastStr.length)];
    
    priceLab.attributedText = attrString;

    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_dataSourceArr.count > 0) {
//        TCMallItem *item = [TCMallItem mj_objectWithKeyValues:[self.dataSourceArr safeObjectAtIndex:indexPath.row]];
//        [self checkGoodsDetail:item];
    }
    
}

//- (void)checkGoodsDetail:(TCMallItem *)item{
//
//    TCGoodsDetailViewController *VC = [[TCGoodsDetailViewController alloc]init];
//    VC.goodsID = item.goods_id;
//
//    [self.navigationController pushViewController:VC animated:YES];
//}


- (void)textFieldChanged:(UITextField *)textField{
    
    if (textField.text.length == 0) {
        _keyword = @"";
    }else{
        _keyword = textField.text;
 
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.searchTextField endEditing:YES];
    [self updateUI];
    return YES;
}


- (NSMutableArray *)dataSourceArr{
    
    if (!_dataSourceArr) {
        _dataSourceArr = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _dataSourceArr;
}

- (UIScrollView *)leftScrollView{
    
    if (!_leftScrollView) {
        _leftScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 88, self.leftView.height)];
        
        _leftScrollView.delegate = self;
        
        //能否滚动
        _leftScrollView.scrollEnabled = YES;
        
        //弹簧效果 NO
        _leftScrollView.bounces = NO;
        
        //滚动视图的起始偏移量
        _leftScrollView.contentOffset = CGPointMake(0, 0);
        
        //垂直滚动条
        _leftScrollView.showsVerticalScrollIndicator = NO;
        
        //水平滚动条
        _leftScrollView.showsHorizontalScrollIndicator = NO;
        
        _leftScrollView.contentSize = CGSizeMake(0, 50.0f *_menListArr.count);
        
        
        for (int i = 0 ; i < _menListArr.count; i ++) {
            
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, i*50, _leftScrollView.width, 50)];
//            [btn setTitleColor:TitleColor forState:UIControlStateNormal];
            [btn setTitleColor:TextColor forState:UIControlStateSelected];
            [btn.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
            btn.titleLabel.numberOfLines = 0;
            btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            [btn setBackgroundColor:RGB(247, 247, 247)];
            
//            TCGoodsCategoryListModel *model = [_menListArr safeObjectAtIndex:i];
//            [btn setTitle:[NSString stringWithFormat:@"%@",model.name] forState:UIControlStateNormal];
            
            btn.tag = i;
            
            if (0 == i) {
                [self selectedCategory:btn];
                
            }
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];

            
            [btn addTarget:self action:@selector(selectedCategory:) forControlEvents:UIControlEventTouchUpInside];
            [_leftScrollView addSubview:btn];
        }
        
    }
    
    return _leftScrollView;
}

- (void)selectedCategory:(UIButton *)sender{
    
    [_leftView bringSubviewToFront:self.alittleOrangeView];
    
    
    
    if (currentBtn != sender) {
        sender.selected = YES;
        [sender.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
        [sender setBackgroundColor:[UIColor whiteColor]];
        
        
        [self.alittleOrangeView removeFromSuperview];
        
        [sender addSubview:self.alittleOrangeView];
        
        self.alittleOrangeView.frame = CGRectMake(0,17.5 , 4 ,15);
        
        
        currentBtn.selected = NO;
        [currentBtn.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [currentBtn setBackgroundColor:RGB(247, 247, 247)];
        
        currentBtn = sender;
        
//        TCGoodsCategoryListModel *model = [_menListArr safeObjectAtIndex:sender.tag];
//
//        _goods_category_id = model.goods_category_id;
        
        [self updateUI];
    }
    
}

- (UIView *)alittleOrangeView{
    
    if (!_alittleOrangeView) {
        _alittleOrangeView = [[UIView alloc] init];
        _alittleOrangeView.backgroundColor = [UIColor redColor];
        
    }
    return _alittleOrangeView;
}

- (void)selectIndex:(UIButton *)sender{
    
    if (currentIndexBtn != sender) {
        currentIndexBtn.selected = !currentIndexBtn.selected;
        sender.selected = !sender.selected;
        currentIndexBtn = sender;
        
        _selectIndex = sender.tag;
        [self updateUI];
    }
    
}

@end
