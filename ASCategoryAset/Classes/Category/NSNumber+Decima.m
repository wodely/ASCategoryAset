//
//  NSNumber+Decima.m
//  hxxdj
//
//  Created by 刘 on 2019/10/12.
//  Copyright © 2019 aisino. All rights reserved.
//

#import "NSNumber+Decima.h"

@implementation NSNumber (Decima)
- (NSString *)decimalStringlength:(NSInteger) length
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.maximumFractionDigits = length;//最多保留几位小数，就是几
    formatter.groupingSeparator = @"";
    return [formatter stringFromNumber:self];
}


@end
