//
//  HTTPRequest.m
//  XXComposition
//
//  Created by 邓顺来 on 2017/6/17.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "HTTPRequest.h"

@implementation HTTPRequest

+ (NSURLSessionDataTask *)GET:(NSString *)URL
                       params:(id)params
                     progress:(void (^)(NSProgress * _Nonnull))progress
                      success:(void (^)(NSInteger status, NSString *msg, id data))success
                      failure:(void (^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    NSURLSessionDataTask *task =
    [manager GET:URL parameters:params progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(-1,@"",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        failure(error);
    }];
    return task;
}

+ (NSURLSessionDataTask *)GET:(NSString *)URL
                       params:(id)params
                      success:(void (^)(NSInteger status, NSString *msg, id data))success
                      failure:(void (^)(NSError *error))failure
{
    return [self GET:URL params:params progress:nil success:success failure:failure];
}

+ (NSURLSessionDataTask *)POST:(NSString *)URL
                        params:(id)params
     constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))constructingBodyBlock
                      progress:(nullable void (^)(NSProgress * _Nonnull))progress
                       success:(void (^)(NSInteger status, NSString *msg, id data))success
                       failure:(void (^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    NSURLSessionDataTask *task =
    [manager POST:URL parameters:params constructingBodyWithBlock:constructingBodyBlock progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(-1,@"",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        failure(error);
    }];
    return task;
}

+ (NSURLSessionDataTask *)POST:(NSString *)URL
                        params:(id)params
     constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))constructingBodyBlock
                       success:(void (^)(NSInteger status, NSString *msg, id data))success
                       failure:(void (^)(NSError *error))failure
{
    return [self POST:URL params:params constructingBodyWithBlock:constructingBodyBlock progress:nil success:success failure:failure];
}

+ (NSURLSessionDataTask *)POST:(NSString *)URL
                        params:(id)params
                       success:(void (^)(NSInteger status, NSString *msg, id data))success
                       failure:(void (^)(NSError *error))failure
{
    return [self POST:URL params:params constructingBodyWithBlock:nil progress:nil success:success failure:failure];
}

@end
