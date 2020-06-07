//
//  NSMutableArray+safaMutableArray.m
//  anyoufang
//
//  Created by 龙成 on 2019/4/17.
//  Copyright © 2019 Supervision. All rights reserved.
//

#import "NSMutableArray+safaMutableArray.h"

@implementation NSMutableArray (safaMutableArray)

- (id)safeObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        return nil;
    } else {
        return [self objectAtIndex:index];
    }
}

@end
