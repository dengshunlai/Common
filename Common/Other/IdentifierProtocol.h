//
//  IdentifierProtocol.h
//  Common
//
//  Created by dengshunlai on 2017/6/29.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IdentifierProtocol <NSObject>

@optional

/**
 根据上下文生成 identifier, 不同场景复用同一种Cell时作区分,
 上下文不同, 返回值不同

 @param context 上下文
 @param tag 额外的区分信息
 */
+ (NSString *)identifierWithContext:(id)context tag:(NSInteger)tag;

/**
 相当于 tag = 0
 */
+ (NSString *)identifierWithContext:(id)context;

@end
