//
//  HTTPRequest.h
//  XXComposition
//
//  Created by 邓顺来 on 2017/6/17.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface HTTPRequest : NSObject

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnullability-completeness"

+ (NSURLSessionDataTask *)GET:(NSString *)URL
                       params:(id)params
                     progress:(void (^)(NSProgress * _Nonnull))progress
                      success:(void (^)(NSInteger status, NSString *msg, id data))success
                      failure:(void (^)(NSError *error))failure;

+ (NSURLSessionDataTask *)GET:(NSString *)URL
                       params:(id)params
                      success:(void (^)(NSInteger status, NSString *msg, id data))success
                      failure:(void (^)(NSError *error))failure;

+ (NSURLSessionDataTask *)POST:(NSString *)URL
                        params:(id)params
     constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))constructingBodyBlock
                      progress:(nullable void (^)(NSProgress * _Nonnull))progress
                       success:(void (^)(NSInteger status, NSString *msg, id data))success
                       failure:(void (^)(NSError *error))failure;

+ (NSURLSessionDataTask *)POST:(NSString *)URL
                        params:(id)params
     constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))constructingBodyBlock
                       success:(void (^)(NSInteger status, NSString *msg, id data))success
                       failure:(void (^)(NSError *error))failure;

+ (NSURLSessionDataTask *)POST:(NSString *)URL
                        params:(id)params
                       success:(void (^)(NSInteger status, NSString *msg, id data))success
                       failure:(void (^)(NSError *error))failure;

#pragma clang diagnostic pop

@end
