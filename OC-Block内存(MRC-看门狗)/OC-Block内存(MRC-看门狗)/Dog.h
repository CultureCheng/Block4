//
//  Dog.h
//  OC-Block内存(MRC-看门狗)
//
//  Created by qingyun on 16/4/14.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject
{
//    //声明一个block通知主人
//    void(^callPerson)(Dog *thisDog,int count);
}
@property(nonatomic,assign)int dogID;//狗的身份
@property(nonatomic,assign)int barkCount;//吠叫次数
//-(void)setBark:(void (^) (Dog *thisDog,int Count))bark;
//以后的写法
@property(nonatomic,copy)void(^callPerson)(Dog *,int);
-(void)dogBark;
@end
