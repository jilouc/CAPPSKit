//
//  CAPPS7Kit.h
//  Cocoapps Toolbox
//
//  Created by Jean-Luc Dagon on 29/06/13.
//  Copyright (c) 2013 Cocoapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIColor+CAPPS7Kit.h"

@interface CAPPS7Kit : NSObject

@property (nonatomic, strong) UIColor *tintColor;

+ (void)setup7StylesWithTintColor:(UIColor *)tintColor;
+ (UIBarButtonItem *)backButtonItemWithTitle:(NSString *)title;

@end
