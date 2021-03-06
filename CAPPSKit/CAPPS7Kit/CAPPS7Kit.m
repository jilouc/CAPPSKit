//
//  CAPPS7Kit.m
//  Cocoapps Toolbox
//
//  Created by Jean-Luc Dagon on 29/06/13.
//  Copyright (c) 2013 Cocoapps. All rights reserved.
//

#import "CAPPS7Kit.h"
#import "CAPPSKitMacros.h"
#import "UIFont+CAPPSAdditions.h"
#import "UIImage+CAPPSAdditions.h"
#import "UIView+CAPPSAdditions.h"
#import <QuartzCore/QuartzCore.h>

const CGFloat   CAPPS7KitUIControlRadius = 4.0f;
const CGSize    CAPPS7KitUIControlRadiusSize = {4.0f, 4.0f};

@implementation CAPPS7Kit

+ (CAPPS7Kit *)shared7Kit
{
    static CAPPS7Kit *kit = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        kit = [[CAPPS7Kit alloc] init];
    });
    return kit;
}

- (id)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
        [defaultCenter addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    }
    return self;
}

- (void)keyboardWillShow:(NSNotification *)note
{
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^(void){
       
        [window capps_enumerateSubviewsWithBlock:^(UIView *subview, BOOL *stop) {
            if ([subview isKindOfClass:[UISegmentedControl class]]) {
                subview.layer.borderColor = self.tintColor.CGColor;
                subview.layer.cornerRadius = CAPPS7KitUIControlRadius;
                subview.layer.borderWidth = 1.0f;

                *stop = YES;
            }
        } recursive:YES];
        
        [window capps_enumerateSubviewsWithBlock:^(UIView *subview, BOOL *stop) {
            if ([subview isKindOfClass:[UIImageView class]]) {
                if (CGRectGetHeight(subview.frame) < 5) {
                    subview.hidden = YES;
                    *stop = YES;
                }
            }
        } recursive:YES];
        
        [window capps_enumerateSubviewsWithBlock:^(UIView *subview, BOOL *stop) {
            if ([subview isKindOfClass:[UIButton class]]) {
                [(UIButton *)subview setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 4, 0)];
                *stop = YES;
            }
        } recursive:YES];
    });
}

+ (UIBarButtonItem *)backButtonItemWithTitle:(NSString *)title
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title
                                                             style:UIBarButtonItemStylePlain
                                                            target:nil
                                                            action:nil];
    
    UIColor *tintColor = nil;
    if ([UIWindow instancesRespondToSelector:@selector(setTintColor:)] && [UIApplication sharedApplication].keyWindow.tintColor != nil) {
        tintColor = [UIApplication sharedApplication].keyWindow.tintColor;
    } else {
        tintColor = [CAPPS7Kit shared7Kit].tintColor;
    }
    
    [item setBackgroundImage:[[[UIImage imageNamed:@"CAPPS7Kit.bundle/CAPPSBack"]
                               capps_imageWithOverlayColor:tintColor]
                              resizableImageWithCapInsets:UIEdgeInsetsMake(0, 9, 0, 0)]
                    forState:UIControlStateNormal
                  barMetrics:UIBarMetricsDefault];
    [item setTitlePositionAdjustment:UIOffsetMake(10, 0)
                       forBarMetrics:UIBarMetricsDefault];
    
    return item;
    
}

