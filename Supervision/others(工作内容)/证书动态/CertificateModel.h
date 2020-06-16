//
//  CertificateModel.h
//  Supervision
//
//  Created by 龙成 on 2020/6/12.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CertificateModel : NSObject

@property (nonatomic, copy) NSString *borrower;

@property (nonatomic, copy) NSString *borrowerPhone;

@property (nonatomic, copy) NSString *applyTime;

@property (nonatomic, copy) NSString *returnTime;

@property (nonatomic, copy) NSString *useRemark;

@property (nonatomic, copy) NSArray *certList;

@end

@interface CertificateItem : NSObject

@property (nonatomic, copy) NSString *displayCertName;

/// 0空闲 1预借中 2借出
@property (nonatomic, copy) NSString *returnStatus;

/// 0不显示 1预借中
@property (nonatomic, assign)BOOL isHight;

@end

NS_ASSUME_NONNULL_END
