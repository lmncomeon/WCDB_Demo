//
//  ViewController.m
//  TodayDemo
//
//  Created by 栾美娜 on 2018/1/17.
//  Copyright © 2018年 栾美娜. All rights reserved.
//

#import "ViewController.h"
#import "Message.h"
#import "WCDBMessageManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray <Message *> *resultArr = [WCDBMessageManager getAllData];

    for (int i = 0; i < resultArr.count; i++) {
        NSLog(@"%d",resultArr[i].localID);
        NSLog(@"%@", resultArr[i].content);
    }
    
    

}

@end

