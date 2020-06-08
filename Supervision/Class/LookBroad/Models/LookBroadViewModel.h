//
//  LookBroadViewModel.h
//  Supervision
//
//  Created by 龙成 on 2020/6/8.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LookBroadViewModel : NSObject

@property (nonatomic, copy) NSString *alertCount;

@property (nonatomic, copy) NSString *bidEnoughAlertMessage;

@property (nonatomic, copy) NSDictionary *calock;

@property (nonatomic, copy) NSDictionary *comSafetyLicenseDTO;

@property (nonatomic, copy) NSDictionary *companyLicenseDTO;

@property (nonatomic, copy) NSString *expiredCount;

@property (nonatomic, copy) NSDictionary *fourlib;

@property (nonatomic, copy) NSString *personCertAlertMessage;

@property (nonatomic, copy) NSString *serviceTimeAlertMessage;

@end

NS_ASSUME_NONNULL_END
