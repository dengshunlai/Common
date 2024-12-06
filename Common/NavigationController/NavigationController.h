//
//  NavigationViewController.h
//  Common
//
//  Created by 邓顺来1992 on 2024/12/6.
//  Copyright © 2024 邓顺来. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationController : UINavigationController

/**
 *  转场类型，默认为0，可以在实现文件中定义自己的转场类型
 */
@property (assign, nonatomic) IBInspectable NSInteger type;

/**
 *  指定初始化方法
 *
 *  @param rootViewController 根视图控制器
 *  @param type               转场类型，默认为0
 *
 *  @return DSLNavigationController实例
 */
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController type:(NSInteger)type;

@end
