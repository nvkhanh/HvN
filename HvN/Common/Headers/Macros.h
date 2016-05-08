//
//  Marcos.h
//  LNReader
//
//  Created by Trung Le on 6/13/15.
//  Copyright (c) 2015 XXX. All rights reserved.
//

#import <Foundation/Foundation.h>

#define makeURL(__url__) [NSURL URLWithString:__url__]
#define makeAttributeString(__string__, __attributes__) [[NSAttributedString alloc] initWithString:__string__ attributes:__attributes__]
#define randomInt(__min__, __max__) (__min__ + rand() % (__max__ - __min__))
#define makeIndexPath(__row__, __section__) [NSIndexPath indexPathForRow:__row__ inSection:__section__]
#define localizedString(a) NSLocalizedString(a, nil)
#define makeStringFormat(__format__, ...) [NSString stringWithFormat:__format__, ##__VA_ARGS__]

#define SubclassMustOverride                                                                                                \
    [NSException raise:NSInternalInconsistencyException format:@"Subclasses must override %@", NSStringFromSelector(_cmd)]; \
    exit(0);

#define screenSize [UIScreen mainScreen].bounds.size
#define screenRate ([[UIScreen mainScreen] bounds].size.width / 375)
//#define screenRate 1.0f
#define adjustValue(__value__) (__value__ = __value__ * screenRate)

// get font size depend on the screen rate
// Using iPhone 6 as a main screen size, sizeRate = (currentScreenSize.width/mainScreenSize.width)
//#define getFontSize(a) a *screenRate
#define getFontSize(a) a

#ifdef DEBUG
#        define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#        define DLog(...)
#endif

//For detecting UI style
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
#define IS_IOS7 (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1)
#define IS_IOS8 (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1)
#define kScreenFrame [UIScreen mainScreen].bounds
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define IS_WIDESCREEN (kScreenFrame.size.height > 480)
#define IS_PORTRAINT (UIDeviceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation))
#define kKeyboardHeight 216 + 40
#define IS_RETINA ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0))

//For application window
#define appDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])
//#define lastWindow  ((UIWindow *)[[UIApplication sharedApplication].windows lastObject])
#define lastWindow  ((UIWindow *)[[UIApplication sharedApplication] keyWindow])

//For color
/* color */
#define ColorRGBA(R,G,B,A)          [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define ColorRGB(R,G,B)             ColorRGBA(R,G,B,1.0)
#define UIColorFromRGB(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorFromRGBA(rgbValue, a)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#define UIColorFromImage(image)     [UIColor colorWithPatternImage:image]

#define UIColorFromString(hexString) [UIColor colorFromHexString:(hexString)]

#define gradiantBackgroundStart [UserDefaultHelper getGradiantBackgroundStart] ? UIColorFromString([UserDefaultHelper getGradiantBackgroundStart]) : [UIColor redColor]
#define gradiantBackgroundEnd  [UserDefaultHelper getGradiantBackgroundEnd] ? UIColorFromString([UserDefaultHelper getGradiantBackgroundEnd]) : [UIColor redColor]
