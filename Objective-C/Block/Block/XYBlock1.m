//
//  XYBlock1.m
//  Block
//
//  Created by xiaoyuan on 2019/6/27.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

#import "XYBlock1.h"

// 我们创建`XYBlock1`，并在其`-method`方法的block中使用以上类型的变量，以验证block对变量的截获。

@implementation XYBlock1

// 全局变量
int global_var = 4;
// 静态全局变量
static int static_global_var = 5;

- (void)method
{
    // 基本数据类型的变量
    int var = 1;
    // 对象类型的局部变量
    __unsafe_unretained id unsafe_obj = nil;
    __strong id strong_obj = nil;
    // 静态局部变量
    static int static_var = 3;
    void (^ block)(void) = ^{
        NSLog(@"局部变量<基本数据类型> var is %d", var);
        NSLog(@"局部变量<__unsafe_unretained 对象类型> unsafe_obj is %@", unsafe_obj);
        NSLog(@"局部变量<__strong 对象类型> strong_obj is %@", strong_obj);
        NSLog(@"静态局部变量 static_var is %d", static_var);
        NSLog(@"全局变量 global_var is %d", global_var);
        NSLog(@"静态全局变量 static_global_var is %d", static_global_var);
    };
    
    block();
    
    
}
@end
