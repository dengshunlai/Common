//
//  ButtonItem.m
//  Common
//
//  Created by dengshunlai on 2017/7/31.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "ButtonItem.h"

@implementation ButtonItem

- (void)setupUI {
    _button = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitle:LString(@"Sign In") forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        btn.backgroundColor = RED_COLOR;
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    [self.contentView addSubview:_button];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@49);
        make.leading.equalTo(self.contentView).offset(20);
        make.trailing.equalTo(self.contentView).offset(-20);
    }];
}

- (void)setup {
    self.contentView.backgroundColor = [UIColor clearColor];
    self.separatorInset = UIEdgeInsetsMake(0, kScreenWidth, 0, 0);
}

#pragma mark - Action

- (void)clickBtn:(UIButton *)sender {
    if (self.clickBtnBlock) {
        self.clickBtnBlock(sender);
    }
}

@end
