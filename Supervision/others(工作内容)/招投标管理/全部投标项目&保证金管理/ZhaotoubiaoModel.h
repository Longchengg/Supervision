//
//  ZhaotoubiaoModel.h
//  Supervision
//
//  Created by 龙成 on 2020/6/18.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZhaotoubiaoModel : NSObject

@property (nonatomic, copy) NSString *projectName;
// 0:待报名, 1:待投标, 2:待交保证金 3:待开标 4 已中标,5 未中标
@property (nonatomic, copy) NSString *bidStatus;

@property (nonatomic, copy) NSString *bidCategoryName;

@property (nonatomic, copy) NSString *projectPlace;

@property (nonatomic, copy) NSString *registerStart;

@property (nonatomic, copy) NSString *registerEnd;

@property (nonatomic, copy) NSString *bidStart;


//@property (nonatomic, copy) NSString *projectName;

@property (nonatomic, copy) NSString *marginStatus;

@property (nonatomic, copy) NSString *marginFee;

//@property (nonatomic, copy) NSString *projectPlace;

@property (nonatomic, copy) NSString *operatorName;

@property (nonatomic, copy) NSString *operatorPhone;

@property (nonatomic, copy) NSString *marginEnd;

@property (nonatomic, copy) NSString *bidPlace;

@property (nonatomic, copy) NSArray *bidPersonDTOList;

@end
@interface ZhaotoubiaoItem : NSObject

@property (nonatomic, copy) NSString *certName;

@property (nonatomic, copy) NSString *personName;

@end
NS_ASSUME_NONNULL_END
