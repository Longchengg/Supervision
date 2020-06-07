//
//  NSMutableDictionary+CTSafeDict.h
//  Supervision
//
//  Created by 龙成 on 2018/11/7.
//  Copyright © 2018 Supervision. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableDictionary (CTSafeDict)

- (void)safeObject:(id)value forKey:(NSString *)key;

@end

