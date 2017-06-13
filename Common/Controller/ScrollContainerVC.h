//
//  ScrollContainerVC.h
//  Common
//
//  Created by dengshunlai on 2017/6/13.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "BaseViewController.h"
#import "HMSegmentedControl.h"

@interface ScrollContainerVC : BaseViewController
{
    UICollectionView *_cv;
    HMSegmentedControl *_sg;
    UIView *_containerView;
    UIView *_sgLine;
}

@property (strong, nonatomic) UICollectionView *cv;
@property (strong, nonatomic) HMSegmentedControl *sg;
@property (strong, nonatomic) UIView *sgLine;
@property (strong, nonatomic) UIView *containerView;
@property (strong, nonatomic) NSArray<UIViewController *> *viewControllers;

@end
