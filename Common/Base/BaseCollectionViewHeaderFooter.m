//
//  BaseCollectionViewHeaderFooter.m
//  Common
//
//  Created by dengshunlai on 2017/8/1.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "BaseCollectionViewHeaderFooter.h"

@implementation BaseCollectionViewHeaderFooter

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        [self setup];
    }
    return self;
}

+ (NSString *)identifierWithContext:(id)context tag:(NSInteger)tag {
    NSMutableString *identifier = [NSMutableString stringWithFormat:@"%@_",NSStringFromClass([self class])];
    if (context == nil) {
        [identifier deleteCharactersInRange:NSMakeRange(identifier.length - 1, 1)];
    } else if ([context isKindOfClass:[NSString class]]) {
        [identifier appendString:context];
    } else {
        [identifier appendString:NSStringFromClass([context class])];
    }
    [identifier appendFormat:@"_%ld",tag];
    return identifier;
}

+ (NSString *)identifierWithContext:(id)context {
    return [self identifierWithContext:context tag:0];
}

- (void)setupUI {}
- (void)setup {}

@end
