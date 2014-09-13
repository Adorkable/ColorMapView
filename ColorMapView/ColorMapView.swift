//
//  ColorMapView.swift
//  ColorMapView
//
//  Created by Ian on 9/11/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

import UIKit

public class ColorMapView : UIImageView
{
    public override init()
    {
        super.init();

        self.initColorMapImage();
    }
    
    public override init(frame: CGRect)
    {
        super.init(frame: frame);
        
        self.initColorMapImage();
    }

    public required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder);
        
        self.initColorMapImage();
    }
    
    public override func prepareForInterfaceBuilder()
    {
        super.prepareForInterfaceBuilder();
        self.initColorMapImage();
    }
    
    private func initColorMapImage()
    {
        self.contentMode = UIViewContentMode.ScaleToFill;
        self.image = self.mapImage();
    }
    
    public func colorAtLocation(location : CGPoint, relativeToView : UIView) -> UIColor?
    {
        var result : UIColor?;
        
        let normalizedLocation = CGPoint(x: location.x / relativeToView.frame.size.width,
                                        y: location.y / relativeToView.frame.size.height);
        
        if self.image != nil
        {
            let locationInImage = FixedPoint(x: (Fixed)(normalizedLocation.x * self.image!.size.width),
                                            y: (Fixed)(normalizedLocation.y * self.image!.size.height) )
            
            
            result = self.image!.colorAtLocation(locationInImage);
        }
        
        return result;
    }
    
    public class func bundle() -> NSBundle
    {
        return NSBundle(identifier: "com.adorkable.ColorMapView");
    }
    
    public class func colorMapImagePath() -> String?
    {
        let colorMapViewBundle = bundle();
        return colorMapViewBundle.pathForResource("colorMap", ofType: ".png");
    }
    
    // Swift does not currently support class variables
/*    internal class var sharedMapImage : UIImage?;
    
    internal class func mapImageStatic() -> UIImage?
    {
        if sharedMapImage == nil
        {
            if let imagePath = colorMapImagePath()
            {
                sharedMapImage = UIImage(contentsOfFile: imagePath);
            }
        }
        
        return sharedMapImage;
    }
*/

    internal func mapImage() -> UIImage?
    {
        var result : UIImage?;
        
        if let imagePath = ColorMapView.colorMapImagePath()
        {
            result = UIImage(contentsOfFile: imagePath); //ColorMapView.mapImageStatic();
        }
        
        return result;
    }
};