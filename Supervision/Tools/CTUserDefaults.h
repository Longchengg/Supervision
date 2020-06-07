//
//  CTUserDefaults.h
//  Supervision
//
//  Created by 龙成 on 2018/8/23.
//  Copyright © 2018年 Supervision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTUserDefaults : NSObject

+ (NSString *)token;
+ (void)setToken:(NSString *)token;

+ (BOOL)isLoginSuccess;
+ (void)setIsLogonSuccess:(BOOL )isLoginSuccess;

+ (NSString *)userName;
+ (void)setUserName:(NSString *)userName;

+ (NSString *)Rule;
+ (void)setRule:(NSString *)rule;

+ (NSString *)appStartTime;
+ (void)setAppStartTime:(NSString *)time;

+ (NSString *)cityID;
+ (void)setCityID:(NSString *)cityID;


+ (NSString *)cityName;
+ (void)setCityName:(NSString *)cityName;

+ (NSMutableArray *)searchHistoryArray;
+ (void)setSearchHistoryArray:(NSMutableArray *)searchHistoryArray;

+ (NSString *)isAsk;
+ (void)setIsAsk:(NSString *)isAsk;
@end
