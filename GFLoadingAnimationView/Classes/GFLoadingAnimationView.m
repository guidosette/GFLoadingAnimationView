//
//  LoadingAnimationView.m
//  // Fanfa
//
//  Created by Guido Fanfani on 22/09/19.
//  Copyright © 2019 Fanfa. All rights reserved.
//

#import "GFLoadingAnimationView.h"
#import "GFSimpleSpinner.h"

@interface GFLoadingAnimationView ()
@property (nonatomic, assign) bool isLoading;
@property (nonatomic, retain) GFSimpleSpinner* spinner;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIView* circleView;
@property (nonatomic, assign) float imageSizePerc;
@property (nonatomic, assign) float sizeCircle;
@end

@implementation GFLoadingAnimationView {
	// defaults
	float circleSizeDefault;
	float imageSizePercDefault;
	float spinnerStrokeDefault;
	UIColor *spinnerColorDefault;
	UIColor *circleBackgroundColor;
}

+ (instancetype)privateInstance {
	static dispatch_once_t once;
	static GFLoadingAnimationView *privateInstance;
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
		spinnerStrokeDefault = 7;
		spinnerColorDefault = [UIColor grayColor];
		circleBackgroundColor = [UIColor groupTableViewBackgroundColor];
		
		// Background with alpha so the view is transculent.
		self.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.85];
		
		// Get the size of the entire screen
		CGRect screenRect = [[UIScreen mainScreen] bounds];
		
		// Set the frame to be equal to the screen size
		self.frame = CGRectMake(0, 0, screenRect.size.width, screenRect.size.height);
		
		float sizeBackground = _sizeCircle != 0 ? _sizeCircle : circleSizeDefault;
		_circleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, sizeBackground, sizeBackground)];
		_circleView.center = self.center;
		_circleView.backgroundColor = circleBackgroundColor;
		_circleView.layer.masksToBounds = true;
		_circleView.layer.cornerRadius = sizeBackground/2;
		[self addSubview:_circleView];
		
		// label
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
		
		// scale animation
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
		_spinner = [[GFSimpleSpinner alloc] initWithFrame:_circleView.frame];
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

+ (void)setCircleSize:(float)size {
	GFLoadingAnimationView *loadingView = [GFLoadingAnimationView privateInstance];
	loadingView.sizeCircle = size;
	[loadingView setup];
}

+ (void)setCircleBackgroundColor:(UIColor*)color {
	GFLoadingAnimationView *loadingView = [GFLoadingAnimationView privateInstance];
	[loadingView.circleView setBackgroundColor:color];
}

+ (void)setSpinnerStrokeColor:(UIColor*)color {
	GFLoadingAnimationView *loadingView = [GFLoadingAnimationView privateInstance];
	[loadingView.spinner setStrokeColor:color];
}

+ (void)setSpinnerStrokeWidth:(float)width {
	GFLoadingAnimationView *loadingView = [GFLoadingAnimationView privateInstance];
	[loadingView.spinner setStrokeWidth:width];
}

+ (void)setImage:(UIImage*)image {
	GFLoadingAnimationView *loadingView = [GFLoadingAnimationView privateInstance];
	[loadingView.imageView setImage:image];
}

+ (void)setImageSizePerc:(float)sizePerc {
	GFLoadingAnimationView *loadingView = [GFLoadingAnimationView privateInstance];
	loadingView.imageSizePerc =  sizePerc;
	[loadingView setup];
}

+ (void)showLoadingView {
	GFLoadingAnimationView *loadingView = [GFLoadingAnimationView privateInstance];
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
	GFLoadingAnimationView *loadingView = [GFLoadingAnimationView privateInstance];
	if ( !loadingView.isLoading ) {
		return;
	}
	[loadingView removeFromSuperview];
	loadingView.isLoading = false;
}

+ (bool)isLoading {
	GFLoadingAnimationView *loadingView = [GFLoadingAnimationView privateInstance];
	return loadingView.isLoading;
}

@end
