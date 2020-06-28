//
//  MessageMainModel.h
//  Supervision
//
//  Created by 龙成 on 2020/6/23.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageMainModel : NSObject
@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *updateTime;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *messageId;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) BOOL readFlag;


@end

NS_ASSUME_NONNULL_END
