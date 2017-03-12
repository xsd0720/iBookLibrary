//
//  LWDBTool.h
//  lilworld
//
//  Created by xwmedia01 on 15/8/7.
//  Copyright (c) 2015年 zp. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FMDB.h"

@interface IBLDBTool : NSObject


/**
 *  创建数据库
 *
 *  @param dbPath 数据库地址
 *
 *  @return 数据库实例
 */
+(instancetype)createDBWithPath:(NSString *)dbPath;


/**
 *  创建数据库的同时创建表
 *
 *  @param dbPath    数据库地址
 *  @param tableName 表明
 *
 *  @return 数据库实例
 */
+(instancetype)createDBWithPath:(NSString *)dbPath tableName:(NSString *)tableName;


/**
 *  查询表内容
 *
 *  @param tableName 表名
 */
-(void)queryWithTableName:(NSString *)tableName;
@end
