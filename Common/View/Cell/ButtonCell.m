//
//  ButtonCell.m
//  Common
//
//  Created by dengshunlai on 2017/6/2.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "ButtonCell.h"

@implementation ButtonCell

- (void)setupUI {
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.separatorInset = UIEdgeInsetsMake(0, kScreenWidth, 0, 0);
    
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

- (void)setBtnSize:(CGSize)btnSize {
    [_button mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(@0);
        make.width.equalTo(@(btnSize.width));
        make.height.equalTo(@(btnSize.height));
    }];
}

#pragma mark - Action

- (void)clickBtn:(UIButton *)sender {
    if (self.clickBtnBlock) {
        self.clickBtnBlock(sender);
    }
}

@end
