//
//  UIImage+ColorMapView.h
//  ColorMapView
//
//  Created by Ian on 9/5/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ColorMapView)

- (UIColor *)colorAtLocation:(CGPoint)location;
+ (UIColor *)colorAtLocationInImage:(UIImage*)image atLocation:(CGPoint)location;

@end
