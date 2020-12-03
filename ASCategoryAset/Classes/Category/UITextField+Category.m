//
//  UITextField+Category.m
//  textfiled
//
//  Created by lyh on 2019/7/16.
//  Copyright © 2019 DZC. All rights reserved.
//

#import "UITextField+Category.h"
#import <objc/runtime.h>
// 定义关联的key
static const char *lengthKey = "length";

static const char *decimalsLengthKey = "decimalsLength";

static const char *integerLengthKey = "integerLength";

static const char *bytsLengthKey = "bytsLengthKey";

@implementation UITextField (Category)

- (void)setLength:(NSInteger)length {
     objc_setAssociatedObject(self, lengthKey, @(length), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger )length{
    return [objc_getAssociatedObject(self, lengthKey) integerValue];
}

- (void)setDecimalsLength:(NSInteger)decimalsLength {
    objc_setAssociatedObject(self, decimalsLengthKey, @(decimalsLength), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger )decimalsLength{
    return [objc_getAssociatedObject(self, decimalsLengthKey) integerValue];
}

- (void)setIntegerLength:(NSInteger)integerLength {
    objc_setAssociatedObject(self, integerLengthKey, @(integerLength), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger )integerLength{
    return [objc_getAssociatedObject(self, integerLengthKey) integerValue];
}


- (void)setBytsLength:(NSInteger)bytsLength{
    objc_setAssociatedObject(self,bytsLengthKey, @(bytsLength), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSInteger)bytsLength{
   return [objc_getAssociatedObject(self, bytsLengthKey) integerValue];
}

- (BOOL)checkWithText:(NSString *)text {
    return [self checkFiguresWithText:text];
}

/// 验证位数
- (BOOL)checkFiguresWithText:(NSString *)text {
    
//    if (self.bytsLength>0) {
//        return !([ASToolClass getTextCharLength:text]>self.bytsLength);
//    }
    
    if (self.length > 0) {
        return !(text.length > self.length);
    }
    switch (self.keyboardType) {
        case UIKeyboardTypeNumberPad:
        {
            NSString *regex = @"（[1-9]\\d*)?";
            if (self.integerLength > 0) {
                regex = [NSString stringWithFormat:@"([1-9]\\d{0,%ld})?",(long)self.integerLength-1];
            }
            NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
            BOOL flag = [phoneTest evaluateWithObject:text];
            if (!flag) {
                return NO;
            }
        }
            break;
        case UIKeyboardTypeDecimalPad:
        {
            NSString *integerRegex = [NSString stringWithFormat:@"{0,%ld}",(long)self.integerLength-1];
            NSString *decimalsRegex =[NSString stringWithFormat:@"{0,%ld}",(long)self.decimalsLength];
            if ([integerRegex isEqualToString:@"{0,0}"]|| self.integerLength == 0) {
                integerRegex = @"*";
            }
            if ([decimalsRegex isEqualToString:@"{0,0}"]) {
                decimalsRegex = @"*";
            }
            NSString *regex = [NSString stringWithFormat:@"(([0]|(0[.]\\d{0,%ld}))|(([1-9]\\d%@)(([.]\\d%@)?)))?",self.decimalsLength,integerRegex,decimalsRegex];
            NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
            BOOL flag = [phoneTest evaluateWithObject:text];
            if (!flag) {
                return NO;
            }
        }
            break;
            
        default:
        {
            if (self.length > 0) {
                return !(text.length > self.length);
            }
            return true;
        }
            break;
    }
    return true;
}

@end
