//
//  IBLHttpTool.h
//  iBookLibrary
//
//  Created by FaiWong on 2017/3/12.
//  Copyright © 2017年 FaiWong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFNetworking.h"

/**
 *  请求成功回调Block
 *
 *  @param responsObject 返回请求的数据结果
 */
typedef void(^IBLHttpToolSuccessBlock)(id responsObject);

/**
 *  请求失败回调Block
 *
 *  @param error 返回请求结果的错误代码
 */
typedef void(^IBLHttpToolFailBlock)(NSError *error);

@interface IBLHttpTool : NSObject


/**
 *  单例
 *
 *  @return 单例对象
 */
+ (IBLHttpTool *)sharedInstance;


/**
 *  GET 请求
 *
 *  @param URLString  请求地址URL
 *  @param parameters 附带参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
+ (void)GET:(NSString *)URLString
 parameters:(id)parameters
    success:(IBLHttpToolSuccessBlock)success
    failure:(IBLHttpToolFailBlock)failure;


/**
 *  POST 请求
 *
 *  @param URLString  请求地址URL
 *  @param parameters 附带参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
+ (void)POST:(NSString *)URLString
  parameters:(NSDictionary *)parameters
     success:(IBLHttpToolSuccessBlock)success
     failure:(IBLHttpToolFailBlock)failure;

@end
