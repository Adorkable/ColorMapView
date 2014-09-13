//
//  ColorMapViewTests.swift
//  ColorMapViewTests
//
//  Created by Ian on 9/11/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

import XCTest
import ColorMapView

class ColorMapViewTests: XCTestCase {
    
    let frame = CGRect(x: 0, y: 0, width: 300, height: 300);
    
/*    func testAppearance()
    {
        
    }
*/
    
    func testImageAvailable()
    {
        XCTAssertNotNil(ColorMapView.colorMapImagePath(), "Image not available!");
    }
    
    func expectToEqual(locationInImage : FixedPoint, locationInView : CGPoint)
    {
        let colorMapView = ColorMapView(frame: frame);
        
        let colorMapImage = UIImage(contentsOfFile: ColorMapView.colorMapImagePath()! );
        
        let colorInImage = colorMapImage.colorAtLocation(locationInImage);
        XCTAssertNotNil(colorInImage, "Color in Image is nil!");
        
        let colorInView = colorMapView.colorAtLocation(locationInView, relativeToView: colorMapView);
        XCTAssertNotNil(colorInView, "Color in View is nil!");
        
        XCTAssertEqual(colorInImage!, colorInView!, "Colors not equal!");
    }
    
    func testColorAtLocation()
    {
        expectToEqual(FixedPoint(x: 0, y: 0), locationInView: CGPoint(x: 0, y: 0) );
    }
    
}
