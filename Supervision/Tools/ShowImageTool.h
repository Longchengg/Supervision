//
//  ShowImageTool.h
//  cjbapp
//
//  Created by 龙成 on 2020/3/30.
//  Copyright © 2020 cjbapp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShowImageTool : NSObject

+ (ShowImageTool *)shareClient;

/**
 浏览图片

 @param imageArr 图片数组
 @param index 下标
 */
- (void)showImage:(NSArray *)imageArr andIndex:(NSInteger )index;

@end

NS_ASSUME_NONNULL_END
