//
//  UIButton+ASCusterm.h
//  ASResidencePermitProject
//
//  Created by 刘 on 2018/10/16.
//  Copyright © 2018年 kuke. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, ASButtonEdgeInsetsStyle) {
    ASButtonEdgeInsetsStyleTop, // image在上，label在下
    ASButtonEdgeInsetsStyleLeft, // image在左，label在右
    ASButtonEdgeInsetsStyleBottom, // image在下，label在上
    ASButtonEdgeInsetsStyleRight // image在右，label在左
};
@interface UIButton (ASCusterm)
/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(ASButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

@end
