//
//  CTUserDefaults.m
//  Supervision
//
//  Created by 龙成 on 2018/8/23.
//  Copyright © 2018年 Supervision. All rights reserved.
//

#import "CTUserDefaults.h"

NSString *const KToken = @"token";
NSString *const KIsLogin = @"isLogin";
NSString *const KUserName = @"username";
NSString *const KRule = @"rule";
NSString *const KAPPStartTime = @"startTime";
NSString *const KCityID = @"cityID";
NSString *const KCityName = @"cityName";
NSString *const KSearchHistory = @"searchHistory";
NSString *const KIsAsk = @"isAsk";

@implementation CTUserDefaults

+ (NSString *)token{
    
    return [self getObjectForKey:KToken];
}


+ (void)setToken:(NSString *)token{
    [self setValue:token forKey:KToken];
}

+ (NSString *)Rule{
    return [self getObjectForKey:KRule];
}

+ (void)setRule:(NSString *)rule{
    [self setValue:rule forKey:KRule];
}

+ (NSString *)userName{
    return [self getObjectForKey:KUserName];
}

+ (void)setUserName:(NSString *)userName{
    [self setValue:userName forKey:KUserName];
}

+ (BOOL)isLoginSuccess{
    
    BOOL islogin = [[self getObjectForKey:KIsLogin] boolValue];
    
    return islogin;
}

+ (void)setIsLogonSuccess:(BOOL )isLoginSuccess{
    
    [self setValue:[NSNumber numberWithBool:isLoginSuccess] forKey:KIsLogin];
}

+ (NSString *)appStartTime{
    
    return [self getObjectForKey:KAPPStartTime];
}

+ (void)setAppStartTime:(NSString *)time{
    
    [self setValue:time forKey:KAPPStartTime];
}

+ (NSString *)cityID{
    
    return [self getObjectForKey:KCityID];
}

+ (void)setCityID:(NSString *)cityID{
    
    [self setValue:cityID forKey:KCityID];
}

+ (NSString *)cityName{
    
    return [self getObjectForKey:KCityName];
}

+ (void)setCityName:(NSString *)cityName{
    
    [self setValue:cityName forKey:KCityName];
}


+ (NSMutableArray *)searchHistoryArray{
    return [self getObjectForKey:KSearchHistory];
}

+ (void)setSearchHistoryArray:(NSMutableArray *)searchHistoryArray{
    [self setValue:searchHistoryArray forKey:KSearchHistory];
}

+ (NSString *)isAsk{
    
    return [self getObjectForKey:KIsAsk];

}

+ (void)setIsAsk:(NSString *)isAsk{
    [self setValue:isAsk forKey:KIsAsk];
}

#pragma mark - mod
+ (void)setValue:(id)value forKey:(NSString *)key{
    
    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    //防止崩溃
    if (!value) {
        value = @"";
    }
    [userDefault setObject:value forKey:key];
    
    [userDefault synchronize];
}

+ (id)getObjectForKey:(NSString *)key{
    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    id value = [userDefault objectForKey:key];
    return  value;
}

@end
