//
//  BaseView.m
//  Common
//
//  Created by 邓顺来1992 on 2024/12/5.
//  Copyright © 2024 邓顺来. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)initialization {
    [self setupBase];
    [self setupUI];
    [self setupOther];
}

- (void)setupBase {}
- (void)setupUI {}
- (void)setupOther {}

- (void)refreshContent {}
- (void)refreshSizeAndPos {}
- (void)refresh {
    [self refreshContent];
    [self refreshSizeAndPos];
}

@end
