//
//  UIButton+EnlargeTouchArea.h
//  gongchengbang
//
//  说明:增大UIButton的点击范围
//  Created by  on 15/11/29.
//  Copyright © 2015年 RaymondNi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (EnlargeTouchArea)

-(void)setEnlargeEdge:(CGFloat)size;
-(void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;
@end
