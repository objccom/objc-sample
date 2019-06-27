//
//  XYBlock3.m
//  Block
//
//  Created by swae on 2019/6/28.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

#import "XYBlock3.h"

// 对__block的`__forwarding`总结

@interface XYBlock3 ()

@property (nonatomic, copy) int(^blk)(int num);

@end

@implementation XYBlock3

- (void)method {

    __block int multipliter = 10;
    _blk = ^int(int num) {
        return num * multipliter;
    };
    
    multipliter = 6;
    [self executeBlock];
}

- (void)executeBlock {
    // 这是百度的笔试的真题，这道题实际上是考验我们对`__forwarding`的理解
    int result = _blk(4);
    NSLog(@"result is %d", result);
    // 输出结果 result is 24
}

@end
