#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "TLAnimationProtocol.h"
#import "TLAnimationTabBar.h"
#import "TLTabBarAnimation.h"
#import "UITabBar+TLAnimation.h"
#import "UITabBarItem+TLAnimation.h"

FOUNDATION_EXPORT double TLAnimationTabBarVersionNumber;
FOUNDATION_EXPORT const unsigned char TLAnimationTabBarVersionString[];

