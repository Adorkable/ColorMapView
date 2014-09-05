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
    
    it(@"Appearance", ^{
        //expect(colorMapView).to.recordSnapshot();
        expect(colorMapView).to.haveValidSnapshot();
    });
    
    void(^expectToEqual)(CGPoint locationInImage, CGPoint locationInView) = ^void(CGPoint locationInImage, CGPoint locationInView)
    {
        UIImage *colorMapImage = [UIImage imageWithContentsOfFile:[ColorMapView colorMapImagePath] ];
        
        UIColor *colorInImage = [colorMapImage colorAtLocation:locationInImage];
        UIColor *colorInMapView = [colorMapView getColorAtLocation:locationInView inView:colorMapView];
        
        expect(colorInImage).to.equal(colorInMapView);
    };
    
    describe(@"getColorAtLocation:inView:", ^{
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
    });
});

SpecEnd
