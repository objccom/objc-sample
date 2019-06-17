//
//  main.m
//  Load-and-Initialize
//
//  Created by xiaoyuan on 2019/6/17.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Worker.h"
#import "Woman.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Worker *worker = [Worker new];
        [worker originalMethod];
        // 输出的结果为 Swizzled Output，说明worker 调用的方法为`originalMethod`交换后的`swizzledMethod`方法
        
        Woman *w = [Woman new];
    }
    return 0;
}
