//
//  CWPhotoUtil.h
//  Tuli
//
//  Created by Charlie Wu on 18/01/13.
//  Copyright (c) 2013 Charlie Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageUtil : NSObject
+ (UIImage*)imageFromScaledImage:(UIImage*)image toSize:(CGSize)size;
+ (void)setImageViewBorder:(UIImageView*)imageView withColor:(UIColor *)color andThickness:(CGFloat)thickness;
+ (UIImage*)imageWithBorderFromImage:(UIImage*)source withColor:(UIColor *)color andThickness:(CGFloat)thickness;
@end
