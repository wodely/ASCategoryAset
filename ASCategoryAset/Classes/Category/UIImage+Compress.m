//
//  UIImage+Compress.m
//  hxxdj
//
//  Created by 刘 on 2019/6/19.
//  Copyright © 2019 aisino. All rights reserved.
//

#import "UIImage+Compress.h"

@implementation UIImage (Compress)
- (NSData*)compressQualityWithMaxLength:(NSInteger)maxLength {
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(self, compression);
    if (data.length < maxLength) return data;
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(self, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    return data;
}
@end
