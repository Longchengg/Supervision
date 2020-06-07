//
//  NSMutableArray+safaMutableArray.h
//  anyoufang
//
//  Created by 龙成 on 2019/4/17.
//  Copyright © 2019 Supervision. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSMutableArray (safaMutableArray)
- (id)safeObjectAtIndex:(NSUInteger)index;
@end


