//
//  BaseTableViewCell.h
//  Common
//
//  Created by dengshunlai on 2017/6/2.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IdentifierProtocol.h"
#import "Masonry.h"
#import "AppAPI.h"
#import "AppConst.h"
#import "UserModel.h"
#import "UIImageView+WebCache.h"

@interface BaseTableViewCell : UITableViewCell <IdentifierProtocol>

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
