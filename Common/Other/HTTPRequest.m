//
//  HTTPRequest.m
//  XXComposition
//
//  Created by 邓顺来 on 2017/6/17.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "HTTPRequest.h"

@interface HTTPRequest ()

@property (strong, nonatomic) AFHTTPSessionManager *session;

@end

@implementation HTTPRequest

+ (instancetype)sharedInstance
{
    static HTTPRequest *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[HTTPRequest alloc] init];
        AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
        session.requestSerializer.timeoutInterval = 30;
        session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/json",@"application/json",@"text/JavaScript",@"image/jpeg",@"text/plain", nil];
        _sharedInstance.session = session;
    });
    return _sharedInstance;
}

+ (NSURLSessionDataTask *)GET:(NSString *)URL
                       params:(NSDictionary *)params
                     progress:(void (^)(NSProgress *progress))progress
                      success:(void (^)(NSInteger status, NSString *msg, id data))success
                      failure:(void (^)(NSError *error))failure
{
    NSLog(@"%@",params);
    AFHTTPSessionManager *session = [HTTPRequest sharedInstance].session;
    NSURLSessionDataTask *task =
    [session GET:URL parameters:params progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSInteger status;
        NSString *message;
        id data;
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if ([response isKindOfClass:[NSDictionary class]]) {
            status = 200;
            message = @"";
            data = response;
            NSLog(@"%@",response);
        } else {
            status = 3840;
            message = @"未知错误";
            data = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSLog(@"%@",data);
        }
        success(status,message,data);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        failure(error);
    }];
    return task;
}

+ (NSURLSessionDataTask *)GET:(NSString *)URL
                       params:(NSDictionary *)params
                      success:(void (^)(NSInteger status, NSString *msg, id data))success
                      failure:(void (^)(NSError *error))failure
{
    return [self GET:URL params:params progress:nil success:success failure:failure];
}

+ (NSURLSessionDataTask *)POST:(NSString *)URL
                        params:(NSDictionary *)params
     constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))constructingBodyBlock
                      progress:(void (^)(NSProgress *progress))progress
                       success:(void (^)(NSInteger status, NSString *msg, id data))success
                       failure:(void (^)(NSError *error))failure
{
    NSLog(@"%@",params);
    AFHTTPSessionManager *session = [HTTPRequest sharedInstance].session;
    NSURLSessionDataTask *task =
    [session POST:URL parameters:params constructingBodyWithBlock:constructingBodyBlock progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSInteger status;
        NSString *message;
        id data;
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if ([response isKindOfClass:[NSDictionary class]]) {
            status = 200;
            message = @"";
            data = response;
            NSLog(@"%@",response);
        } else {
            status = 3840;
            message = @"未知错误";
            data = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSLog(@"%@",data);
        }
        success(status, message, data);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        failure(error);
    }];
    return task;
}

+ (NSURLSessionDataTask *)POST:(NSString *)URL
                        params:(NSDictionary *)params
     constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))constructingBodyBlock
                       success:(void (^)(NSInteger status, NSString *msg, id data))success
                       failure:(void (^)(NSError *error))failure
{
    return [self POST:URL params:params constructingBodyWithBlock:constructingBodyBlock progress:nil success:success failure:failure];
}

+ (NSURLSessionDataTask *)POST:(NSString *)URL
                        params:(NSDictionary *)params
                       success:(void (^)(NSInteger status, NSString *msg, id data))success
                       failure:(void (^)(NSError *error))failure
{
    return [self POST:URL params:params constructingBodyWithBlock:nil progress:nil success:success failure:failure];
}

@end
