//
//  BaseViewController.h
//  Common
//
//  Created by 邓顺来 on 2017/6/1.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "AppAPI.h"
#import "AppConst.h"
#import "HTTPRequest.h"
#import "UserModel.h"
#import "ButtonCell.h"
#import "LabelCell.h"
#import "TextViewCell.h"
#import "IconTFCell.h"
#import "TextFieldCell.h"
#import "LabelTFCell.h"
#import "IconLabelCell.h"
#import "TableViewHeader.h"
#import "NavigationController.h"
#import "TabBarController.h"
#import "NavigationBar.h"

@interface BaseViewController : UIViewController

@property (strong, nonatomic) NavigationBar *topBar;
/// 手势导致pop的回调，返回YES表示正常pop，返回NO表示取消pop
@property (copy, nonatomic) BOOL (^gesturePopCallback)(void);

/**
 子类实现
 */
- (void)initialization;

- (void)setupBase;
- (void)setupTopBar;
- (void)setupUI;
- (void)setupOther;

- (void)refreshContent;
- (void)refreshSizeAndPos;
- (void)refresh;

- (void)createTopBar;

@end
