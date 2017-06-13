//
//  BaseViewController.m
//  Common
//
//  Created by 邓顺来 on 2017/6/1.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupTopBar];
    [self setupUI];
    [self setupRefresh];
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    NSLog(@"%@")
}

- (void)dealloc {
    NSLog(@"%@:%@",NSStringFromSelector(_cmd),[self class]);
}

- (void)setupTopBar {}
- (void)setupUI {}
- (void)setupRefresh {}
- (void)setup {}

@end
