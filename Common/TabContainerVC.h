//
//  TabContainerVC.h
//  Common
//
//  Created by 邓顺来 on 2017/6/10.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "BaseViewController.h"
#import "HMSegmentedControl.h"

@interface TabContainerVC : BaseViewController
{
    UITabBarController *_tc;
    HMSegmentedControl *_sg;
}
@property (strong, nonatomic) UITabBarController *tc;
@property (strong, nonatomic) HMSegmentedControl *sg;
@property (strong, nonatomic) UIView *sgLine;

@end
