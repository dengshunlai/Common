//
//  NCInteractiveAnimator.h
//  Common
//
//  Created by 邓顺来1992 on 2024/12/6.
//  Copyright © 2024 邓顺来. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationController.h"

@interface NCInteractiveAnimator : UIPercentDrivenInteractiveTransition <UIViewControllerAnimatedTransitioning, UINavigationControllerDelegate>

@property (assign, nonatomic) BOOL isPush;
@property (assign, nonatomic) BOOL isInteractive;
@property (assign, nonatomic) NavigationController *navc;

- (instancetype)initWithNavc:(NavigationController *)navc;

@end
