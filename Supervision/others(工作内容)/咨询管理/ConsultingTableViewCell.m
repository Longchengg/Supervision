//
//  ConsultingTableViewCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/11.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "ConsultingTableViewCell.h"

#import "ConsultingCollectionViewCell.h"
#import "ConsultingModel.h"
@interface ConsultingTableViewCell()
<UICollectionViewDelegate,UICollectionViewDataSource>{
    
    NSInteger currentIndex ;
}

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;
@property (nonatomic, strong) ConsultingModel *consultingModel;



@end

@implementation ConsultingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [UIButton LeftImageToRight:_moreBtn];
    
    currentIndex = 0;
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(140, 230);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 3;
    _collectionView.collectionViewLayout = layout;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.scrollsToTop = NO;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView registerNib:[UINib nibWithNibName:@"ConsultingCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ConsultingCollectionViewCell"];
}
-(void)setDataSource:(NSArray *)dataSource{
    _dataSource = dataSource;
    if (_dataSource) {
        [_collectionView reloadData];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = (long)indexPath.row;

    ConsultingCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ConsultingCollectionViewCell" forIndexPath:indexPath];
    [cell setTodataSource:_dataSource indexTag:index isShowImg:currentIndex != index ? YES : NO];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.row;
    if (currentIndex != indexPath.row) {
        currentIndex = indexPath.row;
        [_collectionView reloadData];
    }
    _consultingModel = [ConsultingModel mj_objectWithKeyValues:_dataSource[index]];
    //发送通知
    NSDictionary *dict = @{@"personID":_consultingModel.personId};
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"personDetail" object:nil userInfo:dict]];
    
}
- (IBAction)didMoreClick:(id)sender {
    if ([_delegate respondsToSelector:@selector(didClickConsultingRow)]) {
          
          [_delegate didClickConsultingRow];
      }
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    
    
}

@end
