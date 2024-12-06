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

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"%@: %@",NSStringFromSelector(_cmd), [self class]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initialization];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)initialization {
    [self setupBase];
    [self setupTopBar];
    [self setupUI];
    [self setupOther];
}

- (void)setupBase {}
- (void)setupTopBar {}
- (void)setupUI {}
- (void)setupOther {}

- (void)refreshContent {}
- (void)refreshSizeAndPos {}
- (void)refresh {
    [self refreshContent];
    [self refreshSizeAndPos];
}

- (void)createTopBar {
    _topBar = [[NavigationBar alloc] initWithTitle:@""];
    _topBar.vc = self;
    [self.view addSubview:_topBar];
    [_topBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(@0);
    }];
}

@end
