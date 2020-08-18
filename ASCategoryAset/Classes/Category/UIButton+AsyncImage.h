//
//  UIButton+AsyncImage.h
//  hxxdj
//
//  Created by aisino on 2018/7/22.
//  Copyright © 2018年 aisino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (AsyncImage)
- (void)setImageFromURL:(NSString *)urlString adjustToSize :( CGSize)size completion :( void (^)(void))completion logo :( UIImage *)logoImage;

@end
