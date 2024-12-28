//
//  TableViewHeader.m
//  Common
//
//  Created by dengshunlai on 2017/6/5.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "TableViewHeader.h"

@implementation TableViewHeader

- (void)setupUI {
    self.contentView.backgroundColor = [UIColor whiteColor];
    
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
    [self.contentView addSubview:_label];
    [self.contentView addSubview:_button];
    [self.contentView addSubview:_line];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.leading.equalTo(self.contentView).offset(15);
    }];
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.trailing.equalTo(self.contentView).offset(-10);
        make.width.height.equalTo(self.contentView.mas_height);
    }];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];
    
    _button.hidden = YES;
}

- (void)setFrame:(CGRect)frame
{
    if (_tv) {
        CGRect rect = [_tv rectForHeaderInSection:_section];
        [super setFrame:rect];
    } else {
        [super setFrame:frame];
    }
}

- (void)clickBtn:(UIButton *)sender {
    if (self.clickBtnBlock) {
        self.clickBtnBlock(sender);
    }
}

- (void)setButtonSize:(CGSize)buttonSize {
    _buttonSize = buttonSize;
    [_button mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.trailing.equalTo(self.contentView).offset(-10);
        make.width.equalTo(@(_buttonSize.width));
        make.height.equalTo(@(_buttonSize.height));
    }];
}

@end
