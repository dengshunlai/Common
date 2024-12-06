//
//  NavigationBar.h
//  Common
//
//  Created by 邓顺来1992 on 2024/12/5.
//  Copyright © 2024 邓顺来. All rights reserved.
//

#import "BaseView.h"

@interface NavigationBar : BaseView

@property (strong, nonatomic) UIView *bgView;
@property (strong, nonatomic) UIButton *backBtn;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIView *bottomLine;
@property (weak, nonatomic) UIViewController *vc;
@property (copy, nonatomic) BOOL (^clickBackBtnBlock)(void);

- (instancetype)initWithTitle:(NSString *)title;

- (void)setTitle:(NSString *)title;

@end
