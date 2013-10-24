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

extern NSString *const CAPPSSystemFontFamily;

extern NSString *const CAPPSSystemFontRegular;
extern NSString *const CAPPSSystemFontBold;
extern NSString *const CAPPSSystemFontItalic;
extern NSString *const CAPPSSystemFontMediumItalic;
extern NSString *const CAPPSSystemFontBoldItalic;
extern NSString *const CAPPSSystemFontMedium;
extern NSString *const CAPPSSystemFontCondensedBold;
extern NSString *const CAPPSSystemFontCondensedBlack;
extern NSString *const CAPPSSystemFontLight;
extern NSString *const CAPPSSystemFontLightItalic;
extern NSString *const CAPPSSystemFontUltraLight;
extern NSString *const CAPPSSystemFontUltraLightItalic;
extern NSString *const CAPPSSystemFontThin;
extern NSString *const CAPPSSystemFontThinItalic;

@interface UIFont (CAPPSAdditions)

+ (UIFont *)capps_preferredFontForTextStyle:(NSString *)textStyle;
+ (UIFont *)capps_fontWithFamily:(NSString *)familyName size:(CGFloat)size traits:(UIFontDescriptorSymbolicTraits)traits;

+ (UIFont *)capps_systemItalicFontOfSize:(CGFloat)size;

#define CAPPSBarButtonItemFont ([UIFont fontWithName:CAPPSSystemFontRegular size:18.f])
#define CAPPSNavigationItemTitleFont ([UIFont fontWithName:CAPPSSystemFontMedium size:17.f])


@end
