//
//  TextFieldCell.m
//  XXComposition
//
//  Created by 邓顺来 on 2017/6/24.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "TextFieldCell.h"

@interface TextFieldCell () <UITextFieldDelegate>

@end

@implementation TextFieldCell

- (void)setupUI {
    _textField = ({
        UITextField *tf = [[UITextField alloc] init];
        tf.textColor = UIColorFromRGB(0x666666);
        tf.font = [UIFont systemFontOfSize:14];
        tf.placeholder = @"";
        tf.autocorrectionType = UITextAutocorrectionTypeNo;
        tf.autocapitalizationType = UITextAutocapitalizationTypeNone;
        tf.spellCheckingType = UITextSpellCheckingTypeNo;
        tf.returnKeyType = UIReturnKeyDone;
        tf.delegate = self;
        [tf addTarget:self action:@selector(tfTextDidChange:) forControlEvents:UIControlEventEditingChanged];
        tf;
    });
    [self.contentView addSubview:_textField];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(8, 15, 8, 10));
    }];
}

- (void)setup {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setInsets:(UIEdgeInsets)insets {
    _insets = insets;
    [_textField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(insets);
    }];
}

#pragma mark - Action

- (void)tfTextDidChange:(UITextField *)tf {
    if (self.textDidChangedBlock) {
        self.textDidChangedBlock(tf.text);
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
