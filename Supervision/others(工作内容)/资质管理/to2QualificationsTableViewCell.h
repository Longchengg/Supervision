//
//  to2QualificationsTableViewCell.h
//  Supervision
//
//  Created by 龙成 on 2020/6/15.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface to2QualificationsTableViewCell : UITableViewCell
//资质管理VC
-(void)setLal:(NSString *)Llab zzRlabe:(NSString *)zzRlab;
//证书VC
-(void)setLalz:(NSString *)Llab zzRlabe:(NSDictionary *)zzRlab;

@end

NS_ASSUME_NONNULL_END
