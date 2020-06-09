//
//  HomeInformationSelectionCell.m
//  Supervision
//
//  Created by 龙成 on 2020/6/7.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "HomeInformationSelectionCell.h"

#import "InformationSelectionItem.h"

@interface HomeInformationSelectionCell()
<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;

@end

@implementation HomeInformationSelectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [UIButton LeftImageToRight:_moreBtn];
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(271, 108);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 3;
    _collectionView.collectionViewLayout = layout;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.scrollsToTop = NO;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView registerNib:[UINib nibWithNibName:@"InformationSelectionItem" bundle:nil] forCellWithReuseIdentifier:@"InformationSelectionItem"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    InformationSelectionItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"InformationSelectionItem" forIndexPath:indexPath];
    
    return cell;
    
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
