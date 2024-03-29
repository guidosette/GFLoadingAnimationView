# GFLoadingAnimationView

[![CI Status](https://img.shields.io/travis/guidosette/GFLoadingAnimationView.svg?style=flat)](https://travis-ci.org/guidosette/GFLoadingAnimationView)
[![Version](https://img.shields.io/cocoapods/v/GFLoadingAnimationView.svg?style=flat)](https://cocoapods.org/pods/GFLoadingAnimationView)
[![License](https://img.shields.io/cocoapods/l/GFLoadingAnimationView.svg?style=flat)](https://cocoapods.org/pods/GFLoadingAnimationView)
[![Platform](https://img.shields.io/cocoapods/p/GFLoadingAnimationView.svg?style=flat)](https://cocoapods.org/pods/GFLoadingAnimationView)

## Example

![Alt Text](https://github.com/guidosette/GFLoadingAnimationView/blob/master/photo.gif)

![Alt Text](https://github.com/guidosette/GFLoadingAnimationView/blob/master/photo2.gif)

Simple loading animation view to block UI. Easy to use and configurable.
You can also use GFLoadingPercentualView to show a loading with percentual status.

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

GFLoadingAnimationView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GFLoadingAnimationView'
```

## How to use
GFLoadingAnimationView

    #import "GFLoadingAnimationView.h"

    // show
	[GFLoadingAnimationView showLoadingView];

    // hide
    [GFLoadingAnimationView hideLoadingView];
    
GFLoadingPercentualView

    #import "GFLoadingPercentualView.h"

    // show
	[GFLoadingPercentualView showLoadingView];

    // hide
    [GFLoadingPercentualView hideLoadingView];

## Settings
GFLoadingAnimationView

    //	background
	[GFLoadingAnimationView setCircleSize:100];
	[GFLoadingAnimationView setCircleBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    //	spinner
	[GFLoadingAnimationView setSpinnerStrokeColor:[UIColor grayColor]];
	[GFLoadingAnimationView setSpinnerStrokeWidth:3];
    //	image
	[GFLoadingAnimationView setImageSizePerc:0.4];
	[GFLoadingAnimationView setImage:[UIImage imageNamed:@"test"]];

GFLoadingPercentualView

    //	background
	[GFLoadingAnimationView setCircleSize:100];
	[GFLoadingAnimationView setCircleBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    //	spinner
	[GFLoadingAnimationView setSpinnerStrokeColor:[UIColor grayColor]];
	[GFLoadingAnimationView setSpinnerStrokeWidth:3];
    //	image
	[GFLoadingAnimationView setImageSizePerc:0.4];
	[GFLoadingAnimationView setImage:[UIImage imageNamed:@"test"]];
    //	label
	[GFLoadingPercentualView setLabelFontSize:20];
	[GFLoadingPercentualView showLabel:false];

## Author

Guido Fanfani, guido.fanfani7@gmail.com

## License

GFLoadingAnimationView is available under the MIT license. See the LICENSE file for more info.
