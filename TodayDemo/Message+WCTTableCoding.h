//
//  Message+WCTTableCoding.h
//  TodayDemo
//
//  Created by 栾美娜 on 2018/1/18.
//  Copyright © 2018年 栾美娜. All rights reserved.
//

#import "Message.h"
#import <WCDB/WCDB.h>

@interface Message (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(localID)
WCDB_PROPERTY(content)
WCDB_PROPERTY(createTime)
WCDB_PROPERTY(modifiedTime)

@end
