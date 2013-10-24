//
//  UIWindow+CAPPSAdditions.m
//  Cocoapps Toolbox
//
//  Created by Jean-Luc Dagon on 24/07/13.
//  Copyright (c) 2013 Cocoapps. All rights reserved.
//

#import "UIWindow+CAPPSAdditions.h"

@implementation UIWindow (CAPPSAdditions)

- (UIViewController *)capps_frontMostRootViewController
{
    UIViewController *rvc = self.rootViewController;
    while (rvc.presentedViewController) {
        rvc = rvc.presentedViewController;
    }
    return rvc;
}

@end
