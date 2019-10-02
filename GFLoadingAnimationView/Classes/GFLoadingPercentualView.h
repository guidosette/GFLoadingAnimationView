//
//  GFLoadingPercentualView.h
//  // Fanfa
//
//  Created by Guido Fanfani on 01/10/19.
//  Copyright © 2019 Fanfa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GFLoadingAnimationView.h"

@interface GFLoadingPercentualView : UIView

/**
 Update current progress
 @param perc set current progress. Value is between [0,1]
 */
+ (void)updateProgress:(float)perc;

/**
 Check current progress
 @return Float that rappresents current progress. Default 0.
 */
+ (float)currentProgress;

/**
Set show label
@param show label or not. default: false
*/
+ (void)showLabel:(bool)show;

/**
Set circle size
@param color  of label. default: darkGrayColor
*/
+ (void)setLabelColor:(UIColor*)color;

/**
Set label font size size
@param fontSize  of label. default: 12
*/
+ (void)setLabelFontSize:(float)fontSize;

/**
 Show loading view
 */
+ (void)showLoadingView;

/**
 Hide loading view
 */
+ (void)hideLoadingView;

/**
 Check if loading view is showing or not.
 @return Boolean that rappresents if loading view is showing or not.
 */
+ (bool)isLoading;

/**
 Set circle size
 @param size circle's size. default: 100
 */
+ (void)setCircleSize:(float)size;

/**
 Set spinner stroke color
 @param color spinner stroke color. default: grayColor
 */
+ (void)setSpinnerStrokeColor:(UIColor*)color;

/**
 Set spinner stroke width
 @param width spinner stroke. default: 3
 */
+ (void)setSpinnerStrokeWidth:(float)width;

/**
 Set circle background color
 @param color background color of circle. default: groupTableViewBackgroundColor
 */
+ (void)setCircleBackgroundColor:(UIColor*)color;

/**
 Set image
 @param image  default: nil
 */
+ (void)setImage:(UIImage*)image;

/**
 Set image size
 @param sizePerc circle's size percentage compared to size of circle. default: 0.4
 */
+ (void)setImageSizePerc:(float)sizePerc;

@end
