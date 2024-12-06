//
//  DSLTool.h
//  DSLTool
//
//  Created by 邓顺来 on 16/9/28.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSLTool : NSObject

/**
 生成uuid
 */
+ (NSString *)uuid;

/**
 返回设备名称
 */
+ (NSString *)deviceName;

/**
 获取图片的实际类型，返回nil表示未知类型
 */
+ (NSString *)typeForImageData:(NSData *)data;

/**
 返回正在显示的ViewController
 */
+ (UIViewController *)topViewController;

/**
 获取状态栏高度
 */
+ (CGFloat)statusBarHeight;

/**
 获取safeArea
 */
+ (UIEdgeInsets)safeAreaInsets;

/**
 获取safeAreaBottom
 */
+ (CGFloat)safeAreaBottom;

/**
 获取safeAreaTop
 */
+ (CGFloat)safeAreaTop;

/**
 navigationBar + safeAreaTop
 */
+ (CGFloat)navAddTopHeight;

/**
 tabbar + safeAreaBottom
 */
+ (CGFloat)tabbarAddBottomHeight;

+ (UIWindow *)getKeyWindow;

+ (UIWindow *)getTopWindow;

+ (UIWindow *)getMainWindow;

@end
