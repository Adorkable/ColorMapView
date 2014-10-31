//#define SPT_SUBCLASS FBSnapshotTestCase

#include <Specta/Specta.h>

#define EXP_SHORTHAND
#include <Expecta/Expecta.h>
#include <Expecta+Snapshots/EXPMatchers+FBSnapshotTest.h>

#include "ColorMapView.h"

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
});

SpecEnd
