//
//  TableViewHeader.h
//  Common
//
//  Created by dengshunlai on 2017/6/5.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "BaseTableViewHeaderFooter.h"

@interface TableViewHeader : BaseTableViewHeaderFooter

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) UIView *line;
@property (copy, nonatomic) void (^clickBtnBlock)(UIButton *sender);
@property (assign, nonatomic) CGSize buttonSize;

- (void)setClickBtnBlock:(void (^)(UIButton *sender))clickBtnBlock;

/**
 用于取消段头停留
 */
@property (weak, nonatomic) UITableView *tv;
@property (assign, nonatomic) NSInteger section;

@end
