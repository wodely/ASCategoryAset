//
//  NSString+Extentsion.m
//  gongchengbang
//
//  Created by YAS-Macmini2 on 15/9/14.
//  Copyright (c) 2015年 RaymondNi. All rights reserved.
//

#import "NSString+Extentsion.h"
#import <UIKit/UIKit.h>
@implementation NSString (Extentsion)

+(NSString *)stringWithFloat:(CGFloat)floatValue suffix:(NSUInteger)suffix {
    return [self stringWithFloat:floatValue suffix:suffix isShow:NO];
}

+(NSString *)stringWithDouble:(double)doubleValue suffix:(NSUInteger)suffix {
    return [self stringWithDouble:doubleValue suffix:suffix isShow:NO];
}

+(NSString *)stringWithFloat:(CGFloat)floatValue suffix:(NSUInteger)suffix isShow:(BOOL)isShow {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    NSMutableString * temp = [NSMutableString stringWithString:@"0"];
    
    if (isShow) {
        [temp appendString:@"."];
        for (NSUInteger i = 0; i < suffix; i++) {
            [temp appendString:@"0"];
        }
    } else {
        CGFloat tempfloat = roundf(floatValue);
        if (tempfloat != floatValue)  {
            [temp appendString:@"."];
            for (NSUInteger i = 0; i < suffix; i++) {
                [temp appendString:@"0"];
            }
        }
    }
    
    [numberFormatter setPositiveFormat:temp];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:floatValue]];
    
    return formattedNumberString;
}

+(NSString *)stringWithDouble:(double)doubleValue suffix:(NSUInteger)suffix isShow:(BOOL)isShow {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    NSMutableString * temp = [NSMutableString stringWithString:@"0"];
    
    if (isShow) {
        [temp appendString:@"."];
        for (NSUInteger i = 0; i < suffix; i++) {
            [temp appendString:@"0"];
        }
    } else {
        double tempDouble = round(doubleValue);
        if (tempDouble != doubleValue) {
            [temp appendString:@"."];
            for (NSUInteger i = 0; i < suffix; i++) {
                [temp appendString:@"0"];
            }
        }
    }
    
    [numberFormatter setPositiveFormat:temp];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:doubleValue]];
    
    return formattedNumberString;
}

-(CGSize)sizeOfTextFontSize:(CGFloat)fontSize maxSize:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

-(CGFloat)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    //    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    /** 行高 */
    paraStyle.lineSpacing = lineSpeace;
    // NSKernAttributeName字体间距
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    CGSize size = [self boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}

- (BOOL)isChinese
{
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}
- (BOOL)includeChinese
{
    for(int i=0; i< [self length];i++)
    {
        int a =[self characterAtIndex:i];
        if( a >0x4e00&& a <0x9fff){
            return YES;
        }
    }
    return NO;
}

@end
