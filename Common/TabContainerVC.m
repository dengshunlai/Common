//
//  TabContainerVC.m
//  Common
//
//  Created by 邓顺来 on 2017/6/10.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "TabContainerVC.h"

@interface TabContainerVC ()

@end

@implementation TabContainerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI {
    _sg =[[HMSegmentedControl alloc] init];
    _sg.backgroundColor = UIColorFromRGB(0xfcfcfc);
    _sg.titleTextAttributes = @{NSForegroundColorAttributeName:X3_COLOR,NSFontAttributeName:[UIFont systemFontOfSize:15]};
    _sg.selectedTitleTextAttributes = @{NSForegroundColorAttributeName:ORANGE_COLOR};
    _sg.selectionIndicatorColor = ORANGE_COLOR;
    _sg.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    _sg.selectionIndicatorHeight = 2;
    [self.view addSubview:_sg];
    WEAK_OBJ(self)
    [_sg setIndexChangeBlock:^(NSInteger index) {
        weak_self.tc.selectedIndex = index;
    }];
    
    _tc = [[UITabBarController alloc] init];
    _tc.tabBar.hidden = YES;
    [self addChildViewController:_tc];
    [self.view addSubview:_tc.view];
    [_tc didMoveToParentViewController:self];
    
    _sgLine = [[UIView alloc] init];
    _sgLine.backgroundColor = LINE_COLOR;
    [_sg addSubview:_sgLine];
    [_sgLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(_sg);
        make.height.equalTo(@0.5);
    }];
}

@end
