//
//  WCDBMessageManager.h
//  TodayDemo
//
//  Created by 栾美娜 on 2018/1/18.
//  Copyright © 2018年 栾美娜. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Message;
@protocol WCTTableCoding;

@interface WCDBMessageManager : NSObject

/** 插入一条数据 */
+ (BOOL)insertData:(Message *)message;

/** 批量插入数据 */
+ (BOOL)insertDatas:(NSArray<Message *> *)messages;

/** 根据 localID 删除数据 */
+ (BOOL)deleteDataById:(NSInteger)localID;

/** 删除所有数据 */
+ (BOOL)deleteAllDatas;

/** 根据 localID 修改数据 */
+ (BOOL)updateData:(Message *)message;

/** 获取所有数据 */
+ (NSArray <Message *> *)getAllData;

/** 根据 localID 查找数据 */
+ (NSArray <Message *> *)getDataByLocalID:(NSInteger)localID;

@end
