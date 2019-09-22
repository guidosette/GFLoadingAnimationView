//
//  GFSimpleSpinner.h
//  // Fanfa
//
//  Created by Guido Fanfani on 22/09/19.
//  Copyright © 2019 Fanfa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GFSimpleSpinner : UIView

/**
Set color of spinner
@param color of spinner stroke. default: grayColor
*/
- (void)setStrokeColor:(UIColor*)color;

/**
Set spinner stroke
@param width spinner stroke. default: 7
*/
- (void)setStrokeWidth:(float)width;

/**
Update spinner's frame
@param frame of spinner
*/
- (void)updateFrame:(CGRect)frame;

@end
