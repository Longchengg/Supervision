//
//  ConsultingModel.h
//  Supervision
//
//  Created by 龙成 on 2020/6/11.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConsultingModel : NSObject

@property (nonatomic, copy) NSString *companyId;

@property (nonatomic, copy) NSString *companyName;

@property (nonatomic, copy) NSString *personId;

@property (nonatomic, copy) NSString *personName;
//companyId = 27;
//companyName = "\U91cd\U5e86\U67d0\U76d1\U7406\U6709\U9650\U516c\U53f8";
//personId = 63;
//personName = "\U68a7\U67ab";
@end

NS_ASSUME_NONNULL_END
