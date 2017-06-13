//
//  TextViewCell.h
//  Common
//
//  Created by dengshunlai on 2017/6/7.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface TextViewCell : BaseTableViewCell

@property (strong, nonatomic) UITextView *textView;
@property (assign, nonatomic) UIEdgeInsets insets;
@property (copy, nonatomic) void (^textDidChangedBlock)(NSString *text);

- (void)setTextDidChangedBlock:(void (^)(NSString *text))textDidChangedBlock;

@end
