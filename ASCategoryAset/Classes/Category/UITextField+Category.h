//
//  UITextField+Category.h
//  textfiled
//
//  Created by lyh on 2019/7/16.
//  Copyright © 2019 DZC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Category)
/**
 length > 0, 设置integerLength和decimalsLength无效
 */
@property (nonatomic, assign) NSInteger length;
/**
 小数点以前整数的长度
 仅在UIKeyboardTypeNumberPad或UIKeyboardTypeDecimalPad 有效
 默认为0:整数的长度不限制
 UIKeyboardTypeNumberPad 不包括整数0
 */
@property (nonatomic, assign) NSInteger integerLength;
/**
 小数点以后小数的长度
 仅在UIKeyboardTypeDecimalPad有效
 默认为0:小数的长度不限制
 */
@property (nonatomic, assign) NSInteger decimalsLength;

/**
 字符串的字节长度
 默认为0 字节长度不限制
 */
@property (nonatomic, assign) NSInteger bytsLength;

/**
 验证输入内容格式是否正确
        *
            - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
        *
 @param text 值为:[textField.text stringByReplacingCharactersInRange:range withString:string]
 @return 返回是否验证通过
 */
- (BOOL)checkWithText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
