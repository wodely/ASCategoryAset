//
//  UITextField+Helper.m
//  SheQuEJia
//
//  Created by aisino on 2018/1/29.
//  Copyright © 2018年 aisino. All rights reserved.
//

#import "UITextField+Helper.h"

@implementation UITextField (Helper)
+ (UITextField *)textFieldWithRect:(CGRect)rect text:(NSString *)text placeholder:(NSString *)placeholder textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize textAlignment:(NSTextAlignment)textAlignment{
    __autoreleasing UITextField *textField = [[UITextField alloc]init];
    textField.frame = rect;
    textField.text = text;
    textField.textColor = textColor;
    textField.placeholder = placeholder;
    textField.font = [UIFont systemFontOfSize:fontSize];
    textField.textAlignment = textAlignment;
    return textField;
}

@end
