//
//  TViewController.m
//  Common
//
//  Created by 邓顺来 on 2017/6/10.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "TViewController.h"
#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"

@interface TViewController ()

@end

@implementation TViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupTopBar {
    [self createTopBar];
    [self.topBar setTitle:@"不可滚动"];
}

- (void)setupUI {
    [super setupUI];
    [_sg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.view);
        make.top.equalTo(self.topBar.mas_bottom);
        make.height.equalTo(@35);
    }];
    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self.view);
        make.top.equalTo(_sg.mas_bottom);
    }];
    
    AViewController *avc = [[AViewController alloc] init];
    BViewController *bvc = [[BViewController alloc] init];
    CViewController *cvc = [[CViewController alloc] init];
    self.viewControllers = @[avc,bvc,cvc];
    _sg.sectionTitles = @[@"最新",@"外服",@"赛事"];
}

@end
