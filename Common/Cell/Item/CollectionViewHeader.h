//
//  CollectionViewHeader.h
//  Common
//
//  Created by dengshunlai on 2017/8/1.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "BaseCollectionViewHeaderFooter.h"

@interface CollectionViewHeader : BaseCollectionViewHeaderFooter

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) UIView *line;
@property (copy, nonatomic) void (^clickBtnBlock)(UIButton *sender);
@property (assign, nonatomic) CGSize buttonSize;

- (void)setClickBtnBlock:(void (^)(UIButton *sender))clickBtnBlock;

@end
