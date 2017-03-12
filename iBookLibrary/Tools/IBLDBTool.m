//
//  LWDBTool.m
//  lilworld
//
//  Created by xwmedia01 on 15/8/7.
//  Copyright (c) 2015年 zp. All rights reserved.
//

#import "IBLDBTool.h"

@interface IBLDBTool()

@property (nonatomic, strong) FMDatabaseQueue *queue;

@end

@implementation IBLDBTool



/**
 *  创建数据库
 *
 *  @param dbPath 数据库地址
 *
 *  @return 数据库实例
 */
+(instancetype)createDBWithPath:(NSString *)dbPath{
    //实例化self
    IBLDBTool *dbTool = [[self alloc] init];
    
    //得到数据库
    dbTool.queue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    
    return dbTool;
}



/**
 *  创建数据库的同时创建表
 *
 *  @param dbPath    数据库地址
 *  @param tableName 表明
 *
 *  @return 数据库实例
 */
+(instancetype)createDBWithPath:(NSString *)dbPath tableName:(NSString *)tableName{
    //实例化self
    IBLDBTool *dbTool = [[self alloc] init];
    
    //得到数据库
    dbTool.queue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    
    //打开数据库
    [dbTool.queue inDatabase:^(FMDatabase *db) {
        
        //创表
        NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (username text PRIMARY KEY, member_name text NOT NULL, avatar text NOT NULL, remark_name text, friend_id text);", tableName];
        
        //执行sql 语句
        BOOL result = [db executeUpdate:sql];
        
        //是否创建成功
        if (result) {
            
             NSLog(@"创表成功");
        
        }
        else{
            
            NSLog(@"创表失败");
        
        }

        
    }];
    
    return dbTool;
   
}


/**
 *  查询表内容
 *
 *  @param tableName 表名
 */
-(void)queryWithTableName:(NSString *)tableName{
    
    [self.queue inDatabase:^(FMDatabase *db) {
        
        //查询表所有内容
        FMResultSet *resultSet = [db executeQuery:[NSString stringWithFormat:@"SELECT * FROM %@", tableName]];
        while ([resultSet next]) {
//            NSString *username = [resultSet stringForColumn:@"username"];
        }

    }];
}
@end
