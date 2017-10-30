//
//  BaseNavigationController.m
//  Common
//
//  Created by 邓顺来 on 2017/6/1.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     这里改动了 UINavigationController.interactivePopGestureRecognizer.delegate，这种做法我觉得还是有一定风险的，
     这个delegate原本是一个私有类_UINavigationInteractiveTransition的对象，
     谁知道它本身的代理方法实现了什么？我这里也无法完全兼容系统本身的实现，所以有可能出现问题。
     
     这样做的原因：有些页面我禁用了系统本身的返回按钮，导致右滑返回失效，
     经测试，这个手势、手势的target、手势的action，添加这个手势的view，手势的delegate都没变，
     所以应该是这个手势的delegate的实现导致了 在禁用返回按钮下，右滑返回不可用。
     要解决这个问题唯有自己去重新实现这个delegate。
     */
    self.interactivePopGestureRecognizer.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    self.interactivePopGestureRecognizer.enabled = NO;
    [super pushViewController:viewController animated:animated];
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.viewControllers.count <= 1 ) {
        return NO;
    }
    return YES;
}

//是否支持多个手势同时触发
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognize
{
    return YES;
}

//这个方法返回YES，第一个和第二个同时出现时，第二个会失效
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return [gestureRecognizer isKindOfClass:UIScreenEdgePanGestureRecognizer.class];
}

@end
