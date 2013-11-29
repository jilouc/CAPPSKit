//
//  NSArray+CAPPSAdditions.m
//  CAPPSKit
//
//  Created by Jean-Luc Dagon on 29/11/2013.
//  Copyright (c) 2013 Cocoapps. All rights reserved.
//

#import "NSArray+CAPPSAdditions.h"

@implementation NSArray (CAPPSAdditions)

- (NSArray *)capps_shuffledArray
{
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:[self count]];
	for (id anObject in self) {
		NSUInteger randomPos = arc4random()%([tmpArray count]+1);
		[tmpArray insertObject:anObject atIndex:randomPos];
	}
	return [NSArray arrayWithArray:tmpArray];
}

@end
