//
//  NSDecimalExample.m
//  Foundation
//
//  Created by swae on 2019/5/12.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

#import "NSDecimalExample.h"

@implementation NSDecimalExample

- (void)runSample {
    [self NSDecimalCopyExample];
}


- (void)NSDecimalCopyExample {
    for (int i = 0 ; i<2; i++) {
        NSString *str =[NSString stringWithFormat:@"1.22%d",i];
        NSLog(@"小数值：%@\n",str);
        NSDecimal result;
        NSScanner *theScanner = [[NSScanner alloc] initWithString:str];
        
        [theScanner scanDecimal:&result];
        
        NSDecimal coord;
        NSDecimalCopy(&coord,&result);
        
        NSLocale *locale =[[NSLocale alloc] initWithLocaleIdentifier:@"fr_FR"];
        NSLog(@"%@",NSDecimalString(&coord, locale));
        
    }
}

@end
