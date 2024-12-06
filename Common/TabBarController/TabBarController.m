//
//  TabBarViewController.m
//  Common
//
//  Created by 邓顺来1992 on 2024/12/6.
//  Copyright © 2024 邓顺来. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        ;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = YES;
    
    _aTabBar = [[TabBar alloc] init];
    [self.view addSubview:_aTabBar];
    
    WEAK_OBJ(self);
    [_aTabBar setOnClickItem:^(NSInteger idx, TabBarItem *item) {
        weak_self.selectedIndex = idx;
    }];
    
    CGFloat tabbarHeight = [DSLTool tabbarAddBottomHeight];
    _aTabBar.frame = CGRectMake(0, self.view.bounds.size.height - tabbarHeight, kScreenWidth, tabbarHeight);
}

@end
