//
//  CWPhotoUtil.m
//  Tuli
//
//  Created by Charlie Wu on 18/01/13.
//  Copyright (c) 2013 Charlie Wu. All rights reserved.
//

#import "ImageUtil.h"

@implementation ImageUtil

+(UIImage*)scaleImage:(UIImage*)image toSize:(CGSize)size
{
    float scale = size.width / image.size.width;
    if (image.size.height * scale > size.height || image.size.width * scale > size.width) scale = size.height / image.size.height;
    
    image = [UIImage imageWithCGImage:[image CGImage] scale:1 / scale orientation:image.imageOrientation];
    
    NSLog(@"resize image to %f x %f", image.size.width, image.size.height);
    return image;
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
