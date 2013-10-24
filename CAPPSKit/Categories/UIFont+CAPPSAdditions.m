//
//  UIFont+CAPPSAdditions.m
//  Cocoapps Toolbox
//
//  Created by Jean-Luc Dagon on 19/06/13.
//  Copyright (c) 2013 Cocoapps. All rights reserved.
//

#import "UIFont+CAPPSAdditions.h"

static NSDictionary *_mapping;
static NSMutableDictionary *_fontsMapping;

NSString *const CAPPSSystemFont                     = @"HelveticaNeue";
NSString *const CAPPSSystemFontFormat               = @"HelveticaNeue-%@";

NSString *const CAPPSSystemFontFamily               = @"Helvetica Neue";

NSString *const CAPPSSystemFontRegular              = @"HelveticaNeue";
NSString *const CAPPSSystemFontBold                 = @"HelveticaNeue-Bold";
NSString *const CAPPSSystemFontItalic               = @"HelveticaNeue-Italic";
NSString *const CAPPSSystemFontMediumItalic         = @"HelveticaNeue-MediumItalic";
NSString *const CAPPSSystemFontBoldItalic           = @"HelveticaNeue-BoldItalic";
NSString *const CAPPSSystemFontMedium               = @"HelveticaNeue-Medium";
NSString *const CAPPSSystemFontCondensedBold        = @"HelveticaNeue-CondensedBold";
NSString *const CAPPSSystemFontCondensedBlack       = @"HelveticaNeue-CondensedBlack";
NSString *const CAPPSSystemFontLight                = @"HelveticaNeue-Light";
NSString *const CAPPSSystemFontLightItalic          = @"HelveticaNeue-LightItalic";
NSString *const CAPPSSystemFontUltraLight           = @"HelveticaNeue-UltraLight";
NSString *const CAPPSSystemFontUltraLightItalic     = @"HelveticaNeue-UltraLightItalic";
NSString *const CAPPSSystemFontThin                 = @"HelveticaNeue-Thin";
NSString *const CAPPSSystemFontThinItalic           = @"HelveticaNeue-ThinItalic";

NSString *const CAPPSFontTextStyleHeadline          = @"CAPPSFontTextStyleHeadline";
NSString *const CAPPSFontTextStyleBody              = @"CAPPSFontTextStyleBody";
NSString *const CAPPSFontTextStyleSubheadline       = @"CAPPSFontTextStyleSubheadline";
NSString *const CAPPSFontTextStyleFootnote          = @"CAPPSFontTextStyleFootnote";
NSString *const CAPPSFontTextStyleCaption1          = @"CAPPSFontTextStyleCaption1";
NSString *const CAPPSFontTextStyleCaption2          = @"CAPPSFontTextStyleCaption2";


@implementation UIFont (CAPPSAdditions)

+ (UIFont *)capps_fontWithFamily:(NSString *)familyName size:(CGFloat)size traits:(UIFontDescriptorSymbolicTraits)traits
{
    UIFontDescriptor *fontDescriptor = [UIFontDescriptor fontDescriptorWithName:familyName size:size];
    UIFontDescriptor *symbolicFontDescriptor = [fontDescriptor fontDescriptorWithSymbolicTraits:traits];
    if (!symbolicFontDescriptor) {
        return [UIFont fontWithDescriptor:fontDescriptor size:size];
    }
    return [UIFont fontWithDescriptor:symbolicFontDescriptor size:size];
}

+ (UIFont *)capps_systemItalicFontOfSize:(CGFloat)size
{
    UIFont *font = [UIFont fontWithName:CAPPSSystemFontItalic size:size];
    if (!font && NSClassFromString(@"UIFontDescriptor")) {
        font = [self capps_fontWithFamily:CAPPSSystemFontFamily size:size traits:UIFontDescriptorTraitItalic];
    }
    return font;
}

+ (UIFont *)capps_preferredFontForTextStyle:(NSString *)textStyle
{
    if (!_mapping) {
#if  __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
        if (NSClassFromString(@"UIFontDescriptor")) {
            _mapping = @{
                         CAPPSFontTextStyleHeadline: UIFontTextStyleHeadline,
                         CAPPSFontTextStyleBody: UIFontTextStyleBody,
                         CAPPSFontTextStyleSubheadline: UIFontTextStyleSubheadline,
                         CAPPSFontTextStyleFootnote: UIFontTextStyleFootnote,
                         CAPPSFontTextStyleCaption1: UIFontTextStyleCaption1,
                         CAPPSFontTextStyleCaption2: UIFontTextStyleCaption2,
                         };
        } else {
            _mapping = @{};
        }
#else
        _mapping = @{};
#endif
    }
    if ([_mapping count] == 0) {
        if (!_fontsMapping) {
            _fontsMapping = @{}.mutableCopy;
        }
        UIFont *font = _fontsMapping[textStyle];
        if (!font) {
            if ([textStyle isEqualToString:CAPPSFontTextStyleHeadline]) {
                font = [UIFont fontWithName:CAPPSSystemFontMedium size:17];
            } else if ([textStyle isEqualToString:CAPPSFontTextStyleBody]) {
                font = [UIFont fontWithName:CAPPSSystemFontLight size:17];
            } else if ([textStyle isEqualToString:CAPPSFontTextStyleSubheadline]) {
                font = [UIFont fontWithName:CAPPSSystemFont size:15];
            } else if ([textStyle isEqualToString:CAPPSFontTextStyleFootnote]) {
                font = [UIFont fontWithName:CAPPSSystemFont size:13];
            } else if ([textStyle isEqualToString:CAPPSFontTextStyleCaption1]) {
                font = [UIFont fontWithName:CAPPSSystemFont size:12];
            } else if ([textStyle isEqualToString:CAPPSFontTextStyleCaption2]) {
                font = [UIFont fontWithName:CAPPSSystemFont size:11];
            } else{
                font = [UIFont systemFontOfSize:14];
            }
            _fontsMapping[textStyle] = font;
        }
        return font;
    } else {
#if  __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
        return [self preferredFontForTextStyle:_mapping[textStyle]];
#else
        return nil;
#endif
    }
    
}


@end
