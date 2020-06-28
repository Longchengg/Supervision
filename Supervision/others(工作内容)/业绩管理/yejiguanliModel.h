//
//  yejiguanliModel.h
//  Supervision
//
//  Created by 龙成 on 2020/6/17.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface yejiguanliModel : NSObject

@property (nonatomic, copy) NSString *projectName;
//1在建 2已竣工
@property (nonatomic, copy) NSString *buildStatus;

@property (nonatomic, copy) NSString *categoryName;

@property (nonatomic, copy) NSString *bidAmount;

@property (nonatomic, copy) NSString *startTime;

@property (nonatomic, copy) NSString *completeTime;

@property (nonatomic, copy) NSArray *smallComPerformancePersonDTOS;
@end

@interface yejiguanliItem : NSObject

@property (nonatomic, copy) NSString *certName;

@property (nonatomic, copy) NSString *personName;

@end

NS_ASSUME_NONNULL_END
