//
//  ColorMapView.h
//  ColorMapView
//
//  Created by Ian on 9/5/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for ColorMapView.
FOUNDATION_EXPORT double ColorMapViewVersionNumber;

//! Project version string for ColorMapView.
FOUNDATION_EXPORT const unsigned char ColorMapViewVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <ColorMapView/PublicHeader.h>

#if !defined(IB_DESIGNABLE)
#define IB_DESIGNABLE
#endif

#if !defined(IBInspectable)
#define IBInspectable
#endif

IB_DESIGNABLE

@interface ColorMapView : UIImageView

- (UIColor *)getColorAtLocation:(CGPoint)location;
- (UIColor *)getColorAtLocation:(CGPoint)location inView:(UIView *)inView;

// primarily for testing purposes
+ (NSBundle *)bundle;
+ (NSString *)colorMapImagePath;

@end
