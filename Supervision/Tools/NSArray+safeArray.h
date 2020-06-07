//
//  NSArray+safeArray.h
//  Supervision
//
//  Created by 龙成 on 2019/4/1.
//  Copyright © 2019 Supervision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (safeArray)

- (id)safeObjectAtIndex:(NSUInteger)index;

+ (instancetype)safeArrayWithObject:(id)object;

- (NSArray *)safeSubarrayWithRange:(NSRange)range;

+ (NSMutableArray *)parseData:(NSDictionary *)dict;

@end


