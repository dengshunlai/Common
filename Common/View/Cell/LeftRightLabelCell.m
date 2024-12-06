//
//  LeftRightLabelCell.m
//  SunskyAdmin
//
//  Created by dengshunlai on 2017/9/28.
//  Copyright © 2017年 dengshunlai. All rights reserved.
//

#import "LeftRightLabelCell.h"

@implementation LeftRightLabelCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupUI {
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    _leftLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.textColor = X3_COLOR;
        label.font = [UIFont systemFontOfSize:14];
        label;
    });
    _rightLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.textColor = X9_COLOR;
        label.font = [UIFont systemFontOfSize:14];
        label;
    });
    [self.contentView addSubview:_leftLabel];
    [self.contentView addSubview:_rightLabel];
    
    [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@15);
        make.centerY.equalTo(@0);
    }];
    [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(@-10);
        make.centerY.equalTo(@0);
    }];
}

@end
