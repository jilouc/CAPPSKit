//
//  UIFont+CAPPSAdditions.h
//  Cocoapps Toolbox
//
//  Created by Jean-Luc Dagon on 19/06/13.
//  Copyright (c) 2013 Cocoapps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

extern NSString *const CAPPSFontTextStyleHeadline;
extern NSString *const CAPPSFontTextStyleBody;
extern NSString *const CAPPSFontTextStyleSubheadline;
extern NSString *const CAPPSFontTextStyleFootnote;
extern NSString *const CAPPSFontTextStyleCaption1;
extern NSString *const CAPPSFontTextStyleCaption2;

extern NSString *const CAPPSSystemFontRegular;
extern NSString *const CAPPSSystemFontBold;
extern NSString *const CAPPSSystemFontItalic;
extern NSString *const CAPPSSystemFontBoldItalic;
extern NSString *const CAPPSSystemFontMedium;
extern NSString *const CAPPSSystemFontCondensedBold;
extern NSString *const CAPPSSystemFontCondensedBlack;
extern NSString *const CAPPSSystemFontLight;
extern NSString *const CAPPSSystemFontLightItalic;
extern NSString *const CAPPSSystemFontUltraLight;
extern NSString *const CAPPSSystemFontUltraLightItalic;

@interface UIFont (CAPPSAdditions)

+ (UIFont *)capps_preferredFontForTextStyle:(NSString *)textStyle;

#define CAPPSBarButtonItemFont ([UIFont fontWithName:CAPPSSystemFontRegular size:18.f])
#define CAPPSNavigationItemTitleFont ([UIFont fontWithName:CAPPSSystemFontMedium size:17.f])


@end
