//
//  IconTFItem.h
//  Common
//
//  Created by dengshunlai on 2017/7/31.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "BaseCollectionViewItem.h"

@interface IconTFItem : BaseCollectionViewItem

@property (strong, nonatomic) UIImageView *icon;
@property (strong, nonatomic) UITextField *textField;
@property (assign, nonatomic) CGFloat edge;
@property (copy, nonatomic) void (^tfTextDidChangeBlock)(NSString *text);

- (void)setTfTextDidChangeBlock:(void (^)(NSString *text))tfTextDidChangeBlock;

@end
