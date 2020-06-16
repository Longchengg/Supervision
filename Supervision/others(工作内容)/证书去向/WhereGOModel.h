//
//  WhereGOModel.h
//  Supervision
//
//  Created by 龙成 on 2020/6/15.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WhereGOModel : NSObject
@property (nonatomic, copy) NSString *applyTime;

@property (nonatomic, copy) NSString *borrower;

@property (nonatomic, copy) NSString *useRemark;

@property (nonatomic, copy) NSArray *certList;
//returnStatus

@end

NS_ASSUME_NONNULL_END
