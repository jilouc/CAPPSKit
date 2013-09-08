//
//  UITableView+CAPPSAdditions.m
//  Cocoapps Toolbox
//
//  Created by Jean-Luc Dagon on 20/05/13.
//  Copyright (c) 2013 Cocoapps. All rights reserved.
//

#import "UITableView+CAPPSAdditions.h"

@implementation UITableView (CAPPSAdditions)

- (NSIndexPath *)capps_indexPathOfView:(UIView *)view
{
    CGPoint viewCenter = [view.superview convertPoint:view.center toView:self];
    NSIndexPath *indexPath = [self indexPathForRowAtPoint:viewCenter];
    return indexPath;
}

@end
