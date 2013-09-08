//
//  CAPPS7Kit.h
//  Cocoapps Toolbox
//
//  Created by Jean-Luc Dagon on 29/06/13.
//  Copyright (c) 2013 Cocoapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CAPPSKitMacros.h"
#import "UIColor+CAPPS7Kit.h"

@interface CAPPS7Kit : NSObject

@property (nonatomic, strong) UIColor *tintColor;

+ (void)setup7StylesWithTintColor:(UIColor *)tintColor;
+ (UIBarButtonItem *)backButtonItemWithTitle:(NSString *)title;

@end

@interface UIViewController (CAPPS7Kit)


- (void)capps_setupScrollViewInsets:(UIScrollView *)scrollView withNavigationBar:(UINavigationBar *)navigationBar;
- (void)capps_setupScrollViewInsets:(UIScrollView *)scrollView withNavigationBar:(UINavigationBar *)navigationBar additionalTopInset:(CGFloat)topInset;;
- (void)capps_setupScrollViewInsets:(UIScrollView *)scrollView;
- (CGFloat)capps_topInsetWithNavigationBar:(UINavigationBar *)navigationBar;
- (CGFloat)capps_topInset;

@end