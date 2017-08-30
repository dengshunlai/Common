//
//  ButtonItem.h
//  Common
//
//  Created by dengshunlai on 2017/7/31.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "BaseCollectionViewItem.h"

@interface ButtonItem : BaseCollectionViewItem

@property (strong, nonatomic) UIButton *button;
@property (copy, nonatomic) void (^clickBtnBlock)(UIButton *button);
@property (assign, nonatomic) CGSize btnSize;

- (void)setClickBtnBlock:(void (^)(UIButton *button))clickBtnBlock;

@end
