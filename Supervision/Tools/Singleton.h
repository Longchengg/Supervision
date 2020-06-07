//
//  Singleton.h
//  Supervision
//
//  Created by 龙成 on 2018/8/23.
//  Copyright © 2018年 Supervision. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Singleton : NSObject

+ (instancetype)shareInstance;

@property (nonatomic, copy) NSString *token;


@end
