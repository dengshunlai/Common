//
//  TextFieldCell.h
//  XXComposition
//
//  Created by 邓顺来 on 2017/6/24.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface TextFieldCell : BaseTableViewCell

@property (strong, nonatomic) UITextField *textField;
@property (assign, nonatomic) UIEdgeInsets insets;
@property (copy, nonatomic) void (^textDidChangedBlock)(NSString *text);

- (void)setTextDidChangedBlock:(void (^)(NSString *text))textDidChangedBlock;

@end
