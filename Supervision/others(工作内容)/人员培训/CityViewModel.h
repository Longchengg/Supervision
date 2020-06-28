//
//  CityViewModel.h
//  Supervision
//
//  Created by 龙成 on 2020/6/17.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CityViewModel : NSObject

@property (nonatomic, copy) NSString *trainingName;

@property (nonatomic, copy) NSString *registerStart;

@property (nonatomic, copy) NSString *registerEnd;

@property (nonatomic, copy) NSString *trainingTypeDesc;

@property (nonatomic, copy) NSString *trainingPlace;

@property (nonatomic, copy) NSString *trainingFeeOne;

//报名状态(数值型)0:待报名, 1:已报名, 2:已结束, 3:已考试
@property (nonatomic, copy) NSString *registerStatus;

@property (nonatomic, copy) NSString *registerStatusDesc;

@property (nonatomic, copy) NSString *personNumber;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *trainingOrgan;

@property (nonatomic, copy) NSString *trainingStart;

@property (nonatomic, copy) NSString *trainingEnd;

@property (nonatomic, copy) NSString *examStart;

@property (nonatomic, copy) NSString *examEnd;

@property (nonatomic, copy) NSString *trainingFeeTotal;

@property (nonatomic, copy) NSArray *personExtList;

@property (nonatomic, copy) NSArray *personList;

@end

@interface CityViewModel_personList : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *idCard;

@property (nonatomic, copy) NSString *certCount;

@end

@interface CityViewModel_personExtList: NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *idCard;

@property (nonatomic, copy) NSString *certCount;

@end
NS_ASSUME_NONNULL_END
