//
//  GFSpinner.m
//  // Fanfa
//
//  Created by Guido Fanfani on 22/09/19.
//  Copyright © 2019 Fanfa. All rights reserved.
//

#import "GFPercSpinner.h"

#define DEGREES_TO_RADIANS(degrees)  ((M_PI * degrees)/ 180.0f)

@implementation GFPercSpinner {
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
	
	self.backgroundColor = [UIColor clearColor];
	
	spinnerStrokeDefault = 3;
	
	//circle
	circle = [CAShapeLayer layer];
	circle.fillColor = [UIColor clearColor].CGColor;
	circle.lineCap = kCALineCapRound;
	circle.strokeColor = [UIColor grayColor].CGColor;
	circle.lineWidth = spinnerStrokeDefault;
	[self.layer addSublayer:circle];
	// Center the shape in self.view
	[self updateFrame:frame];
	
	circle.strokeEnd = 0;
	
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

- (void)updateProgress:(float)perc {
	self->circle.strokeEnd = perc;
}

- (float)currentProgress {
	return circle.strokeEnd;
}

- (void)reset {
	circle.strokeEnd = 0;
}

@end