+ (void)setup7StylesWithTintColor:(UIColor *)tintColor
{
    [CAPPS7Kit shared7Kit].tintColor = tintColor;
    
    [[UIButton appearance] setTintColor:tintColor];
    
    // Nav bar
    
    [[UINavigationBar appearance] setTintColor:[UIColorFromRGB(0xf1f1f1) colorWithAlphaComponent:0.8]];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"CAPPS7Kit.bundle/CAPPSNavigationBarBackground"]
                                       forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage imageNamed:@"CAPPS7Kit.bundle/CAPPSNavigationBarShadow"]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           UITextAttributeFont: CAPPSNavigationItemTitleFont,
                                                           UITextAttributeTextColor: [UIColor blackColor],
                                                           UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero],
                                                           }];
    
    // Toolbar
    
    [[UIToolbar appearance] setTintColor:[UIColorFromRGB(0xf1f1f1) colorWithAlphaComponent:0.8]];
    
    [[UIToolbar appearance] setBackgroundImage:[UIImage imageNamed:@"CAPPS7Kit.bundle/CAPPSNavigationBarBackground"]
                            forToolbarPosition:UIToolbarPositionAny
                                    barMetrics:UIBarMetricsDefault];
    
    [[UIToolbar appearance] setShadowImage:[UIImage imageNamed:@"CAPPS7Kit.bundle/CAPPSNavigationBarShadow"] forToolbarPosition:UIToolbarPositionTop];
    [[UIToolbar appearance] setShadowImage:[UIImage imageNamed:@"CAPPS7Kit.bundle/CAPPSToolbarShadow"] forToolbarPosition:UIToolbarPositionBottom];
    
    // Segmented control
    
    UIImage *selectedBackgroundImage = [[UIImage capps_roundedImageWithSize:CGSizeMake(10.0f, 10.f)
                                                                      color:tintColor
                                                                     radius:CAPPS7KitUIControlRadius]
                                        resizableImageWithCapInsets:UIEdgeInsetsMake(CAPPS7KitUIControlRadius,
                                                                                     CAPPS7KitUIControlRadius,
                                                                                     CAPPS7KitUIControlRadius,
                                                                                     CAPPS7KitUIControlRadius)];
    UIImage *highlightedBackgroundImage = [[UIImage capps_roundedImageWithSize:CGSizeMake(10.0f, 10.f)
                                                                         color:[tintColor colorWithAlphaComponent:0.4f]
                                                                        radius:CAPPS7KitUIControlRadius]
                                           resizableImageWithCapInsets:UIEdgeInsetsMake(CAPPS7KitUIControlRadius,
                                                                                        CAPPS7KitUIControlRadius,
                                                                                        CAPPS7KitUIControlRadius,
                                                                                        CAPPS7KitUIControlRadius)];
    UIImage *backgroundImage = [UIImage imageNamed:@"CAPPS7Kit.bundle/CAPPSTransparent"];
    
    NSDictionary *attributes = @{
                                 UITextAttributeFont: [UIFont fontWithName:CAPPSSystemFontMedium size:13.f],
                                 UITextAttributeTextColor: tintColor,
                                 UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero],
                                 };
    [[UISegmentedControl appearance] setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    NSDictionary *highlightedAttributes = @{UITextAttributeTextColor: [UIColor whiteColor]};
    [[UISegmentedControl appearance] setTitleTextAttributes:highlightedAttributes forState:UIControlStateHighlighted];
    
    [[UISegmentedControl appearance] setBackgroundImage:backgroundImage
                                               forState:UIControlStateNormal
                                             barMetrics:UIBarMetricsDefault];
    [[UISegmentedControl appearance] setBackgroundImage:highlightedBackgroundImage
                                               forState:UIControlStateHighlighted
                                             barMetrics:UIBarMetricsDefault];
    [[UISegmentedControl appearance] setBackgroundImage:selectedBackgroundImage
                                               forState:UIControlStateSelected
                                             barMetrics:UIBarMetricsDefault];
    
    [[UISegmentedControl appearance] setDividerImage:[UIImage capps_imageWithColor:tintColor size:CGSizeMake(1.f, 1.f)]
                                 forLeftSegmentState:UIControlStateNormal
                                   rightSegmentState:UIControlStateNormal
                                          barMetrics:UIBarMetricsDefault];
    
    // Bar items
    
    [[UIBarButtonItem appearance] setBackgroundImage:[UIImage imageNamed:@"CAPPS7Kit.bundle/CAPPSTransparent"]
                                            forState:UIControlStateNormal
                                          barMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[[[UIImage imageNamed:@"CAPPS7Kit.bundle/CAPPSBack"]
                                                                 capps_imageWithOverlayColor:tintColor]
                                                                resizableImageWithCapInsets:UIEdgeInsetsMake(0, 9, 0, 0)]
                                                      forState:UIControlStateNormal
                                                    barMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(3, 0)
                                                         forBarMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(3, 0)
                                                         forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setTitleVerticalPositionAdjustment:2 forBarMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{
                                                           UITextAttributeFont:CAPPSBarButtonItemFont,
                                                           UITextAttributeTextColor:tintColor,
                                                           UITextAttributeTextShadowOffset:[NSValue valueWithUIOffset:UIOffsetZero]
                                                           }
                                                forState:UIControlStateNormal];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{
                                                           UITextAttributeFont:CAPPSBarButtonItemFont,
                                                           UITextAttributeTextColor:[tintColor colorWithAlphaComponent:0.4],
                                                           UITextAttributeTextShadowOffset:[NSValue valueWithUIOffset:UIOffsetZero],
                                                           }
                                                forState:UIControlStateHighlighted];
}

@end


