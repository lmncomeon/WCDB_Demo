//
//  Message+WCTTableCoding.m
//  TodayDemo
//
//  Created by 栾美娜 on 2018/1/18.
//  Copyright © 2018年 栾美娜. All rights reserved.
//

#import "Message+WCTTableCoding.h"

@implementation Message (WCTTableCoding)

WCDB_IMPLEMENTATION(Message)
WCDB_SYNTHESIZE(Message, localID)
WCDB_SYNTHESIZE(Message, content)
WCDB_SYNTHESIZE(Message, createTime)
WCDB_SYNTHESIZE(Message, modifiedTime)

WCDB_PRIMARY(Message, localID)

WCDB_INDEX(Message, "_index", createTime)

@end
