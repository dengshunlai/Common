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
#import "BaseNavigationController.h"
#import "BaseTabBarController.h"

@interface BaseViewController : UIViewController
{
    BOOL _isLoadFinish;
}

@property (assign, nonatomic) BOOL isLoadFinish;

/**
 子类实现
 */
- (void)setupTopBar;
- (void)setupUI;
- (void)setupRefresh;
- (void)setup;

@end
