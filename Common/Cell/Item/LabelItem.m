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
    [super setupUI];
    
    _label = ({
        UILabel *label = [[UILabel alloc] init];
        label.textColor = X3_COLOR;
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentLeft;
        label.numberOfLines = 0;
        label;
    });
    
    [self.contentView addSubview:_label];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(15, 15, 15, 10));
    }];
}

- (void)setInsets:(UIEdgeInsets)insets {
    _insets = insets;
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(insets);
    }];
}

@end
