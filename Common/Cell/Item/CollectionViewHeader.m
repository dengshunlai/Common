//
//  CollectionViewHeader.m
//  Common
//
//  Created by dengshunlai on 2017/8/1.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "CollectionViewHeader.h"

@implementation CollectionViewHeader

- (void)setupUI {
    [super setupUI];
    self.backgroundColor = [UIColor whiteColor];
    
    _label = ({
        UILabel *label = [[UILabel alloc] init];
        label.textColor = X6_COLOR;
        label.font = [UIFont systemFontOfSize:14];
        label;
    });
    _line = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = LINE_COLOR;
        view;
    });
    _button = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    [self addSubview:_label];
    [self addSubview:_button];
    [self addSubview:_line];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.leading.equalTo(self).offset(15);
    }];
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.trailing.equalTo(self).offset(-10);
        make.width.height.equalTo(self.mas_height);
    }];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self);
        make.height.equalTo(@0.5);
    }];
    
    _button.hidden = YES;
}

- (void)clickBtn:(UIButton *)sender {
    if (self.clickBtnBlock) {
        self.clickBtnBlock(sender);
    }
}

- (void)setButtonSize:(CGSize)buttonSize {
    _buttonSize = buttonSize;
    [_button mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.trailing.equalTo(self).offset(-10);
        make.width.equalTo(@(_buttonSize.width));
        make.height.equalTo(@(_buttonSize.height));
    }];
}

@end
