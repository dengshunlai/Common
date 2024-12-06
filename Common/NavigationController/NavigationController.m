//
//  NavigationController.m
//  Common
//
//  Created by 邓顺来1992 on 2024/12/6.
//  Copyright © 2024 邓顺来. All rights reserved.
//

#import "NavigationController.h"
#import "NCInteractiveAnimator.h"
#import "BaseViewController.h"

@interface NavigationController () <UIGestureRecognizerDelegate>

@property (strong, nonatomic) NCInteractiveAnimator *animator;
@property (weak, nonatomic) UIViewController *popingViewController;
@property (strong, nonatomic) UIScreenEdgePanGestureRecognizer *edgePan;

@end

@implementation NavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController type:(NSInteger)type
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        [self initialization];
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)initialization {
    _animator = [[NCInteractiveAnimator alloc] initWithNavc:self];
    self.navigationBarHidden = YES;
    self.interactivePopGestureRecognizer.enabled = NO;
    self.delegate = _animator;
    
    _edgePan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(panPop:)];
    _edgePan.edges = UIRectEdgeLeft;
    _edgePan.delegate = self;
    [self.view addGestureRecognizer:_edgePan];
}

#pragma mark - Target & Selector

- (void)panPop:(UIScreenEdgePanGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateBegan: 
        {
            if (self.viewControllers.count <= 1) {
                break;
            }
            _popingViewController = self.topViewController;
            _animator.isInteractive = YES;
            [self popViewControllerAnimated:YES];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            if (!_animator.isInteractive) {
                break;
            }
            CGPoint point = [sender translationInView:self.view];
            CGFloat pecent = point.x / kScreenWidth;
            [_animator updateInteractiveTransition:pecent];
        }
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
        {
            CGPoint point = [sender translationInView:self.view];
            CGFloat pecent = point.x / kScreenWidth;
            if (pecent > 0.35) {
                if ([_popingViewController isKindOfClass:[BaseViewController class]]) {
                    BaseViewController *popingViewController = (BaseViewController *)_popingViewController;
                    if (popingViewController.gesturePopCallback) {
                        BOOL b = popingViewController.gesturePopCallback();
                        if (b) {
                            _animator.completionSpeed = 1;
                            [_animator finishInteractiveTransition];
                        } else {
                            _animator.completionSpeed = 0.5;
                            [_animator cancelInteractiveTransition];
                        }
                    } else {
                        _animator.completionSpeed = 1;
                        [_animator finishInteractiveTransition];
                    }
                } else {
                    _animator.completionSpeed = 1;
                    [_animator finishInteractiveTransition];
                }
            } else {
                CGPoint speed = [sender velocityInView:self.view];
                if (speed.x >= 800) {
                    if ([_popingViewController isKindOfClass:[BaseViewController class]]) {
                        BaseViewController *popingViewController = (BaseViewController *)_popingViewController;
                        if (popingViewController.gesturePopCallback) {
                            BOOL b = popingViewController.gesturePopCallback();
                            if (b) {
                                _animator.completionSpeed = 1;
                                [_animator finishInteractiveTransition];
                            } else {
                                _animator.completionSpeed = 0.5;
                                [_animator cancelInteractiveTransition];
                            }
                        } else {
                            _animator.completionSpeed = 1;
                            [_animator finishInteractiveTransition];
                        }
                    } else {
                        _animator.completionSpeed = 1;
                        [_animator finishInteractiveTransition];
                    }
                } else {
                    _animator.completionSpeed = 0.5;
                    [_animator cancelInteractiveTransition];
                }
            }
            _animator.isInteractive = NO;
            _popingViewController = nil;
        }
            break;
        default:
            break;
    }
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
