//
//  Woman.m
//  Load-and-Initialize
//
//  Created by xiaoyuan on 2019/6/17.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

#import "Woman.h"
#import "Worker.h"

@implementation Woman

+ (void)load {
    NSLog(@"%s", __func__);
    
    Worker *worker = [Worker new];
    [worker originalMethod];
    // 输出的结果为 Original Output，说明worker调用的是原始的`originalMethod`方法，而其交换后的方法未被调用
    
}
+ (void)initialize {
    NSLog(@"%s", __func__);
}
@end
