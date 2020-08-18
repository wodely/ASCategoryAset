//
//  NSDictionary+NullToNil.m
//  hxxdj
//
//  Created by aisino on 2018/4/6.
//  Copyright © 2018年 aisino. All rights reserved.
//

#import "NSDictionary+NullToNil.h"

@implementation NSDictionary (NullToNil)

- (id)noNullobjectForKey:(NSString *)key{
    //判断数据字符串是否为null,避免崩溃
    if ([self isKindOfClass:[NSDictionary class]]) {
        id dataStr = [self objectForKey:key];
        if ([dataStr isKindOfClass:[NSNull class]]) {
            return nil;
        } else {
            return dataStr;
        }
    }
    else {
        return nil;
    }
}

- (id)nullToZeroObjectForKey:(NSString *)key{
    //用于用户行为记录，当无值时返回字符串0
    id dataStr = [self objectForKey:key];
    if ([dataStr isKindOfClass:[NSNull class]]||dataStr ==nil) {
        return @"0";
    } else {
        return dataStr;
    }
}

@end
