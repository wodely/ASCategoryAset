//
//  UIImage+Compress.h
//  hxxdj
//
//  Created by 刘 on 2019/6/19.
//  Copyright © 2019 aisino. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Compress)
- (NSData*)compressQualityWithMaxLength:(NSInteger)maxLength;
@end

NS_ASSUME_NONNULL_END
