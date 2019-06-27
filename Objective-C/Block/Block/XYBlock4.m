//
//  XYBlock4.m
//  Block
//
//  Created by swae on 2019/6/28.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

#import "XYBlock4.h"

// Block循环引用的相关问题

@interface XYBlock4 ()

@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, copy) NSString *(^strBlock)(NSString *num);

@end

@implementation XYBlock4

- (void)method {
    _array = [NSMutableArray arrayWithObject:@"block"];
    
    // 解决循环引用
    __weak NSMutableArray *weakArray = _array;
    _strBlock = ^NSString *(NSString *num) {
        // 在此block内使用成员变量`_array`，会产生警告： Block implicitly retains 'self'; explicitly mention 'self' to indicate this is intended behavior
        return [NSString stringWithFormat:@"helloOC_%@", weakArray[0]];
    };
    _strBlock(@"hello");
}

@end
