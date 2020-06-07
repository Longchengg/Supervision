//
//  NSMutableDictionary+CTSafeDict.m
//  Supervision
//
//  Created by 龙成 on 2018/11/7.
//  Copyright © 2018 Supervision. All rights reserved.
//

#import "NSMutableDictionary+CTSafeDict.h"

@implementation NSMutableDictionary (CTSafeDict)

- (void)safeObject:(id)value forKey:(NSString *)key{
    
    BOOL isNull = [value isEqual:[NSNull null]];
    
    if (isNull || value == nil) {
//        value = @"";
        return;
    }
    [self setValue:value forKey:key];
}

@end
