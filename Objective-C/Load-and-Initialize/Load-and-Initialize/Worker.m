//
//  Worker.m
//  Load-and-Initialize
//
//  Created by xiaoyuan on 2019/6/17.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

#import "Worker.h"
#import <objc/runtime.h>

@implementation Worker

+ (void)load {
    NSLog(@"%s", __func__);
    
    Method originalMethod = class_getInstanceMethod([self class], @selector(originalMethod));
    Method swizzledMethod = class_getInstanceMethod([self class], @selector(swizzledMethod));
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

- (void)originalMethod {
    NSLog(@"Original Output");
}

- (void)swizzledMethod {
    NSLog(@"Swizzled Output");
}

@end
