//
//  UILabel+Helpers.h
//  SheQuEJia
//
//  Created by aisino on 2018/1/29.
//  Copyright © 2018年 aisino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Helpers)
+ (UILabel *)labelWithRect:(CGRect)rect text:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize textAlignment:(NSTextAlignment)textAlignment;
+ (UILabel *)labelWithRect:(CGRect)rect text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment;
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize;

@end
