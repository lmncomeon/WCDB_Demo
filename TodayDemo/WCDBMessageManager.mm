//
//  WCDBMessageManager.m
//  TodayDemo
//
//  Created by 栾美娜 on 2018/1/18.
//  Copyright © 2018年 栾美娜. All rights reserved.
//

#import "WCDBMessageManager.h"
#import "Message.h"
#import "Message+WCTTableCoding.h"
#import <WCDB/WCDB.h>

static WCTDatabase *database = nil;

static NSString *const kTalbleName = @"messagTable";

@implementation WCDBMessageManager

// 获得存放数据库文件的沙盒地址
+ (NSString *)wcdbFilePath
{
    NSArray *filePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [filePath objectAtIndex:0];
    NSString *dbFilePath = [documentPath stringByAppendingPathComponent:@"wcdb.db"];
    NSLog(@"dbFilePath: %@", dbFilePath);
    return dbFilePath;
}

// 创建 db 创建table
+ (BOOL)creatDatabaseWithTableName:(NSString *)tableName
{
    database = [[WCTDatabase alloc] initWithPath:[self wcdbFilePath]];
    
    BOOL result = [database createTableAndIndexesOfName:tableName withClass:Message.class];
    
    return result;
}

#pragma mark - 增

/** 插入一条数据 */
+ (BOOL)insertData:(Message *)message
{
    if (message == nil) {
        return NO;
    }
    
    [self creatDatabaseWithTableName:kTalbleName];
    
    BOOL result = [database insertObject:message into:kTalbleName];
    return result;
}

/** 批量插入数据 */
+ (BOOL)insertDatas:(NSArray<Message *> *)messages
{
    [self creatDatabaseWithTableName:kTalbleName];
    
    BOOL result = [database insertObjects:messages into:kTalbleName];
    return YES;
}

#pragma mark - 删除

/** 根据 localID 删除数据 */
+ (BOOL)deleteDataById:(NSInteger)localID
{
    [self creatDatabaseWithTableName:kTalbleName];
    
    BOOL result = [database deleteObjectsFromTable:kTalbleName
                                             where:Message.localID == localID];
    
    return result;
}

/** 删除所有数据 */
+ (BOOL)deleteAllDatas
{
    [self creatDatabaseWithTableName:kTalbleName];
    
    BOOL result = [database deleteAllObjectsFromTable:kTalbleName];
    
    return result;
}

#pragma mark - 改

/** 根据 localID 修改数据 */
+ (BOOL)updateData:(Message *)message
{
   [self creatDatabaseWithTableName:kTalbleName];
    
    BOOL result = [database updateRowsInTable:kTalbleName onProperties:Message.AllProperties withObject:message where:Message.localID == message.localID];
    
    return result;
}

#pragma mark - 查

/** 获取所有数据 */
+ (NSArray <Message *> *)getAllData
{
    [self creatDatabaseWithTableName:kTalbleName];
    
    return [database getAllObjectsOfClass:[Message class] fromTable:kTalbleName];
}

/** 根据 localID 查找数据 */
+ (NSArray <Message *> *)getDataByLocalID:(NSInteger)localID
{
    [self creatDatabaseWithTableName:kTalbleName];
    
    return [database getObjectsOfClass:[Message class] fromTable:kTalbleName where:Message.localID == localID];
}

@end
