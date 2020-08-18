//
//  UIImage+Extension.m
//  gongchengbang
//
//  Created by YAS-Macmini2 on 15/9/14.
//  Copyright (c) 2015年 RaymondNi. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+(UIImage *)resizeImage:(NSString *)imgName {
    
    UIImage *img = [UIImage imageNamed:imgName];
    return [img stretchableImageWithLeftCapWidth:img.size.width*0.5 topCapHeight:img.size.height*0.5];
//    UIEdgeInsets insets = UIEdgeInsetsMake(img.size.height * 0.5, img.size.width * 0.5, img.size.height * 0.5, img.size.width * 0.5);
//    return [img resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
}

// 按指定尺寸 等比例压缩图片
+(UIImage *)scaleRatioWithImage:(UIImage*)image size:(CGSize)newSize {
    
    CGSize oldsize = image.size;
    CGRect rect;
    if (newSize.width/newSize.height > oldsize.width/oldsize.height) {
        rect.size.width = newSize.height*oldsize.width/oldsize.height;
        rect.size.height = newSize.height;
        rect.origin.x = (newSize.width - rect.size.width)/2;
        rect.origin.y = 0;
    }
    else{
        rect.size.width = newSize.width;
        rect.size.height = newSize.width*oldsize.height/oldsize.width;
        rect.origin.x = 0;
        rect.origin.y = (newSize.height - rect.size.height)/2;
    }
    
    UIGraphicsBeginImageContext(newSize);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    
    UIRectFill(CGRectMake(0, 0, newSize.width, newSize.height));//clear background
    
    [image drawInRect:rect];
    
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

// 按指定尺寸 压缩图片
+(UIImage*)scaleSimpleWithImage:(UIImage*)image scaledToSize:(CGSize)newSize {
    
    UIGraphicsBeginImageContext(newSize);
    
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

// 图片由颜色值生成
+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context,color.CGColor);
    
    CGContextFillRect(context, rect);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)imageWithText:(NSString *)str withBgImage:(UIImage *)image withFont:(CGFloat)fontSize withTextColor:(UIColor *)textColor
{
    //    UIImage *image = [UIImage imageNamed:@"otherMerchantHeaderBg" ];
    
    CGSize size= CGSizeMake (image.size.width , image.size . height ); // 画布大小
    
    UIGraphicsBeginImageContextWithOptions (size, NO , 0.0 );
    
    [image drawAtPoint : CGPointMake ( 0 , 0 )];
    
    // 获得一个位图图形上下文
    
    CGContextRef context= UIGraphicsGetCurrentContext ();
    
    CGContextDrawPath (context, kCGPathStroke );
    
    //画自己想画的内容。。。。。
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    //    [str drawAtPoint : CGPointMake ( image. size . width * 0.4 , image. size . height * 0.4 ) withAttributes : @{ NSFontAttributeName :[ UIFont fontWithName : @"Arial-BoldMT" size : 50 ], NSForegroundColorAttributeName :[ UIColor blackColor ],NSParagraphStyleAttributeName:paragraphStyle} ];
    
    UIFont  *font = [UIFont boldSystemFontOfSize:fontSize];//定义默认字体
    //计算文字的宽度和高度：支持多行显示
    CGSize sizeText = [str boundingRectWithSize:size
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{
                                                  NSFontAttributeName:font,//设置文字的字体
                                                  NSKernAttributeName:@10,//文字之间的字距
                                                  }
                                        context:nil].size;
    
    //为了能够垂直居中，需要计算显示起点坐标x,y
    CGRect rect = CGRectMake((size.width-sizeText.width)/2, (size.height-sizeText.height)/2, sizeText.width, sizeText.height);
    
    
    [str drawInRect:rect withAttributes:@{NSFontAttributeName :[UIFont systemFontOfSize:fontSize],NSForegroundColorAttributeName:textColor,NSParagraphStyleAttributeName:paragraphStyle}];
    
    //画自己想画的内容。。。。。
    
    // 返回绘制的新图形
    
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

+ (UIImage *)imageWithTTFText:(NSString *)str WithTTFName:(NSString *)ttfName withBgImage:(UIImage *)img withFont:(CGFloat)fontSize withTextColor:(UIColor *)textColor imageSize:(CGSize)size{
    //    UIImage *image = [ UIImage imageNamed:@"otherMerchantHeaderBg" ];
//    CGSize size= CGSizeMake(image.size.width, image.size.height ); // 画布大小
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    if (img) {
        [img drawAtPoint:CGPointMake(0, 0)];
    }
    
//    [image drawAtPoint:CGPointMake(0, 0)];
    
    // 获得一个位图图形上下文
    
    CGContextRef context= UIGraphicsGetCurrentContext();
    
    CGContextDrawPath(context, kCGPathStroke);
    
    //画自己想画的内容。。。。。
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
//    [str drawAtPoint : CGPointMake ( image. size . width * 0.4 , image. size . height * 0.4 ) withAttributes : @{ NSFontAttributeName :[ UIFont fontWithName : @"Arial-BoldMT" size : 50 ], NSForegroundColorAttributeName :[ UIColor blackColor ],NSParagraphStyleAttributeName:paragraphStyle} ];
    
//    UIFont  *font = [UIFont boldSystemFontOfSize:fontSize];//定义默认字体
    UIFont  *font = [UIFont fontWithName:ttfName size:fontSize];
    //计算文字的宽度和高度：支持多行显示
    CGSize sizeText = [str boundingRectWithSize:size
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{NSFontAttributeName:font,//设置文字的字体
                                                  NSKernAttributeName:@10,//文字之间的字距
                                                  }
                                        context:nil].size;
    //为了能够垂直居中，需要计算显示起点坐标x,y
    CGRect rect = CGRectMake((size.width-sizeText.width)/2, (size.height-sizeText.height)/2, sizeText.width, sizeText.height);
    [str drawInRect:rect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:textColor,NSParagraphStyleAttributeName:paragraphStyle}];
    //画自己想画的内容。。。。。
    // 返回绘制的新图形
    UIImage * newImage= UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+(UIImage *)compressImageWith:(UIImage *)image {
    float imageWidth = image.size.width;
    float imageHeight = image.size.height;
    float width = 640;
    float height = image.size.height/(image.size.width/width);
    
    float widthScale = imageWidth /width;
    float heightScale = imageHeight /height;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    
    if (widthScale > heightScale) {
        [image drawInRect:CGRectMake(0, 0, imageWidth /heightScale , height)];
    }
    else {
        [image drawInRect:CGRectMake(0, 0, width , imageHeight /widthScale)];
    }
    
    // 从当前context中创建一个改变大小后的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

@end
