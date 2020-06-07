//
//  BackModel.h
//  Supervision
//
//  Created by 龙成 on 2020/5/18.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BackModel : NSObject

@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *errorCode;
@property (nonatomic, copy) NSString *errorMsg;

@property (nonatomic, copy) id wrapper;


@end

NS_ASSUME_NONNULL_END
