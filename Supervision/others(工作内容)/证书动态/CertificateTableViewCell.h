//
//  CertificateTableViewCell.h
//  Supervision
//
//  Created by 龙成 on 2020/6/12.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol CertificateTableViewCellDelegate <NSObject>

- (void)didClicktagIndex:(NSInteger)Sindex;

@end
@interface CertificateTableViewCell : UITableViewCell
@property (nonatomic, weak) id <CertificateTableViewCellDelegate > delegate;

-(void)setborrower:(NSString *)borrower
     borrowerPhone:(NSString *)borrowerPhone
         applyTime:(NSString *)applyTime
        returnTime:(NSString *)returnTime
         useRemark:(NSString *)useRemark
          tagIndex:(NSInteger)tagIndex
        ishightArr:(NSMutableArray *)ishightArr
          tableArr:(NSArray *)tableArr;

@end

NS_ASSUME_NONNULL_END
