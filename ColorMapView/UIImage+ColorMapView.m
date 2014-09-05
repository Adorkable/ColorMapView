//
//  UIImage+ColorMapView.m
//  ColorMapView
//
//  Created by Ian on 9/5/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

#import "UIImage+ColorMapView.h"

@implementation UIImage (ColorMapView)

- (UIColor *)colorAtLocation:(CGPoint)location
{
    return [UIImage colorAtLocationInImage:self atLocation:location];
}

+ (UIColor *)colorAtLocationInImage:(UIImage*)image atLocation:(CGPoint)location
{
    // http://stackoverflow.com/a/1262893
    
    // First get the image into your data buffer
    CGImageRef imageRef = [image CGImage];
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    if (location.x < 0 || location.y < 0 ||
        location.x > width || location.y > height)
    {
        return nil;
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char *rawData = (unsigned char*) calloc(height * width * 4, sizeof(unsigned char));
    NSUInteger bytesPerPixel = 4;
    NSUInteger bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;
    CGContextRef context = CGBitmapContextCreate(rawData, width, height,
                                                 bitsPerComponent, bytesPerRow, colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
    CGContextRelease(context);
    
    // Now your rawData contains the image data in the RGBA8888 pixel format.
    NSUInteger byteIndex = (bytesPerRow * (NSUInteger)location.y) + (NSUInteger)location.x * bytesPerPixel;
    
    CGFloat red   = (rawData[byteIndex]     * 1.0) / 255.0;
    CGFloat green = (rawData[byteIndex + 1] * 1.0) / 255.0;
    CGFloat blue  = (rawData[byteIndex + 2] * 1.0) / 255.0;
    CGFloat alpha = (rawData[byteIndex + 3] * 1.0) / 255.0;
    free(rawData);
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
