//
//  tocertificatemanagementModel.h
//  Supervision
//
//  Created by 龙成 on 2020/6/16.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface tocertificatemanagementModel : NSObject

@property (nonatomic, copy) NSDictionary *alertStatus;

@property (nonatomic, copy) NSString *validTime;

@property (nonatomic, copy) NSString *professionId;

@property (nonatomic, copy) NSString *professionName;

@end

NS_ASSUME_NONNULL_END
