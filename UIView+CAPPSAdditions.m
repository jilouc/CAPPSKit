//
//  UIView+CAPPSAdditions.m
//  Cocoapps Toolbox
//
//  Created by Jean-Luc Dagon on 14/07/13.
//  Copyright (c) 2013 Cocoapps. All rights reserved.
//

#import "UIView+CAPPSAdditions.h"

@implementation UIView (CAPPSAdditions)

- (void)capps_enumerateSubviewsWithBlock:(void(^)(UIView *subview, BOOL *stop))block
                               recursive:(BOOL)recursive
{
    BOOL stop = NO;
    for (UIView *subview in self.subviews) {
        block(subview, &stop);
        if (stop) {
            return;
        }
        if (recursive) {
            [subview capps_enumerateSubviewsWithBlock:block recursive:recursive];
            if (stop) {
                return;
            }
        }
    }
}

- (UIView *)capps_firstAscendantWithClass:(Class)klass
{
    UIView *view = self.superview;
    while (view) {
        if ([view isKindOfClass:klass]) {
            return view;
        }
        view = view.superview;
    }
    return nil;
}

@end
