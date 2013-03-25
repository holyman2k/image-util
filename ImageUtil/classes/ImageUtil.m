//
//  CWPhotoUtil.m
//  Tuli
//
//  Created by Charlie Wu on 18/01/13.
//  Copyright (c) 2013 Charlie Wu. All rights reserved.
//

#import "ImageUtil.h"
#import <QuartzCore/QuartzCore.h>

@implementation ImageUtil

+(UIImage*)imageFromScaledImage:(UIImage*)image toSize:(CGSize)size
{
    float screenScale = [[UIScreen mainScreen] scale];
    size = CGSizeMake(size.width * screenScale, size.height * screenScale);
    float scale = size.width / image.size.width;

    if (image.size.height * scale > size.height || image.size.width * scale > size.width) scale = size.height / image.size.height;
    
    UIImage *scaledImage = [UIImage imageWithCGImage:[image CGImage] scale: 1 / scale orientation:image.imageOrientation];
    
    NSLog(@"resize image to %f x %f", scaledImage.size.width, scaledImage.size.height);
    return scaledImage;
}

+ (void)setImageViewBorder:(UIImageView*)imageView withColor:(UIColor *)color andThickness:(CGFloat)thickness
{
    [imageView.layer setBorderColor:[color CGColor]];
    [imageView.layer setBorderWidth:thickness];
}

+ (UIImage*)imageWithBorderFromImage:(UIImage*)source withColor:(UIColor *)color andThickness:(CGFloat)thickness;
{
    CGSize size = CGSizeMake(source.size.width, source.size.height);
    UIGraphicsBeginImageContext(size);
    
    CGPoint thumbPoint = CGPointMake(0,0);
    
    [source drawAtPoint:thumbPoint];
    
    
    UIGraphicsBeginImageContext(size);
    CGImageRef imgRef = source.CGImage;
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, size.width,size.height), imgRef);
    UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGPoint starredPoint = CGPointMake(0, 0);
    [imageCopy drawAtPoint:starredPoint];
    UIImage *imageC = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageC;
}
@end
