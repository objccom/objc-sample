//
//  XYBlock2.m
//  Block
//
//  Created by xiaoyuan on 2019/6/27.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

#import "XYBlock2.h"

// __block相关笔试题

@implementation XYBlock2
- (void)method {
    __block int multiplier = 6;
    int (^block)(int) = ^int(int num){
        return num * multiplier;
    };
    
    multiplier = 4;
    NSLog(@"result is %d", block(2));
}
@end
