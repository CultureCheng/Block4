//
//  main.m
//  OC-Block内存(MRC-看门狗)
//
//  Created by qingyun on 16/4/14.
//  Copyright © 2016年 QingYun. All rights reserved.
// MRC（强引用） retain与release
// ARC (弱引用 __weak) 调用完  立即被释放  更便捷!
// block 传值！！！


#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p1=[Person new];
        Dog *d1=[Dog new];
        [d1 setDogID:1000];
        //将狗设置给主人
        NSLog(@"1==>d1=%ld",d1.retainCount);//1
        [p1 setPetDog:d1];
        NSLog(@"2==>d1=%ld",d1.retainCount);//2
        [d1 dogBark];
        NSLog(@"3==>d1=%ld",d1.retainCount);//3
        //NSTimer要加入主循环队列才可以工作
        [[NSRunLoop mainRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:6.0]];
        [d1 release];
        NSLog(@"4==>d1=%ld",d1.retainCount);//2
        Dog *d2=[Dog new];
        [d2 setDogID:1001];
        [p1 setPetDog:d2];
        [d2 dogBark];
        
        [d2 release];
        [p1 release];
        
    }
    return 0;
}
