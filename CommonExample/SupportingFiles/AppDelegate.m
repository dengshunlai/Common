//
//  AppDelegate.m
//  Common
//
//  Created by 邓顺来 on 2017/6/1.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarController.h"
#import "NavigationController.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    
    if (@available(iOS 11, *)) {
        UIScrollView *scrollViewAppearance = [UIScrollView appearanceWhenContainedIn:[BaseViewController class], nil];
        scrollViewAppearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    if (@available(iOS 15, *)) {
        [UITableView appearance].sectionHeaderTopPadding = 0;
    }
    
    NavigationController *nc1 = [[NavigationController alloc] initWithRootViewController:[ViewController new] type:0];
    NavigationController *nc2 = [[NavigationController alloc] initWithRootViewController:[ViewController new] type:0];
    NavigationController *nc3 = [[NavigationController alloc] initWithRootViewController:[ViewController new] type:0];
    
    TabBarController *tc = [[TabBarController alloc] init];
    tc.viewControllers = @[nc1, nc2, nc3];
    TabBarItem *item1 = [[TabBarItem alloc] initWithText:@"首页"
                                                   image:[UIImage imageNamed:@"Home"]
                                                selImage:[UIImage imageNamed:@"Home_selected"]
                                                   color:UIColorFromRGB(0x999999)
                                                selColor:UIColor.orangeColor];
    TabBarItem *item2 = [[TabBarItem alloc] initWithText:@"分类"
                                                   image:[UIImage imageNamed:@"Categories"]
                                                selImage:[UIImage imageNamed:@"Categories_selected"]
                                                   color:UIColorFromRGB(0x999999)
                                                selColor:UIColor.orangeColor];
    TabBarItem *item3 = [[TabBarItem alloc] initWithText:@"购物车"
                                                   image:[UIImage imageNamed:@"Cart"]
                                                selImage:[UIImage imageNamed:@"Cart_selected"]
                                                   color:UIColorFromRGB(0x999999)
                                                selColor:UIColor.orangeColor];
    [tc.aTabBar addItem:item1];
    [tc.aTabBar addItem:item2];
    [tc.aTabBar addItem:item3];
    _window.rootViewController = tc;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
