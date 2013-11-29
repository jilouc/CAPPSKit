//
//  UIDevice+CAPPSAdditions.h
//  Cocoapps Toolbox
//
//  Created by Jean-Luc Dagon on 25/07/13.
//  Copyright (c) 2013 Cocoapps. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CAPPSDevicePlatform) {
    CAPPSDeviceUnknown,
    
    CAPPSDeviceSimulator,
    CAPPSDeviceSimulatoriPhone,
    CAPPSDeviceSimulatoriPad,
    CAPPSDeviceSimulatorAppleTV,
    
    CAPPSDevice1GiPhone,
    CAPPSDevice3GiPhone,
    CAPPSDevice3GSiPhone,
    CAPPSDevice4iPhone,
    CAPPSDevice4SiPhone,
    CAPPSDevice5iPhone,
    
    CAPPSDevice1GiPod,
    CAPPSDevice2GiPod,
    CAPPSDevice3GiPod,
    CAPPSDevice4GiPod,
    
    CAPPSDevice1GiPad,
    CAPPSDevice2GiPad,
    CAPPSDevice3GiPad,
    CAPPSDevice4GiPad,
    
    CAPPSDeviceAppleTV2,
    CAPPSDeviceAppleTV3,
    CAPPSDeviceAppleTV4,
    
    CAPPSDeviceUnknowniPhone,
    CAPPSDeviceUnknowniPod,
    CAPPSDeviceUnknowniPad,
    CAPPSDeviceUnknownAppleTV,
    CAPPSDeviceIFPGA,
    
};

@interface UIDevice (CAPPSAdditions)

- (NSUInteger)capps_platformType;
- (NSString *)capps_platform;

@end
