//
//  main.m
//  Block
//
//  Created by xiaoyuan on 2019/6/27.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYBlock.h"
#import "XYBlock1.h"
#import "XYBlock2.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        [[XYBlock new] method];
        [[XYBlock1 new] method];
        [[XYBlock2 new] method];
    }
    return 0;
}
