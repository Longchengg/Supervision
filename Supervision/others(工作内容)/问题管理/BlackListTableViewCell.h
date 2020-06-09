//
//  BlackListTableViewCell.h
//  Supervision
//
//  Created by 龙成 on 2020/6/9.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlackListTableViewCell : UITableViewCell
//问题管理类型
@property (nonatomic, assign) int Btype;

@property (nonatomic, copy) NSString *Rlabel;
-(void)setlabel:(NSString *)count type:(NSString *)type;
@end

NS_ASSUME_NONNULL_END
