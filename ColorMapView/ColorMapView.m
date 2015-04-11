//
//  ColorMapView.m
//  ColorMapView
//
//  Created by Ian on 9/5/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

#import "ColorMapView.h"

#import "UIImage+ColorMapView.h"

static UIImage *mapImageStatic = nil;

@interface ColorMapView ()

@property (readonly) UIImage *mapImage;

@end

@implementation ColorMapView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    BOOL result = false;

    self = [super initWithCoder:aDecoder];
    if (self)
    {
        result = [self sharedInit];
    }
    
    if (result)
    {
        return self;
    } else
    {
        return nil;
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    BOOL result = false;
    
    self = [super initWithFrame:frame];
    if (self)
    {
        result = [self sharedInit];
    }

    if (result)
    {
        return self;
    } else
    {
        return nil;
    }
}

- (BOOL)sharedInit
{
    self.contentMode = UIViewContentModeScaleToFill;
    [self setImage:self.mapImage];
    
    return self.image != nil;
}

#if TARGET_INTERFACE_BUILDER
- (void)prepareForInterfaceBuilder
{
    [self sharedInit];
}
#endif

- (UIColor *)getColorAtLocation:(CGPoint)location
{
    return [self getColorAtLocation:location inView:self];
}

- (UIColor *)getColorAtLocation:(CGPoint)location inView:(UIView *)inView
{
    UIColor *result;
    
    CGPoint normalizedLocation = CGPointMake(location.x / inView.frame.size.width,
                                             location.y / inView.frame.size.height);
    CGPoint locationInImage = CGPointMake(
                                          roundf(normalizedLocation.x * self.image.size.width),
                                          roundf(normalizedLocation.y * self.image.size.height)
                                          );
    
    result = [self.image colorAtLocation:locationInImage];
    
    return result;
}

+ (NSBundle *)bundle
{
    return [NSBundle bundleWithIdentifier:@"cc.adorkable.ColorMapView"];
}

+ (NSString *)colorMapImagePath
{
    NSBundle *colorMapViewBundle = [self bundle];
    return [colorMapViewBundle pathForResource:@"colorMap" ofType:@".png"];
}

+ (UIImage *)mapImageStatic
{
    if (mapImageStatic == nil)
    {
        mapImageStatic = [UIImage imageWithContentsOfFile:[self colorMapImagePath] ];
    }
    
    return mapImageStatic;
}

- (UIImage *)mapImage
{
    return [ColorMapView mapImageStatic];
}

@end
