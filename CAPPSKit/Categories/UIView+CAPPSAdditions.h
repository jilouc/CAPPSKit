//
//  UIView+CAPPSAdditions.h
//  Cocoapps Toolbox
//
//  Created by Jean-Luc Dagon on 14/07/13.
//  Copyright (c) 2013 Cocoapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CAPPSAdditions)

- (void)capps_enumerateSubviewsWithBlock:(void(^)(UIView *subview, BOOL *stop))block
                               recursive:(BOOL)recursive;

- (UIView *)capps_firstAscendantWithClass:(Class)klass;

@end
