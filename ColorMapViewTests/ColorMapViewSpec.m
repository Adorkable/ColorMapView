//#define SPT_SUBCLASS FBSnapshotTestCase

#include <Specta/Specta.h>

#define EXP_SHORTHAND
#include <Expecta/Expecta.h>
#include <Expecta+Snapshots/EXPMatchers+FBSnapshotTest.h>

#include "ColorMapView.h"
#include "UIImage+ColorMapView.h"

SpecBegin(ColorMapView)

describe(@"ColorMapView", ^{
    
    __block ColorMapView *colorMapView;
    
    beforeEach( ^{
        colorMapView = [ [ColorMapView alloc] initWithFrame:CGRectMake(0, 0, 300, 300) ];
    });
    
    describe(@"initWithFrame", ^{
        expect(colorMapView).toNot.beNil();
    });
    
    describe(@"initWithCoder", ^{
        ColorMapView *colorMapView = [ [ColorMapView alloc] initWithCoder:nil]; // TODO: mock coder object?
        
        expect(colorMapView).notTo.beNil();
    });
    
    uint32_t(^approximateColorHash)(UIColor *color) = ^uint32_t(UIColor *color)
    {
        // http://nshipster.com/equality/
        CGFloat red, green, blue, alpha;
        [color getRed:&red green:&green blue:&blue alpha:&alpha];
        
        return ( (uint32_t)(red * 255) << 24) + ( (uint32_t)(green * 255) << 16) + ( (uint32_t)(blue * 255) << 8) + ( (uint32_t)(alpha * 255) );
    };
    
    void(^expectToEqual)(CGPoint locationInImage, CGPoint locationInView) = ^void(CGPoint locationInImage, CGPoint locationInView)
    {
        UIImage *colorMapImage = [UIImage imageWithContentsOfFile:[ColorMapView colorMapImagePath] ];
        
        UIColor *colorInImage = [colorMapImage colorAtLocation:locationInImage];
        UIColor *colorInMapView = [colorMapView getColorAtLocation:locationInView];
        
//        expect(colorInImage).to.equal(colorInMapView);
        expect( approximateColorHash(colorInImage) ).to.equal( approximateColorHash(colorInMapView) );
    };
    
    describe(@"getColorAtLocation:", ^{
        it(@"Top Left", ^{
            expectToEqual( CGPointMake(0, 0), CGPointMake(0, 0) );
        });
        
        it(@"Bottom Right", ^{
            UIImage *colorMapImage = [UIImage imageWithContentsOfFile:[ColorMapView colorMapImagePath] ];
            
            expectToEqual(
                          CGPointMake(colorMapImage.size.width - 1, colorMapImage.size.height - 1),
                          CGPointMake(colorMapView.frame.size.width - 1, colorMapView.frame.size.height - 1)
                          );
        });
        
        it(@"Invalid", ^{
            UIColor *colorInMapView = [colorMapView getColorAtLocation:CGPointMake(-1, 100) ];
            expect(colorInMapView).to.beNil();
        });
    });
    
    // TODO: getColorAtLocation:inView:
});

SpecEnd
