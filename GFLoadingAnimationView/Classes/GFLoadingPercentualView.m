//
//  GFLoadingPercentualView.m
//  // Fanfa
//
//  Created by Guido Fanfani on 01/10/19.
//  Copyright © 2019 Fanfa. All rights reserved.
//

#import "GFLoadingPercentualView.h"
#import "GFPercSpinner.h""

#define DEGREES_TO_RADIANS(degrees)  ((M_PI * degrees)/ 180.0f)

@interface GFLoadingPercentualView ()
@property (nonatomic, assign) bool isLoading;
@property (nonatomic, retain) GFPercSpinner* spinner;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIView* circleView;
@property (nonatomic, retain) UILabel* label;
@property (nonatomic, assign) float imageSizePerc;
@property (nonatomic, assign) float sizeCircle;
@end

@implementation GFLoadingPercentualView {
    CABasicAnimation *drawAnimation;
	
	// defaults
	float circleSizeDefault;
	float imageSizePercDefault;
	float spinnerStrokeDefault;
	float labelFontSizeDefault;
	UIColor *spinnerColorDefault;
	UIColor *circleBackgroundColor;
	
}

+ (instancetype)privateInstance {
    static dispatch_once_t once;
    static GFLoadingPercentualView *privateInstance;
    dispatch_once(&once, ^{
        privateInstance = [[self alloc] init];
    });
    return privateInstance;
}

- (id)init {
    self = [super init];
    if (self) {

        // defaults
		circleSizeDefault = 100;
		imageSizePercDefault = 0.4;
		spinnerStrokeDefault = 3;
		labelFontSizeDefault = 20;
		spinnerColorDefault = [UIColor grayColor];
		circleBackgroundColor = [UIColor groupTableViewBackgroundColor];
		
        self.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.85];

        // Get the size of the entire screen
        CGRect screenRect = [[UIScreen mainScreen] bounds];

        // Set the frame to be equal to the screen size
        self.frame = CGRectMake(0, 0, screenRect.size.width, screenRect.size.height);

		float sizeBackground = _sizeCircle != 0 ? _sizeCircle : circleSizeDefault;
		
        _circleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, sizeBackground, sizeBackground)];
        _circleView.center = self.center;
        _circleView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _circleView.layer.masksToBounds = true;
        _circleView.layer.cornerRadius = sizeBackground/2;
        [self addSubview:_circleView];

        //label
        /*        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), 100)];
         label.center = self.center;
         label.textAlignment = NSTextAlignmentCenter;
         label.textColor=[UIColor whiteColor];
         label.text = NSLocalizedString(@"loading", nil);
         [self addSubview:label]; */

		float sizeImage = sizeBackground*(_imageSizePerc != 0 ? _imageSizePerc : imageSizePercDefault);
		_imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, sizeImage, sizeImage)];
        _imageView.center = self.center;
		[_imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:_imageView];
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, sizeBackground, sizeBackground)];
        _label.textColor = [UIColor darkGrayColor];
        _label.center = self.center;
		_label.textAlignment = NSTextAlignmentCenter;
		[_label setFont:[UIFont systemFontOfSize:labelFontSizeDefault]];
        _label.hidden = true;
        [self addSubview:_label];

        //scale animation
        CABasicAnimation* scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scale.duration = 0.8;
        scale.repeatCount = INFINITY;
        scale.removedOnCompletion = NO;
        scale.autoreverses = YES;
        scale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        scale.fromValue = [NSNumber numberWithFloat:1.0];
        scale.toValue = [NSNumber numberWithFloat:1.2];
       
        [_imageView.layer addAnimation:scale forKey:@"animateScale"];
		
		
        // spinner
		_spinner = [[GFPercSpinner alloc] initWithFrame:_circleView.frame];
		[self addSubview:_spinner];
		[_spinner setStrokeWidth:spinnerStrokeDefault];
		[_spinner setStrokeColor:spinnerColorDefault];
    
		[self setup];

	}
    return self;
}

