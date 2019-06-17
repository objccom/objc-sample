//
//  People.m
//  Load-and-Initialize
//
//  Created by xiaoyuan on 2019/6/17.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

#import "People.h"

@implementation People

+ (void)load {
    NSLog(@"%s", __func__);
}

+ (void)initialize  {
    if (self == [People class]) {
        NSLog(@"%s", __func__);
    }
}
@end
