//
//  UIViewController+CAPPSAdditions.m
//  CAPPSKit
//
//  Created by Jean-Luc Dagon on 24/10/2013.
//  Copyright (c) 2013 Cocoapps. All rights reserved.
//

#import "UIViewController+CAPPSAdditions.h"

@implementation UIViewController (CAPPSAdditions)

+ (instancetype)capps_viewControllerWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (!nibNameOrNil) {
        nibNameOrNil = NSStringFromClass(self.class);
    }
    UINib *nib = [UINib nibWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (!nib) {
        return [[self alloc] initWithNibName:nil bundle:nil];
    }
    NSArray *nibContents = [nib instantiateWithOwner:nil options:nil];
    if (nibContents.count == 0) {
        return nil;
    }
    for (id nibContentComponent in nibContents) {
        if ([nibContentComponent isKindOfClass:[self class]]) {
            return nibContentComponent;
        }
    }
    return nil;
}

@end
