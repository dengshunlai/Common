//
//  NCInteractiveAnimator.m
//  Common
//
//  Created by 邓顺来1992 on 2024/12/6.
//  Copyright © 2024 邓顺来. All rights reserved.
//

#import "NCInteractiveAnimator.h"
#import "TabBarController.h"

static CGFloat const kWidthScale = 0.9;
static CGFloat const kHeightScale = 0.9;

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface NCInteractiveAnimator ()

@end

@implementation NCInteractiveAnimator

- (instancetype)initWithNavc:(NavigationController *)navc
{
    self = [super init];
    if (self) {
        _navc = navc;
    }
    return self;
}

#pragma mark - UINavigationControllerDelegate
//push/pop会顺序调用下面两个方法
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC

{
    switch (operation) {
        case UINavigationControllerOperationPush: {
            _isPush = YES;
        }
            break;
        case UINavigationControllerOperationPop: {
            _isPush = NO;
        }
            break;
        default:
            break;
    }
    return self;
}

- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController
{
    return _isInteractive ? self : nil;
}

- (UIInterfaceOrientationMask)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController
{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UIViewController *root = navigationController.viewControllers.firstObject;
    if ([navigationController.tabBarController isKindOfClass:[TabBarController class]]) {
        TabBarController *tc = (TabBarController *)navigationController.tabBarController;
        if (viewController != root) {
            [tc.aTabBar removeFromSuperview];
            [root.view addSubview:tc.aTabBar];
        }
    }
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UIViewController *root = navigationController.viewControllers.firstObject;
    if ([navigationController.tabBarController isKindOfClass:[TabBarController class]]) {
        TabBarController *tc = (TabBarController *)navigationController.tabBarController;
        if (viewController == root) {
            [tc.aTabBar removeFromSuperview];
            [tc.view addSubview:tc.aTabBar];
        }
    }
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    if (_navc.type == 2) {
        return 0.5;
    }
    return 0.35;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    //UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = [transitionContext containerView];
    
    if (_navc.type == 0) {
        //模仿系统push
        if (_isPush) {
            toView.frame = CGRectMake(kScreenWidth, 0, kScreenWidth, kScreenHeight);
            toView.layer.shadowOpacity = 0.5;
            toView.layer.shadowOffset = CGSizeMake(-5, 5);
            toView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
            toView.layer.shadowPath = [UIBezierPath bezierPathWithRect:toView.bounds].CGPath;
            [containerView addSubview:toView];
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                fromView.frame = CGRectMake(- kScreenWidth / 4, 0, kScreenWidth, kScreenHeight);
                toView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];
        } else {
            toView.frame = CGRectMake(- kScreenWidth / 4, 0, kScreenWidth, kScreenHeight);
            [containerView insertSubview:toView belowSubview:fromView];
            fromView.layer.shadowOpacity = 0.5;
            fromView.layer.shadowOffset = CGSizeMake(-5, 5);
            fromView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
            fromView.layer.shadowPath = [UIBezierPath bezierPathWithRect:toView.bounds].CGPath;
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                toView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
                fromView.frame = CGRectMake(kScreenWidth, 0, kScreenWidth, kScreenHeight);
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];
        }
    } else if (_navc.type == 1) {
        if (_isPush) {
            toView.frame = CGRectMake(kScreenWidth, 0, kScreenWidth, kScreenHeight);
            [containerView addSubview:toView];
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                fromView.transform = CGAffineTransformScale(fromView.transform, kWidthScale, kHeightScale);
                toView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
            } completion:^(BOOL finished) {
                fromView.transform = CGAffineTransformIdentity;
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];
        } else {
            toView.transform = CGAffineTransformScale(toView.transform, kWidthScale, kHeightScale);
            [containerView insertSubview:toView belowSubview:fromView];
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                toView.transform = CGAffineTransformIdentity;
                fromView.frame = CGRectMake(kScreenWidth, 0, kScreenWidth, kScreenHeight);
            } completion:^(BOOL finished) {
                toView.transform = CGAffineTransformIdentity;
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];
        }
    } else if (_navc.type == 2) {
        //碎片fragment
        if (_isPush) {
            [containerView insertSubview:toView belowSubview:fromView];
            CGFloat fragmentSize = 50;
            NSInteger column = fromView.frame.size.width / fragmentSize + 1;
            NSInteger row = fromView.frame.size.height / fragmentSize + 1;
            NSMutableArray *fragments = [NSMutableArray array];
            for (int i = 0; i < row; i++) {
                for (int j = 0; j < column; j++) {
                    UIView *fragmentView = [toView resizableSnapshotViewFromRect:CGRectMake(j * fragmentSize, i * fragmentSize, fragmentSize, fragmentSize) afterScreenUpdates:YES withCapInsets:UIEdgeInsetsZero];
                    fragmentView.frame = CGRectMake(j * fragmentSize, i * fragmentSize, fragmentSize, fragmentSize);
                    [fragments addObject:fragmentView];
                    [containerView addSubview:fragmentView];
                    fragmentView.transform = CGAffineTransformTranslate(fragmentView.transform, arc4random() % 30 * 50, 0);
                    fragmentView.alpha = 0;
                }
            }
            [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                for (UIView *fragmentView in fragments) {
                    fragmentView.transform = CGAffineTransformIdentity;
                    fragmentView.alpha = 1;
                }
            } completion:^(BOOL finished) {
                for (UIView *fragmentView in fragments) {
                    [fragmentView removeFromSuperview];
                }
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];
        } else {
            [containerView addSubview:toView];
            toView.frame = fromView.bounds;
            CGFloat fragmentSize = 50;
            NSInteger column = fromView.frame.size.width / fragmentSize + 1;
            NSInteger row = fromView.frame.size.height / fragmentSize + 1;
            NSMutableArray *fragments = [NSMutableArray array];
            for (int i = 0; i < row; i++) {
                for (int j = 0; j < column; j++) {
                    UIView *fragmentView = [fromView resizableSnapshotViewFromRect:CGRectMake(j * fragmentSize, i * fragmentSize, fragmentSize, fragmentSize) afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
                    fragmentView.frame = CGRectMake(j * fragmentSize, i * fragmentSize, fragmentSize, fragmentSize);
                    [fragments addObject:fragmentView];
                    [containerView addSubview:fragmentView];
                    fragmentView.alpha = 1;
                }
            }
            [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                for (UIView *fragmentView in fragments) {
                    fragmentView.transform = CGAffineTransformTranslate(fragmentView.transform, arc4random() % 30 * 50, 0);
                    fragmentView.alpha = 0;
                }
            } completion:^(BOOL finished) {
                for (UIView *fragmentView in fragments) {
                    [fragmentView removeFromSuperview];
                }
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];
        }
    }
    //参照type=0，1，定义你自己的转场方式。
}

@end
