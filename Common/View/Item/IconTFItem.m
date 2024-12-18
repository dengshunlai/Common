//
//  IconTFItem.m
//  Common
//
//  Created by dengshunlai on 2017/7/31.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "IconTFItem.h"

@interface IconTFItem () <UITextFieldDelegate>

@end

@implementation IconTFItem

- (void)setupBase {
    _edge = 15;
}

- (void)setupUI {
    [super setupUI];
    self.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
    
    _icon = ({
        UIImageView *iv = [[UIImageView alloc] init];
        iv.contentMode = UIViewContentModeScaleAspectFill;
        iv.clipsToBounds = YES;
        iv;
    });
    _textField = ({
        UITextField *tf = [[UITextField alloc] init];
        tf.font = [UIFont systemFontOfSize:14];
        tf.textColor = X6_COLOR;
        tf.textAlignment = NSTextAlignmentLeft;
        tf.delegate = self;
        tf.returnKeyType = UIReturnKeyDone;
        tf.autocorrectionType = UITextAutocorrectionTypeNo;
        tf.spellCheckingType = UITextSpellCheckingTypeNo;
        tf.autocapitalizationType = UITextAutocapitalizationTypeNone;
        [tf addTarget:self action:@selector(tfTextDidChange:) forControlEvents:UIControlEventEditingChanged];
        tf;
    });
    [self.contentView addSubview:_icon];
    [self.contentView addSubview:_textField];
    
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.leading.equalTo(self.contentView).offset(15);
        make.width.equalTo(@25);
        make.height.equalTo(_icon.mas_width);
    }];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView).offset(-15);
        make.leading.equalTo(_icon.mas_trailing).offset(10);
        make.top.bottom.equalTo(self.contentView);
    }];
}

- (void)setEdge:(CGFloat)edge {
    if (_edge != edge) {
        _edge = edge;
        [_icon mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.leading.equalTo(self.contentView).offset(edge);
            make.width.equalTo(@25);
            make.height.equalTo(_icon.mas_width);
        }];
        [_textField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self.contentView).offset(-edge);
            make.leading.equalTo(_icon.mas_trailing).offset(10);
            make.top.bottom.equalTo(self.contentView);
        }];
        self.separatorInset = UIEdgeInsetsMake(0, edge, 0, edge);
    }
}

#pragma mark - Action

- (void)tfTextDidChange:(UITextField *)sender {
    if (self.tfTextDidChangeBlock) {
        self.tfTextDidChangeBlock(sender.text);
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
