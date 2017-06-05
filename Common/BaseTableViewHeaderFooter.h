//
//  BaseTableViewHeaderFooter.h
//  Common
//
//  Created by dengshunlai on 2017/6/5.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

@interface BaseTableViewHeaderFooter : UITableViewHeaderFooterView

/**
 根据上下文生成 reuseIdentifier, 不同场景复用同一种View时作区分,
 上下文不同, 返回值不同
 
 @param context 上下文
 */
+ (NSString *)identifierWithContext:(id)context;

/**
 子类实现
 */
- (void)setupUI;
- (void)setup;

@end
