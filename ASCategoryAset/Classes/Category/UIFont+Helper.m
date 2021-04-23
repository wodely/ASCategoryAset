//
//  UIFont+Helper.m
//  hxxdj
//
//  Created by aisino on 2018/5/2.
//  Copyright © 2018年 aisino. All rights reserved.
//

#import "UIFont+Helper.h"

@implementation UIFont (Helper)

+ (UIFont *)customFont:(CGFloat)fontsize
{
    if (fontsize<0) 
    {
        fontsize = 17;
    }
    return [UIFont fontWithName:@"iconfont" size:fontsize];
}

@end
