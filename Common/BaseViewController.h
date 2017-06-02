//
//  BaseViewController.h
//  Common
//
//  Created by 邓顺来 on 2017/6/1.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

/**
 子类实现
 */
- (void)setupTopBar;
- (void)setupUI;
- (void)setupRefresh;
- (void)setup;

@end
