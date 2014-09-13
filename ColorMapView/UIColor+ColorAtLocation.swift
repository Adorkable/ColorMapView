//
//  UIColor+ColorAtLocation.swift
//  ColorMapView
//
//  Created by Ian on 9/11/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

import UIKit

public extension UIImage
{
    public func colorAtLocation(location: FixedPoint) -> UIColor?
    {
        // interpreted from http://stackoverflow.com/a/1262893
        var result : UIColor?;
        
        if let imageRef = self.CGImage
        {
            let width = CGImageGetWidth(imageRef);
            let height = CGImageGetHeight(imageRef);
            
            if location.x >= 0 && location.x < (Fixed)(width) && location.y >= 0 && location.y < (Fixed)(height)
            {
                if let colorSpace = CGColorSpaceCreateDeviceRGB()
                {
                    let data = UnsafeMutablePointer<Byte>( calloc(width, height) );
                    
                    let bytesPerPixel : UInt = 4;
                    let bytesPerRow : UInt = bytesPerPixel * width;
                    let bitsPerComponent : UInt = 8;
                    
                    var options = CGBitmapInfo.ByteOrder32Big
                    options &= ~CGBitmapInfo.AlphaInfoMask;
                    options |= CGBitmapInfo.fromMask(CGImageAlphaInfo.PremultipliedLast.toRaw());
                    
                    if let context = CGBitmapContextCreate(data,
                                                            width,
                                                            height,
                                                            bitsPerComponent,
                                                            bytesPerRow,
                                                            colorSpace,
                                                            options)
                    {
                        CGContextDrawImage(context,
                            CGRectMake(0, 0, (CGFloat)(width), (CGFloat)(height) ),
//                            CGRect(x: 0, y: 0, width: width, height: height),
                            imageRef);
                        
                        let byteIndex = bytesPerRow * (UInt)(location.y) + (UInt)(location.x) * bytesPerPixel;

                        let pixel = data.advancedBy( (Int)(byteIndex) );
                        
                        let red : Byte = pixel.memory;
                        let green : Byte = pixel.advancedBy(1).memory;
                        let blue : Byte = pixel.advancedBy(2).memory;
                        let alpha : Byte = pixel.advancedBy(3).memory;
                        
                        result = UIColor(red: UIImage.byteComponentToCGFloat(red),
                            green: UIImage.byteComponentToCGFloat(green),
                            blue: UIImage.byteComponentToCGFloat(blue),
                            alpha: UIImage.byteComponentToCGFloat(alpha) );
                    }
                    
                    data.destroy();
                }
            }
        }
        
        return result;
    }
    
    internal class func byteComponentToCGFloat(value : Byte) -> CGFloat
    {
        return (CGFloat)(value) / 255.0;
    }
    
    public class func colorAtLocation(location: FixedPoint, image: UIImage) -> UIColor?
    {
        return image.colorAtLocation(location);
    }
}