//
//  main.m
//  Foundation
//
//  Created by swae on 2019/5/12.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDecimalExample.h"
#import "NSNumberExample.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        [[NSDecimalExample new] runSample];
        [[NSNumberExample new] runExample];
    }
    return 0;
}