- (void)setup {
	float sizeBackground = _sizeCircle != 0 ? _sizeCircle : circleSizeDefault;
	_circleView.frame = CGRectMake(0, 0, sizeBackground, sizeBackground);
	_circleView.center = self.center;
	_circleView.layer.cornerRadius = sizeBackground/2;
	
	float sizeImage = sizeBackground*(_imageSizePerc != 0 ? _imageSizePerc : imageSizePercDefault);
	_imageView.frame = CGRectMake(0, 0, sizeImage, sizeImage);
	_imageView.center = self.center;
	
	[_spinner updateFrame:_circleView.frame];
}

+ (void)showLabel:(bool)show {
    GFLoadingPercentualView *loadingView = [GFLoadingPercentualView privateInstance];
    loadingView.label.hidden = !show;
}

+ (void)setLabelColor:(UIColor*)color {
    GFLoadingPercentualView *loadingView = [GFLoadingPercentualView privateInstance];
    loadingView.label.textColor = color;
}

+ (void)setLabelFontSize:(float)fontSize {
    GFLoadingPercentualView *loadingView = [GFLoadingPercentualView privateInstance];
	[loadingView.label setFont:[UIFont systemFontOfSize:fontSize]];
}

- (void)reset {
	[_spinner reset];
    _label.text = @"0%";
}

+ (float)currentProgress {
    GFLoadingPercentualView *loadingView = [GFLoadingPercentualView privateInstance];
	return [loadingView.spinner currentProgress];
}

+ (void)updateProgress:(float)perc {
    GFLoadingPercentualView *loadingView = [GFLoadingPercentualView privateInstance];
	[loadingView.spinner updateProgress:perc];
	loadingView.label.text = [NSString stringWithFormat:@"%.0f%%", perc*100];
}

+ (void)setCircleSize:(float)size {
	GFLoadingPercentualView *loadingView = [GFLoadingPercentualView privateInstance];
	loadingView.sizeCircle = size;
	[loadingView setup];
}

+ (void)setCircleBackgroundColor:(UIColor*)color {
	GFLoadingPercentualView *loadingView = [GFLoadingPercentualView privateInstance];
	[loadingView.circleView setBackgroundColor:color];
}

+ (void)setSpinnerStrokeColor:(UIColor*)color {
	GFLoadingPercentualView *loadingView = [GFLoadingPercentualView privateInstance];
	[loadingView.spinner setStrokeColor:color];
}

+ (void)setSpinnerStrokeWidth:(float)width {
	GFLoadingPercentualView *loadingView = [GFLoadingPercentualView privateInstance];
	[loadingView.spinner setStrokeWidth:width];
}

+ (void)setImage:(UIImage*)image {
	GFLoadingPercentualView *loadingView = [GFLoadingPercentualView privateInstance];
	[loadingView.imageView setImage:image];
}

+ (void)setImageSizePerc:(float)sizePerc {
	GFLoadingPercentualView *loadingView = [GFLoadingPercentualView privateInstance];
	loadingView.imageSizePerc =  sizePerc;
	[loadingView setup];
}

+ (void)showLoadingView {
	GFLoadingPercentualView *loadingView = [GFLoadingPercentualView privateInstance];
    [loadingView reset];
    loadingView.isLoading = true;
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];

    [UIView transitionWithView:keyWindow
                      duration:0.3
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        [keyWindow addSubview:loadingView];
                    }
                    completion:^(BOOL finished) {

                    }];
}

+ (void)hideLoadingView {
	GFLoadingPercentualView *loadingView = [GFLoadingPercentualView privateInstance];
	if ( !loadingView.isLoading ) {
		return;
	}
	[loadingView removeFromSuperview];
	loadingView.isLoading = false;
    [loadingView reset];
}

+ (bool)isLoading {
	GFLoadingPercentualView *loadingView = [GFLoadingPercentualView privateInstance];
	return loadingView.isLoading;
}

@end
