//
//  NSString+Extentsion.h
//  gongchengbang
//
//  Created by YAS-Macmini2 on 15/9/14.
//  Copyright (c) 2015年 RaymondNi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface NSString (Extentsion)
+(NSString *)stringWithFloat:(CGFloat)floatValue suffix:(NSUInteger)suffix;
+(NSString *)stringWithDouble:(double)doubleValue suffix:(NSUInteger)suffix;
+(NSString *)stringWithFloat:(CGFloat)floatValue suffix:(NSUInteger)suffix isShow:(BOOL)isShow;
+(NSString *)stringWithDouble:(double)doubleValue suffix:(NSUInteger)suffix isShow:(BOOL)isShow;

-(CGSize)sizeOfTextFontSize:(CGFloat)fontSize maxSize:(CGSize)maxSize;

-(CGFloat)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width;


- (BOOL)isChinese;

- (BOOL)includeChinese;//判断是否含有汉字

/**
 判断字符串是否含有某字符串 防止字符串为空时崩溃
 */
- (BOOL)ascontainsString:(NSString*)string;
@end
