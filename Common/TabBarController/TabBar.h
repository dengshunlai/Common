//
//  TabBar.h
//  Common
//
//  Created by 邓顺来1992 on 2024/12/5.
//  Copyright © 2024 邓顺来. All rights reserved.
//

#import "BaseView.h"

@class TabBarItem;

@interface TabBar : BaseView

@property (strong, nonatomic) NSMutableArray<TabBarItem *> *itemList;
@property (strong, nonatomic) UIView *topLine;
@property (copy, nonatomic) void (^onClickItem)(NSInteger idx, TabBarItem *item);

- (void)addItem:(TabBarItem *)item;

@end


@interface TabBarItem : UIControl

@property (strong, nonatomic) UIImageView *iv;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) UIImage *selImage;
@property (strong, nonatomic) UIColor *color;
@property (strong, nonatomic) UIColor *selColor;
@property (assign, nonatomic) BOOL isSel;

- (instancetype)initWithText:(NSString *)text
                       image:(UIImage *)image
                    selImage:(UIImage *)selImage
                       color:(UIColor *)color
                    selColor:(UIColor *)selColor;

@end
