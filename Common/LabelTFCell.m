//
//  LabelTFCell.m
//  Common
//
//  Created by dengshunlai on 2017/6/5.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "LabelTFCell.h"

@interface LabelTFCell () <UITextFieldDelegate>

@end

@implementation LabelTFCell

- (void)setupUI {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _label = ({
        UILabel *label = [[UILabel alloc] init];
        label.textColor = X3_COLOR;
        label.font = [UIFont systemFontOfSize:14];
        label;
    });
    _textField = ({
        UITextField *tf = [[UITextField alloc] init];
        tf.font = [UIFont systemFontOfSize:14];
        tf.textColor = X6_COLOR;
        tf.textAlignment = NSTextAlignmentRight;
        tf.delegate = self;
        tf.returnKeyType = UIReturnKeyDone;
        tf.autocorrectionType = UITextAutocorrectionTypeNo;
        tf.spellCheckingType = UITextSpellCheckingTypeNo;
        tf.autocapitalizationType = UITextAutocapitalizationTypeNone;
        [tf addTarget:self action:@selector(tfTextDidChange:) forControlEvents:UIControlEventEditingChanged];
        tf;
    });
    [self.contentView addSubview:_label];
    [self.contentView addSubview:_textField];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).offset(15);
        make.centerY.equalTo(self.contentView);
    }];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView).offset(-15);
        make.leading.equalTo(_label.mas_trailing).offset(10);
        make.top.bottom.equalTo(self.contentView);
    }];
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
