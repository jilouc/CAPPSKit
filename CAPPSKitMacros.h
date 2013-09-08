//
//  CAPPSKitMacros.h
//  Cocoapps Toolbox
//
//  Created by Jean-Luc Dagon on 20/05/13.
//  Copyright (c) 2013 Cocoapps. All rights reserved.
//

#ifndef _CAPPS_CAPPSKitMacros_h_

#define _CAPPS_CAPPSKitMacros_h_

#define CAPPSVoidLog(_fmt, ...) do{}while(0)

#define UIColorFromRGB(rgbValue) [UIColor \
    colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
    green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
    blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#endif