//
//  UIImage+Extension.h
//  gongchengbang
//
//  Created by YAS-Macmini2 on 15/9/14.
//  Copyright (c) 2015年 RaymondNi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

+(UIImage *)resizeImage:(NSString *)imgName;

// 按指定尺寸 等比例压缩图片
+(UIImage *)scaleRatioWithImage:(UIImage*)image size:(CGSize)newSize;

// 按指定尺寸 压缩图片
+(UIImage*)scaleSimpleWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;

// 图片由颜色值生成
+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

// 图片由文字生成
+ (UIImage *)imageWithText:(NSString *)str withBgImage:(UIImage *)image withFont:(CGFloat)fontSize withTextColor:(UIColor *)textColor;
+ (UIImage *)imageWithTTFText:(NSString *)str WithTTFName:(NSString *)ttfName withBgImage:(UIImage *)img withFont:(CGFloat)fontSize withTextColor:(UIColor *)textColor imageSize:(CGSize)size;
+(UIImage *)compressImageWith:(UIImage *)image;
@end
