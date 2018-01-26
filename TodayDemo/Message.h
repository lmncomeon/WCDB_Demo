//
//  Message.h
//  TodayDemo
//
//  Created by 栾美娜 on 2018/1/18.
//  Copyright © 2018年 栾美娜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject

@property int localID;
@property(retain) NSString *content;
@property(retain) NSDate *createTime;
@property(retain) NSDate *modifiedTime;
@property(assign) int unused; //You can only define the properties you need

@end
