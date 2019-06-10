//
//  NSNumberExample.m
//  Foundation
//
//  Created by swae on 2019/5/12.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

#import "NSNumberExample.h"

NS_ENUM(NSInteger, NSNumberType) {
    NSNumberTypeUnknow,
    NSNumberTypeFloat,
    NSNumberTypeDouble,
    NSNumberTypeInt,
    NSNumberTypeBOOL,
    NSNumberTypeLong,
};

@implementation NSNumberExample

// 封包
- (void)scalarValueToNumber {
    // 数值前加@标记
    NSNumber *num1 = @1;
    // 通过类工厂方法初始化
    NSNumber *num2 = [NSNumber numberWithInteger:20];
    // 声明一个16进制
    NSNumber *num3 = @0xff;
    // 声明浮点数
    NSNumber *floatNum = @0.18f;
    // 声明BOOL 类型
    NSNumber *boolNumber = @NO;
    // 将一个纯量数值的变量封装为一个number对象
    int a = 100;
    NSNumber *numObj = @(a);
    
    NSLog(@"%@", num1);
    NSLog(@"%@", num2);
    NSLog(@"%@", num3);
    NSLog(@"%@", floatNum);
    NSLog(@"%@", boolNumber);
    NSLog(@"%@", numObj);
    
    // 这里注意，16进制默认是无符号整形，如果需要符号数，只能使用：
    NSNumber *aNumber = @0xff;
    NSLog(@"%@", aNumber.stringValue);
    // 输出为`255`
    NSNumber *aCharObj = [[NSNumber alloc] initWithChar:0xFF];
    NSLog(@"%@", aCharObj.stringValue);
    // 输出为`-1`
}

// 不同类型的数值转换，关注精度问题
- (void)example2 {
    NSNumber *floatNum = @1.88;
    NSLog(@"%d", [floatNum  intValue]); // 结果为1
}

- (void)compareExample {
    NSNumber *num1 = @10;
    NSNumber *num2 = @2;
    
    // 第一种：运算符比较 需要先解包，然后使用运算符，
    // 注意：使用num1 > num2这种比较指针的大小是错误的
    if (num1.integerValue > num2.integerValue) {
        NSLog(@"num1 > num2");
    }
    
    // 第二种：compare 比较
    if ([num1 compare:num2] == NSOrderedAscending) { //
        // NSOrderedAscending 升序 相当于 num1.integerValue < num2.integerValue
        NSLog(@"num1 < num2");
    }
}

- (void)objCTypeExample {
    NSNumber *num = @(2.29);
    NSLog(@"c type is %s", [num objCType]); // c type is d
}


- (enum NSNumberType)originTypeFromNumber:(NSNumber *)obj {
    enum NSNumberType type = NSNumberTypeUnknow;
    // 判断是不是数字类型
    if ([obj isKindOfClass:[NSNull class]]) {
        return type;
    }
    if ([obj isKindOfClass:[NSNumber class]]) {
        if (strcmp([obj objCType], @encode(float)) == 0) {
            type = NSNumberTypeFloat;
        }
        else if (strcmp([obj objCType], @encode(double)) == 0) {
            type = NSNumberTypeDouble;
        }
        else if (strcmp([obj objCType], @encode(int)) == 0) {
            type = NSNumberTypeInt;
        }
        else if (strcmp([obj objCType], @encode(BOOL)) == 0) {
            type = NSNumberTypeBOOL;
        }
        else if (strcmp([obj objCType], @encode(long)) == 0) {
            type = NSNumberTypeLong;
        }
    }
    return type;
}

- (void)example3 {
    NSNumber *num1 = @(10.9);
    enum NSNumberType type = [self originTypeFromNumber:num1];
    NSLog(@"%ld", (long)type);
}

- (void)runExample {
    NSLog(@"begin: %@, %s", NSStringFromClass([self class]), __func__);
    [self scalarValueToNumber];
    [self example2];
    [self compareExample];
    [self objCTypeExample];
    [self example3];
    NSLog(@"%@, %s end", NSStringFromClass([self class]), __func__);
}

@end
