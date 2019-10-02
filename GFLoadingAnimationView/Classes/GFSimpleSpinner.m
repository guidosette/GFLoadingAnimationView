//
//  GFSpinner.m
//  // Fanfa
//
//  Created by Guido Fanfani on 22/09/19.
//  Copyright © 2019 Fanfa. All rights reserved.
//

#import "GFSimpleSpinner.h"

#define DEGREES_TO_RADIANS(degrees)  ((M_PI * degrees)/ 180.0f)

@implementation GFSimpleSpinner {
	CAShapeLayer *circle;
	
	// defaults
	float spinnerStrokeDefault;
}

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self setup:frame];
		
	}
	return self;
}

- (void)setup:(CGRect)frame {
	
	spinnerStrokeDefault = 7;
	
	self.backgroundColor = [UIColor clearColor];
	
	circle = [CAShapeLayer layer];
	circle.fillColor = [UIColor clearColor].CGColor;
	circle.lineCap = kCALineCapRound;
	circle.strokeColor = [UIColor grayColor].CGColor;
	circle.lineWidth = spinnerStrokeDefault;
	
	float radius = frame.size.width/2-5;
	circle.position = CGPointMake(CGRectGetMidX(self.bounds)-radius,
								  CGRectGetMidY(self.bounds)-radius);
	float startAngle = 0.0f;
	float endAngle = 360.0f;
	// Make a circular shape
	UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius)
														radius:radius
													startAngle:DEGREES_TO_RADIANS(startAngle) - DEGREES_TO_RADIANS(90.0f)
													  endAngle:DEGREES_TO_RADIANS(endAngle) - DEGREES_TO_RADIANS(90.0f)
													 clockwise:YES];
	circle.path = [path CGPath];
	circle.strokeEnd = 0.1;
	[self.layer addSublayer:circle];
	
	[self startanimation];
}

- (void)updateFrame:(CGRect)frame {
	float radius = frame.size.width/2-5;
	circle.position = CGPointMake(CGRectGetMidX(self.bounds)-radius,
								  CGRectGetMidY(self.bounds)-radius);
	float startAngle = 0.0f;
	float endAngle = 360.0f;
	// Make a circular shape
	UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius)
														radius:radius
													startAngle:DEGREES_TO_RADIANS(startAngle) - DEGREES_TO_RADIANS(90.0f)
													  endAngle:DEGREES_TO_RADIANS(endAngle) - DEGREES_TO_RADIANS(90.0f)
													 clockwise:YES];
	circle.path = [path CGPath];
}

-(void)setStrokeColor:(UIColor*)color {
	circle.strokeColor = color.CGColor;
}

-(void)setStrokeWidth:(float)width {
	circle.lineWidth = width;
}

- (void)startanimation {
	float duration = 3.0f;
	
	CABasicAnimation* animationStrokeEnd = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
	animationStrokeEnd.duration            = duration;
	animationStrokeEnd.fillMode = kCAFillModeForwards;
	animationStrokeEnd.repeatCount         = INFINITY;
	animationStrokeEnd.removedOnCompletion = NO;
	animationStrokeEnd.autoreverses = YES;
	animationStrokeEnd.fromValue = [NSNumber numberWithFloat:0.6f];
	animationStrokeEnd.toValue   = [NSNumber numberWithFloat:0.8f];
	animationStrokeEnd.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
	
	
	CABasicAnimation* strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
	strokeStartAnimation.duration            = duration/3;
	strokeStartAnimation.fillMode = kCAFillModeForwards;
	strokeStartAnimation.repeatCount         = INFINITY;
	strokeStartAnimation.removedOnCompletion = NO;
	strokeStartAnimation.autoreverses = YES;
	strokeStartAnimation.fromValue = [NSNumber numberWithFloat:0.2f];
	strokeStartAnimation.toValue   = [NSNumber numberWithFloat:0.5f];
	strokeStartAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
	
	
	CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	rotationAnimation.duration            = duration/3;
	rotationAnimation.fillMode = kCAFillModeForwards;
	rotationAnimation.repeatCount         = INFINITY;
	rotationAnimation.removedOnCompletion = NO;
	rotationAnimation.autoreverses = NO;
	rotationAnimation.toValue = [NSNumber numberWithFloat:DEGREES_TO_RADIANS(0.0f)];
	rotationAnimation.toValue = [NSNumber numberWithFloat:DEGREES_TO_RADIANS(360.0f)];
	rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	
	// Add the animation to the circle
	//    [circle addAnimation:animationStrokeEnd forKey:@"strokeEnd"];
	//    [circle addAnimation:strokeStartAnimation forKey:@"strokeStart"];
	[self.layer addAnimation:rotationAnimation forKey:@"rotation"];
}

@end
