//
//  toQualificationsTableViewCell.h
//  Supervision
//
//  Created by 龙成 on 2020/6/15.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol toQualificationsTableViewCellDelegate <NSObject>

- (void)didClicktoQualifications;

@end
@interface toQualificationsTableViewCell : UITableViewCell
@property (nonatomic, weak) id <toQualificationsTableViewCellDelegate > delegate;

-(void)setlab1:(NSString *)lab1
          lab2:(NSString *)lab2
          lab3:(NSString *)lab3
          lab4:(NSString *)lab4
         lab1S:(NSString *)lab1S
        imaget:(NSString *)imaget;


-(void)setlab1xxx:(NSString *)lab1
             lab2:(NSString *)lab2
             lab3:(NSString *)lab3
             lab4:(NSString *)lab4
            lab1S:(NSString *)lab1S
           imaget:(NSString *)imaget;


@end

NS_ASSUME_NONNULL_END
