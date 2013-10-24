//
//  UIDevice+CAPPSAdditions.m
//  Cocoapps Toolbox
//
//  Created by Jean-Luc Dagon on 25/07/13.
//  Copyright (c) 2013 Cocoapps. All rights reserved.
//
//  Based on UIDevice-Hardware
//  Erica Sadun, http://ericasadun.com
//  iPhone Developer's Cookbook, 6.x Edition
//  BSD License, Use at your own risk
//
//  Thanks to Emanuele Vulcano, Kevin Ballard/Eridius, Ryandjohnson, Matt Brown, etc.

#import "UIDevice+CAPPSAdditions.h"
#include <sys/sysctl.h>

@implementation UIDevice (CAPPSAdditions)

/*
 Platforms
 
 iFPGA ->        ??
 
 iPhone1,1 ->    iPhone 1G, M68
 iPhone1,2 ->    iPhone 3G, N82
 iPhone2,1 ->    iPhone 3GS, N88
 iPhone3,1 ->    iPhone 4/AT&T, N89
 iPhone3,2 ->    iPhone 4/Other Carrier?, ??
 iPhone3,3 ->    iPhone 4/Verizon, TBD
 iPhone4,1 ->    (iPhone 4S/GSM), TBD
 iPhone4,2 ->    (iPhone 4S/CDMA), TBD
 iPhone4,3 ->    (iPhone 4S/???)
 iPhone5,1 ->    iPhone Next Gen, TBD
 iPhone5,1 ->    iPhone Next Gen, TBD
 iPhone5,1 ->    iPhone Next Gen, TBD
 
 iPod1,1   ->    iPod touch 1G, N45
 iPod2,1   ->    iPod touch 2G, N72
 iPod2,2   ->    Unknown, ??
 iPod3,1   ->    iPod touch 3G, N18
 iPod4,1   ->    iPod touch 4G, N80
 
 // Thanks NSForge
 iPad1,1   ->    iPad 1G, WiFi and 3G, K48
 iPad2,1   ->    iPad 2G, WiFi, K93
 iPad2,2   ->    iPad 2G, GSM 3G, K94
 iPad2,3   ->    iPad 2G, CDMA 3G, K95
 iPad3,1   ->    (iPad 3G, WiFi)
 iPad3,2   ->    (iPad 3G, GSM)
 iPad3,3   ->    (iPad 3G, CDMA)
 iPad4,1   ->    (iPad 4G, WiFi)
 iPad4,2   ->    (iPad 4G, GSM)
 iPad4,3   ->    (iPad 4G, CDMA)
 
 AppleTV2,1 ->   AppleTV 2, K66
 AppleTV3,1 ->   AppleTV 3, ??
 
 i386, x86_64 -> iPhone Simulator
 */


#pragma mark sysctlbyname utils

- (NSString *)capps_getSysInfoByName:(char *)typeSpecifier
{
    size_t size;
    sysctlbyname(typeSpecifier, NULL, &size, NULL, 0);
    
    char *answer = malloc(size);
    sysctlbyname(typeSpecifier, answer, &size, NULL, 0);
    
    NSString *results = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];
    
    free(answer);
    return results;
}

- (NSString *)capps_platform
{
    return [self capps_getSysInfoByName:"hw.machine"];
}

- (NSUInteger)capps_platformType
{
    NSString *platform = [self capps_platform];
    
    // The ever mysterious iFPGA
    if ([platform isEqualToString:@"iFPGA"])        return CAPPSDeviceIFPGA;
    
    // iPhone
    if ([platform isEqualToString:@"iPhone1,1"])    return CAPPSDevice1GiPhone;
    if ([platform isEqualToString:@"iPhone1,2"])    return CAPPSDevice3GiPhone;
    if ([platform hasPrefix:@"iPhone2"])            return CAPPSDevice3GSiPhone;
    if ([platform hasPrefix:@"iPhone3"])            return CAPPSDevice4iPhone;
    if ([platform hasPrefix:@"iPhone4"])            return CAPPSDevice4SiPhone;
    if ([platform hasPrefix:@"iPhone5"])            return CAPPSDevice5iPhone;
    
    // iPod
    if ([platform hasPrefix:@"iPod1"])              return CAPPSDevice1GiPod;
    if ([platform hasPrefix:@"iPod2"])              return CAPPSDevice2GiPod;
    if ([platform hasPrefix:@"iPod3"])              return CAPPSDevice3GiPod;
    if ([platform hasPrefix:@"iPod4"])              return CAPPSDevice4GiPod;
    
    // iPad
    if ([platform hasPrefix:@"iPad1"])              return CAPPSDevice1GiPad;
    if ([platform hasPrefix:@"iPad2"])              return CAPPSDevice2GiPad;
    if ([platform hasPrefix:@"iPad3"])              return CAPPSDevice3GiPad;
    if ([platform hasPrefix:@"iPad4"])              return CAPPSDevice4GiPad;
    
    // Apple TV
    if ([platform hasPrefix:@"AppleTV2"])           return CAPPSDeviceAppleTV2;
    if ([platform hasPrefix:@"AppleTV3"])           return CAPPSDeviceAppleTV3;
    
    if ([platform hasPrefix:@"iPhone"])             return CAPPSDeviceUnknowniPhone;
    if ([platform hasPrefix:@"iPod"])               return CAPPSDeviceUnknowniPod;
    if ([platform hasPrefix:@"iPad"])               return CAPPSDeviceUnknowniPad;
    if ([platform hasPrefix:@"AppleTV"])            return CAPPSDeviceUnknownAppleTV;
    
    // Simulator thanks Jordan Breeding
    if ([platform hasSuffix:@"86"] || [platform isEqual:@"x86_64"])
    {
        BOOL smallerScreen = [[UIScreen mainScreen] bounds].size.width < 768;
        return smallerScreen ? CAPPSDeviceSimulatoriPhone : CAPPSDeviceSimulatoriPad;
    }
    
    return CAPPSDeviceUnknown;
}

@end
