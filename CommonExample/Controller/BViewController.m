//
//  BViewController.m
//  Common
//
//  Created by 邓顺来 on 2017/6/10.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%@:%@",self.class,NSStringFromSelector(_cmd));
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%@:%@",self.class,NSStringFromSelector(_cmd));
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
