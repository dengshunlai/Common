//
//  IconTFCell.h
//  Common
//
//  Created by dengshunlai on 2017/6/6.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface IconTFCell : BaseTableViewCell

@property (strong, nonatomic) UIImageView *icon;
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) UIView *line;
@property (assign, nonatomic) CGFloat edge;
@property (copy, nonatomic) void (^tfTextDidChangeBlock)(NSString *text);

- (void)setTfTextDidChangeBlock:(void (^)(NSString *text))tfTextDidChangeBlock;

@end
