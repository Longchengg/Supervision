//
//  QualificationsModel.h
//  Supervision
//
//  Created by 龙成 on 2020/6/15.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QualificationsModel : NSObject
@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *licenseCategory;

@property (nonatomic, copy) NSString *signTime;

@property (nonatomic, copy) NSString *validTime;

@property (nonatomic, copy) NSString *licenseContainNames;

@property (nonatomic, copy) NSDictionary *alertStatus;

@property (nonatomic, copy) NSString *backStatus;

@property (nonatomic, copy) NSString *backStatusStr;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *licenseCode;

@property (nonatomic, copy) NSString *signOrgan;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *scopeDesc;

@property (nonatomic, copy) NSString *safetyLicenseCode;

@property (nonatomic, copy) NSString *certificateName;

@property (nonatomic, copy) NSString *buyTime;

@property (nonatomic, copy) NSString *regions;

@property (nonatomic, copy) NSString *certificateCategory;
//证书管理
@property (nonatomic, copy) NSString *certName;

@property (nonatomic, copy) NSString *certCode;

@property (nonatomic, copy) NSString *certValidTime;

@property (nonatomic, copy) NSString *safetyCert;

@property (nonatomic, copy) NSString *socialSecurityStart;

@property (nonatomic, copy) NSString *socialSecurityEnd;

@property (nonatomic, copy) NSArray *professionList; //  professionName  //alertStatus  //status   desc

@property (nonatomic, copy) NSString *lockStatus;

@property (nonatomic, copy) NSString *lockStatusDesc;










//
//[cell setlab1:_dataSourceArr[index][@"level"] lab2:_dataSourceArr[index][@"licenseCategory"] lab3:_dataSourceArr[index][@"validTime"] lab4:_dataSourceArr[index][@"licenseContainNames"] btn1:_dataSourceArr[index][@""] btn2:_dataSourceArr[index][@"backStatusStr"]];


@end

NS_ASSUME_NONNULL_END
