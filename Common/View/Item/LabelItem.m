//
//  LabelItem.m
//  Common
//
//  Created by dengshunlai on 2017/7/28.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "LabelItem.h"

@implementation LabelItem

- (void)setupUI {
    _line = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = LINE_COLOR;
        view;
    });
    _label = ({
        UILabel *label = [[UILabel alloc] init];
        label.textColor = X3_COLOR;
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentLeft;
        label.numberOfLines = 0;
        label;
    });
    
    [self.contentView addSubview:_line];
    [self.contentView addSubview:_label];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(15, 15, 15, 10));
    }];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@15);
        make.bottom.equalTo(@0);
        make.trailing.equalTo(@0);
        make.height.equalTo(@0.5);
    }];
    
    self.contentView.backgroundColor = [UIColor whiteColor];
}

- (void)setup {
    ;
}

- (void)setInsets:(UIEdgeInsets)insets {
    _insets = insets;
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(insets);
    }];
}

@end
