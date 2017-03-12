//
//  IBLSystemTool.h
//  iBookLibrary
//
//  Created by FaiWong on 2017/3/12.
//  Copyright © 2017年 FaiWong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IBLSystemTool : NSObject


/**
 *  获取设备UUID
 *
 *  @return 返回设备的UUID
 */
+ (NSString *)UUID;


/**
 *  相机权限
 */
+ (BOOL)isCanVisitCamera;


/**
 *  相册权限
 */
+ (BOOL)isCanVisitAssetsLibrary;

+ (float)totalDiskSpace;

+ (float)freeDiskSpace;

@end
