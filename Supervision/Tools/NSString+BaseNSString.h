//
//  NSString+BaseNSString.h
//  Supervision
//
//  Created by 龙成 on 2020/5/21.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (BaseNSString)

/**
 计算文字高度
 
 @param value 文字内容
 @param fontSize 字体大小
 @param width 宽度
 @return 高度
 */
+ (CGFloat) heightForString:(NSString *)value fontSize:(CGFloat)fontSize andWidth:(CGFloat)width;

/**
 计算文字宽度
 
 @param value 文字内容
 @param fontSize 字体大小
 @param hight 高度
 @return 宽度
 */
+ (CGFloat) widthForString:(NSString *)value fontSize:(CGFloat)fontSize andHight:(CGFloat)hight;


/// 计算文字宽度
/// @param value 文字内容
/// @param showFont 文本字体
/// @param hight 高度
+ (CGFloat) widthForString:(NSString *)value uifont:(UIFont *)showFont andHight:(CGFloat)hight;


@end

NS_ASSUME_NONNULL_END
