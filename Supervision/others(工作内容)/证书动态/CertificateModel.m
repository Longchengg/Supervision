//
//  CertificateModel.m
//  Supervision
//
//  Created by 龙成 on 2020/6/12.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import "CertificateModel.h"

@implementation CertificateModel


+ (NSDictionary *)mj_objectClassInArray{
    
    return @{@"certList" : [CertificateItem class]};
}

@end

@implementation CertificateItem
@end
