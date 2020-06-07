//
//  NSArray+safeArray.m
//  Supervision
//
//  Created by 龙成 on 2019/4/1.
//  Copyright © 2019 Supervision. All rights reserved.
//

#import "NSArray+safeArray.h"

@implementation NSArray (safeArray)

- (id)safeObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        return nil;
    } else {
        return [self objectAtIndex:index];
    }
}

+ (instancetype)safeArrayWithObject:(id)object
{
    if (object == nil) {
        return [self array];
    } else {
        return [self arrayWithObject:object];
    }
}

- (NSArray *)safeSubarrayWithRange:(NSRange)range
{
    long location = range.location;
    long length = range.length;
    if (location<0 || length<0 || location+length>self.count) {
        return nil;
    } else {
        return [self subarrayWithRange:range];
    }
}

+ (NSArray *)parseData:(NSDictionary *)dict{
    
    if ([dict isKindOfClass:[NSNull class]]) {
        NSMutableArray *valueArray = [NSMutableArray array];
        return valueArray;
    }

    //将所有的key放进数组
    NSArray *allKeyArray = [dict allKeys];
    
    NSArray *afterSortKeyArray = [allKeyArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id _Nonnull obj2) {

        if ([obj1 intValue] > [obj2 intValue]) {
            return NSOrderedDescending;
        } else {
            return NSOrderedAscending;
        }
    }];
    
    //通过排列的key值获取value
    NSMutableArray *valueArray = [NSMutableArray array];
    for (NSString *sortsing in afterSortKeyArray) {
        id valueString = [dict objectForKey:sortsing];
        [valueArray addObject:valueString];
    }
    return valueArray;
}
@end
