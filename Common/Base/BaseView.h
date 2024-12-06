//
//  BaseView.h
//  Common
//
//  Created by 邓顺来1992 on 2024/12/5.
//  Copyright © 2024 邓顺来. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

@interface BaseView : UIView

/**
 子类实现
 */
- (void)initialization;

- (void)setupBase;
- (void)setupUI;
- (void)setupOther;

- (void)refreshContent;
- (void)refreshSizeAndPos;
- (void)refresh;

@end
