//
//  IBLHttpTool.m
//  iBookLibrary
//
//  Created by FaiWong on 2017/3/12.
//  Copyright © 2017年 FaiWong. All rights reserved.
//

#import "IBLHttpTool.h"



@implementation IBLHttpTool


+ (IBLHttpTool *)sharedInstance
{
    static IBLHttpTool *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
    
}


+ (void)GET:(NSString *)URLString
 parameters:(id)parameters
    success:(IBLHttpToolSuccessBlock)success
    failure:(IBLHttpToolFailBlock)failure
{
    //发起请求
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    //    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain", nil];
    
    manager.securityPolicy = [AFSecurityPolicy defaultPolicy];
    
    [manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error) {
            failure(error);
        }
    }];
}


+ (void)POST:(NSString *)URLString
  parameters:(NSDictionary *)parameters
     success:(IBLHttpToolSuccessBlock)success
     failure:(IBLHttpToolFailBlock)failure
{
    //发起请求
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    //    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain", nil];
    
    manager.securityPolicy = [AFSecurityPolicy defaultPolicy];
    
    [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}


@end
