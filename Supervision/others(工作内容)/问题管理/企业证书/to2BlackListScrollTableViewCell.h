//
//  to2BlackListScrollTableViewCell.h
//  Supervision
//
//  Created by 龙成 on 2020/6/10.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface to2BlackListScrollTableViewCell : UITableViewCell
//企业证书
-(void)setprocessStatus:(NSString *)processStatus
                 label1:(NSString *)textStr1
                 label3:(NSString *)textStr3
                 label4:(NSString *)textStr4
                 label5:(NSString *)textStr5;
//职员证书
-(void)setprocessStatus1:(NSString *)processStatus
                 label1:(NSString *)textStr1
                 label3:(NSString *)textStr3
                 label4:(NSString *)textStr4
                 label5:(NSString *)textStr5;

@end

NS_ASSUME_NONNULL_END
