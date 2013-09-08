//
//  NSString+CAPPSAdditions.m
//  Cocoapps Toolbox
//
//  Created by Jean-Luc Dagon on 18/07/13.
//  Copyright (c) 2013 Cocoapps. All rights reserved.
//

#import "NSString+CAPPSAdditions.h"

@implementation NSString (CAPPSAdditions)

- (NSString *)capps_urlEncodeUsingEncoding:(NSStringEncoding)encoding
{
	return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                               (__bridge CFStringRef)self,
                                                               NULL,
                                                               (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                               CFStringConvertNSStringEncodingToEncoding(encoding));
}

@end
