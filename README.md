ColorMapView
===

[![Travis Build Status](http://img.shields.io/travis/Adorkable/ColorMapView.svg?style=flat)](https://travis-ci.org/Adorkable/ColorMapView)
[![Coverage Status](https://coveralls.io/repos/Adorkable/ColorMapView/badge.svg?style=flat&branch=master)](https://coveralls.io/r/Adorkable/ColorMapView?branch=master)
[![Pod Platform](http://img.shields.io/cocoapods/p/ColorMapView.svg?style=flat)](http://cocoadocs.org/docsets/ColorMapView/)
[![Pod License](http://img.shields.io/cocoapods/l/ColorMapView.svg?style=flat)](http://cocoadocs.org/docsets/ColorMapView/)
[![Pod Version](http://img.shields.io/cocoapods/v/ColorMapView.svg?style=flat)](http://cocoadocs.org/docsets/ColorMapView/)

**ColorMapView** is a simple iOS View mapped to a color gradient. Great for color picker type dealies.

![screenshot1](https://github.com/Adorkable/ColorMapView/blob/master/Screenshots/screenshot1.png?raw=true)

Installation
---
**ColorMapView** is available through **[cocoapods](http://cocoapods.org)**, to install simple add the following line to your `PodFile`:

``` ruby
  pod "ColorMapView"
```

Alternatively you can clone the **[github repo](https://github.com/Adorkable/ColorMapView)**.

Setup
---
Once you've installed the class:

* Include the ColorMapView header

``` objective-c
    #import <ColorMapView/ColorMapView.h>
```

* From there you can either create your ColorMapView instance in Interface Builder or in code by using:


``` objective-c
	ColorMapView *colorMapView = [ [ColorMapView alloc] initWithFrame:(CGRect)frame];
```

* The view provides an easy way to get the color at a location within the view.
``` objective-c
	[colorMapView getColorAtLocation:CGPointMake(50, 200) ];
```
