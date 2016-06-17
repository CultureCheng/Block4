//
//  Person.m
//  OC-Block内存(MRC-看门狗)
//
//  Created by qingyun on 16/4/14.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "Person.h"

@implementation Person
//为了设置宠物狗的时候监听狗的吠叫，所以应该重写setter方法
-(void)setPetDog:(Dog *)petDog
{
    if (_petDog!=petDog)
    {
        [_petDog release];
        _petDog=[petDog retain];
        //监听狗的吠叫(如果狗叫，则主人收到消息)-->block的实现！
//        [_petDog setBark:^(Dog *thisDog, int Count) {
//            NSLog(@"Person收到消息:%@,%d,%d",thisDog,thisDog.dogID,Count);
//        }];
        _petDog.callPerson=^(Dog *thisDog, int Count) {
            NSLog(@"Person收到消息:%@,%d,%d",thisDog,thisDog.dogID,Count);
        };
        NSLog(@"%@在睡觉...",self);
    }
}
-(void)dealloc
{
    NSLog(@"Person:%@被释放了...",self);
    [_petDog release];
    [super dealloc];
}
@end
