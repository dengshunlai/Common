//
//  SViewController.m
//  Common
//
//  Created by dengshunlai on 2017/6/13.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "SViewController.h"
#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"

@interface SViewController ()

@end

@implementation SViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI {
    [super setupUI];
    self.title = @"可滚动";
    [_sg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.top.equalTo(self.view);
        make.height.equalTo(@35);
    }];
    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.leading.trailing.equalTo(self.view);
        make.top.equalTo(_sg.mas_bottom);
    }];
    
    AViewController *avc = [[AViewController alloc] init];
    BViewController *bvc = [[BViewController alloc] init];
    CViewController *cvc = [[CViewController alloc] init];
    self.viewControllers = @[avc,bvc,cvc];
    _sg.sectionTitles = @[@"最新",@"外服",@"赛事"];
}

@end
