//
//  ChuZhiCheckFirstCell.h
//  Supervision
//
//  Created by 黄琦 on 2019/12/3.
//  Copyright © 2019 cjbapp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChuZhiCheckFirstCell : UITableViewCell


- (void)setCelllab1:(NSString *)lab1
               lab2:(NSString *)lab2
               lab3:(NSString *)lab3
              timeS:(NSString *)timeS
       isHiddenLine:(BOOL )isHiddenLine;

@end

NS_ASSUME_NONNULL_END
