//
//  LoadingAnimationView.h
//  // Fanfa
//
//  Created by Guido Fanfani on 22/09/19.
//  Copyright © 2019 Fanfa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GFLoadingAnimationView : UIView

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
 Set circle size
 @param color spinner stroke color. default: grayColor
 */
+ (void)setSpinnerStrokeColor:(UIColor*)color;

/**
 Set circle size
 @param width spinner stroke. default: 7
 */
+ (void)setSpinnerStrokeWidth:(float)width;

/**
 Set circle size
 @param color background color of circle. default: groupTableViewBackgroundColor
 */
+ (void)setCircleBackgroundColor:(UIColor*)color;

/**
 Set circle size
 @param image  default: nil
 */
+ (void)setImage:(UIImage*)image;

/**
 Set circle size
 @param sizePerc circle's size percentage compared to size of circle. default: 0.4
 */
+ (void)setImageSizePerc:(float)sizePerc;

@end
