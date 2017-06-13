//
//  LabelTFCell.h
//  Common
//
//  Created by dengshunlai on 2017/6/5.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface LabelTFCell : BaseTableViewCell

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UITextField *textField;
@property (copy, nonatomic) void (^tfTextDidChangeBlock)(NSString *text);

- (void)setTfTextDidChangeBlock:(void (^)(NSString *text))tfTextDidChangeBlock;

@end
