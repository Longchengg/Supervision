//
//  CityViewModel.m
//  Supervision
//
//  Created by 龙成 on 2020/6/17.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "CityViewModel.h"

@implementation CityViewModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID": @"id"};
}
+ (NSDictionary *)mj_objectClassInArray{
    
    return @{@"personList" : [CityViewModel_personList class]};
}
+ (NSDictionary *)mj_objectClassInArray1{
    
    return @{@"personExtList" : [CityViewModel_personExtList class]};
}
@end
@implementation CityViewModel_personList

@end
@implementation CityViewModel_personExtList

@end
