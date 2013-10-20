//
//  UIColor+CAPPS7Kit.m
//  Cocoapps Toolbox
//
//  Created by Jean-Luc Dagon on 07/09/13.
//  Copyright (c) 2013 Cocoapps. All rights reserved.
//

#import "UIColor+CAPPS7Kit.h"
#import "CAPPSKitMacros.h"

@implementation UIColor (CAPPS7Kit)

+ (instancetype)capps_groupedTableViewBackgroundColor
{
    return UIColorFromRGB(0xefeff4);
}

+ (instancetype)capps_tableViewSectionTitleColor
{
    return UIColorFromRGB(0x6d6d72);
}

+ (instancetype)capps_tableViewSeparatorColor
{
    return UIColorFromRGB(0xc8c7cc);
}

+ (instancetype)capps_systemRedColor
{
    return [UIColor colorWithRed:1.0f green:0.22f blue:0.22f alpha:1.0f];
}

+ (instancetype)capps_systemOrangeColor
{
    return [UIColor colorWithRed:1.0f green:0.58f blue:0.21f alpha:1.0f];
}

+ (instancetype)capps_systemYellowColor
{
    return [UIColor colorWithRed:1.0f green:0.79f blue:0.28f alpha:1.0f];
}

+ (instancetype)capps_systemGreenColor
{
    return [UIColor colorWithRed:0.27f green:0.85f blue:0.46f alpha:1.0f];
}

+ (instancetype)capps_systemLightBlueColor
{
    return [UIColor colorWithRed:0.18f green:0.67f blue:0.84f alpha:1.0f];
}

+ (instancetype)capps_systemDarkBlueColor
{
    return [UIColor colorWithRed:0.0f green:0.49f blue:0.96f alpha:1.0f];
}

+ (instancetype)capps_systemPurpleColor
{
    return [UIColor colorWithRed:0.35f green:0.35f blue:0.81f alpha:1.0f];
}

+ (instancetype)capps_systemPinkColor
{
    return [UIColor colorWithRed:1.0f green:0.17f blue:0.34f alpha:1.0f];
}

+ (instancetype)capps_systemDarkGrayColor
{
    return [UIColor colorWithRed:0.56f green:0.56f blue:0.58f alpha:1.0f];
}

+ (instancetype)capps_systemLightGrayColor
{
    return [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0f];
}

@end
