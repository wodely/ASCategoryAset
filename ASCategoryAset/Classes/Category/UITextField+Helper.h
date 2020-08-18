//
//  UITextField+Helper.h
//  SheQuEJia
//
//  Created by aisino on 2018/1/29.
//  Copyright © 2018年 aisino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Helper)
+ (UITextField *)textFieldWithRect:(CGRect)rect text:(NSString *)text placeholder:(NSString *)placeholder textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize textAlignment:(NSTextAlignment)textAlignment;
@end
