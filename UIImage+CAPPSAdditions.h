//
//  UIImage+CAPPSAdditions.h
//  Cocoapps Toolbox
//
//  Created by Jean-Luc Dagon on 13/03/13.
//  Copyright (c) 2013 Cocoapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CAPPSAdditions)

- (UIImage *)capps_normalizedImage;
- (UIImage *)capps_imageWithOverlayColor:(UIColor *)color;

+ (UIImage *)capps_roundedImageWithSize:(CGSize)size
                                  color:(UIColor *)color
                                 radius:(CGFloat)radius;

+ (UIImage *)capps_imageWithBezierPath:(UIBezierPath *)path
                                 color:(UIColor *)color
                       backgroundColor:(UIColor *)backgroundColor;

+ (UIImage *)capps_imageWithColor:(UIColor *)color
                             size:(CGSize)size;

@end
