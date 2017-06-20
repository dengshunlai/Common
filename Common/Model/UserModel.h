//
//  UserModel.h
//  XXComposition
//
//  Created by dengshunlai on 2017/6/20.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSLArchiver.h"
#import "AppConst.h"

@interface UserModel : NSObject

@property (assign, nonatomic) BOOL isSignIn;

+ (instancetype)sharedInstance;
+ (void)save;

@end
