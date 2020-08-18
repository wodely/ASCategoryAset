//
//  NSDictionary+NullToNil.h
//  hxxdj
//
//  Created by aisino on 2018/4/6.
//  Copyright © 2018年 aisino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (NullToNil)
//替换原有方法，防止null值崩溃
- (id)noNullobjectForKey:(NSString *)key;

- (id)nullToZeroObjectForKey:(NSString *)key;

@end
