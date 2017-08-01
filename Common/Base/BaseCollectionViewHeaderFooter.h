//
//  BaseCollectionViewHeaderFooter.h
//  Common
//
//  Created by dengshunlai on 2017/8/1.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "IdentifierProtocol.h"

@interface BaseCollectionViewHeaderFooter : UICollectionReusableView <IdentifierProtocol>

/**
 子类实现
 */
- (void)setupUI;
- (void)setup;

@end
