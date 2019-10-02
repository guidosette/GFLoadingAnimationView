//
//  GFSimpleSpinner.h
//  // Fanfa
//
//  Created by Guido Fanfani on 22/09/19.
//  Copyright © 2019 Fanfa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GFPercSpinner : UIView

/**
 Set color of spinner
 @param color of spinner stroke. default: grayColor
 */
- (void)setStrokeColor:(UIColor*)color;

/**
 Set spinner stroke
 @param width spinner stroke. default: 3
 */
- (void)setStrokeWidth:(float)width;

/**
 Update spinner's frame
 @param frame of spinner
 */
- (void)updateFrame:(CGRect)frame;

/**
 set current progress = 0
 */
- (void)reset;

/**
 Method to update current progress
 @param perc set current progress. Value is between [0,1]
 */
- (void)updateProgress:(float)perc;

/**
 Get current progress
 @return Float that rappresent current progress
 */
- (float)currentProgress;

@end
