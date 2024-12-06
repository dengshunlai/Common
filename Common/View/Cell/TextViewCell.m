//
//  TextViewCell.m
//  Common
//
//  Created by dengshunlai on 2017/6/7.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "TextViewCell.h"

@interface TextViewCell () <UITextViewDelegate>

@end

@implementation TextViewCell

- (void)setupUI {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _textView = ({
        UITextView *textView = [[UITextView alloc] init];
        textView.autocorrectionType = UITextAutocorrectionTypeNo;
        textView.spellCheckingType = UITextSpellCheckingTypeNo;
        textView.autocapitalizationType = UITextAutocapitalizationTypeNone;
        textView.font = [UIFont systemFontOfSize:14];
        textView.textColor = X3_COLOR;
        textView.showsVerticalScrollIndicator = NO;
        textView.layer.cornerRadius = 3;
        textView.layer.masksToBounds = YES;
        textView.layer.borderWidth = 0.5;
        textView.layer.borderColor = LINE_COLOR.CGColor;
        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithTitle:LString(@"Done") style:0 target:self action:@selector(done:)];
        UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 35)];
        toolBar.items = @[space, done];
        textView.inputAccessoryView = toolBar;
        textView.delegate = self;
        textView;
    });
    [self.contentView addSubview:_textView];
    
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).offset(15);
        make.trailing.equalTo(self.contentView).offset(-15);
        make.top.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
}

- (void)setInsets:(UIEdgeInsets)insets {
    _insets = insets;
    [_textView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(insets);
    }];
}

#pragma mark - Action

- (void)done:(UIBarButtonItem *)sender {
    [_textView resignFirstResponder];
}

#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView {
    if (self.textDidChangedBlock) {
        self.textDidChangedBlock(textView.text);
    }
}

@end
