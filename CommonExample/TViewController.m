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

- (void)setupUI {
    [super setupUI];
    AViewController *avc = [[AViewController alloc] init];
    BViewController *bvc = [[BViewController alloc] init];
    CViewController *cvc = [[CViewController alloc] init];
    _tc.viewControllers = @[avc,bvc,cvc];
    _sg.sectionTitles = @[@"最新",@"外服",@"赛事"];
    
    [_sg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.top.equalTo(self.view);
        make.height.equalTo(@35);
    }];
    [_tc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self.view);
        make.top.equalTo(_sg.mas_bottom);
    }];
}

@end
