//
//  IconLabelItem.m
//  Common
//
//  Created by dengshunlai on 2017/7/31.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "IconLabelItem.h"

@implementation IconLabelItem

- (void)setupUI {
    _icon = ({
        UIImageView *iv = [[UIImageView alloc] init];
        iv.contentMode = UIViewContentModeScaleAspectFill;
        iv.clipsToBounds = YES;
        iv;
    });
    _label = ({
        UILabel *label = [[UILabel alloc] init];
        label.textColor = UIColorFromRGB(0x333333);
        label.font = [UIFont systemFontOfSize:14];
        label;
    });
    [self.contentView addSubview:_icon];
    [self.contentView addSubview:_label];
    
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.leading.equalTo(self.contentView).offset(15);
        make.width.equalTo(@23);
        make.height.equalTo(_icon.mas_width);
    }];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.leading.equalTo(_icon.mas_trailing).offset(15);
        make.trailing.lessThanOrEqualTo(self.contentView).offset(-10);
    }];
}

- (void)setup {
    self.separatorInset = UIEdgeInsetsZero;
}

@end
