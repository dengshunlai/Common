//
//  BaseCollectionViewItem.m
//  Common
//
//  Created by dengshunlai on 2017/6/2.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "BaseCollectionViewItem.h"

@implementation BaseCollectionViewItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        [self setup];
    }
    return self;
}

- (void)setupUI {}
- (void)setup {}

@end
