//
//  BaseTableViewHeaderFooter.h
//  Common
//
//  Created by dengshunlai on 2017/6/5.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IdentifierProtocol.h"
#import "Masonry.h"

@interface BaseTableViewHeaderFooter : UITableViewHeaderFooterView <IdentifierProtocol>

/**
 子类实现
 */
- (void)initialization;

- (void)setupBase;
- (void)setupUI;
- (void)setupOther;

- (void)refreshContent;
- (void)refreshSizeAndPos;
- (void)refresh;

@end
