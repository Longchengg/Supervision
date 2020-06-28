//
//  yejiguanliTableViewCell.h
//  Supervision
//
//  Created by 龙成 on 2020/6/16.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol yejiguanliTableViewCellDelegate <NSObject>

- (void)didClicktagIndex:(NSInteger)Sindex;

@end
@interface yejiguanliTableViewCell : UITableViewCell
@property (nonatomic, weak) id <yejiguanliTableViewCellDelegate > delegate;

-(void)setnameT:(NSString *)nameT
         stateT:(NSString *)stateT
          contT:(NSString *)contT
         moneyT:(NSString *)moneyT
         startT:(NSString *)startT
           endT:(NSString *)endT
       tagIndex:(NSInteger)tagIndex
     ishightArr:(NSMutableArray *)ishightArr
       tableArr:(NSArray *)tableArr;
@end

NS_ASSUME_NONNULL_END
