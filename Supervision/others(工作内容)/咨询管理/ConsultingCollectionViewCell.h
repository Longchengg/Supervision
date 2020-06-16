//
//  ConsultingCollectionViewCell.h
//  Supervision
//
//  Created by 龙成 on 2020/6/11.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol ConsultingCollectionViewCellDelegate <NSObject>

- (void)didClickConsultingRow:(NSInteger )index;


@end
@interface ConsultingCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) id <ConsultingCollectionViewCellDelegate > delegate;

//
-(void)setConsuItemNameTextL:(NSString *)NameTextL
                    ContextL:(NSString *)ContextL
                   timeTextL:(NSString *)timeTextL
                  stausTextL:(NSString *)stausTextL
                   downTextL:(NSString *)downTextL
                    indexTag:(NSInteger)indexTag;

-(void)setTodataSource:(NSArray *)TodataSource
              indexTag:(NSInteger)indexTag
             isShowImg:(BOOL )isShow;


@end

NS_ASSUME_NONNULL_END
