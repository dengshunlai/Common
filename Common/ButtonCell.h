//
//  ButtonCell.h
//  Common
//
//  Created by dengshunlai on 2017/6/2.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface ButtonCell : BaseTableViewCell

@property (strong, nonatomic) UIButton *button;
@property (copy, nonatomic) void (^clickBtnBlock)(UIButton *button);

- (void)setClickBtnBlock:(void (^)(UIButton *button))clickBtnBlock;

@end
