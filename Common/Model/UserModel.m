//
//  UserModel.m
//  XXComposition
//
//  Created by dengshunlai on 2017/6/20.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

+ (instancetype)sharedInstance {
    static UserModel *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [DSLArchiver unarchiveWithKey:KEY_USER];
        if (![_sharedInstance isKindOfClass:[UserModel class]]) {
            _sharedInstance = [[UserModel alloc] init];
        }
    });
    return _sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        ;
    }
    return self;
}

+ (void)save {
    [DSLArchiver archiveObject:[UserModel sharedInstance] key:KEY_USER];
}

@end
