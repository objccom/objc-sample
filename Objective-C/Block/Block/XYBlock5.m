//
//  XYBlock5.m
//  Block
//
//  Created by swae on 2019/6/28.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

#import "XYBlock5.h"

// `__block`引发的循环引用

@interface XYBlock5 ()

@property (nonatomic, assign) int var;
@property (nonatomic, copy) int (^ blk)(int num);

@end

@implementation XYBlock5

- (void)dealloc {
    NSLog(@"%s", __func__);
}

- (void)method {
    __block XYBlock5 *blockSelf = self;
    _blk = ^int (int num) {
        
        int ret = num * blockSelf.var;
        // 在block表达式内部加入`blockSelf = nil;`的赋值操作，就可以规避循环引用
        blockSelf = nil;
        return ret;
    };
    _blk(3);
}

@end
