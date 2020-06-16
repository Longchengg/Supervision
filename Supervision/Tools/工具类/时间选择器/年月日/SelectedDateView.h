//
//  SelectedDateView.h
//  Supervision
//
//  Created by 黄琦 on 2020/5/21.
//  Copyright © 2020 Supervision. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectedDateViewDelegate <NSObject>

- (void)selectedDate:(NSString *)dateStr;

- (void)cancelBtn;
@end

@interface SelectedDateView : UIView

@property (nonatomic, weak) id<SelectedDateViewDelegate> delegate;

- (void)setRuZhuTime:(NSString *)time;

@end


