//
//  TtoubiaoTableViewCell.h
//  Supervision
//
//  Created by 龙成 on 2020/6/21.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TtoubiaoTableViewCell : UITableViewCell
-(void)setpersonName:(NSString *)personName
            certName:(NSString *)certName
          unlockTime:(NSString *)unlockTime
         projectName:(NSString *)projectName;
@end

NS_ASSUME_NONNULL_END
