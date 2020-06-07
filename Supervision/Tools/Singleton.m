//
//  Singleton.m
//  Supervision
//
//  Created by 龙成 on 2018/8/23.
//  Copyright © 2018年 Supervision. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

static Singleton *singleton = nil;

+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[Singleton alloc]init];
    });
    return singleton;
}

@end
