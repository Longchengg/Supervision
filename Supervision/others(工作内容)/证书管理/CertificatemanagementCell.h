//
//  CertificatemanagementCell.h
//  Supervision
//
//  Created by 龙成 on 2020/6/16.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CertificatemanagementCell : UITableViewCell

-(void)setCell:(NSString *)personName
      certName:(NSString *)certName
    safetyCert:(NSString *)safetyCert
    backStatus:(NSString *)backStatus
    lockStatus:(NSString *)lockStatus
professionList:(NSArray *)professionList
     cellIndex:(NSInteger)cellIndex;

@end

NS_ASSUME_NONNULL_END
