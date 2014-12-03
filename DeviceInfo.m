//
//  DeviceInfo.m
//
//  Created by Xiang LI on 4/24/14.
//  Copyright (c) 2014 com.bigbelldev. All rights reserved.
//

#import "DeviceInfo.h"
// Debug purpose
//#define BB_DEBUG
//#define BB_DEBUG_IOS7
//#define BB_DEBUG_IOS8


@implementation DeviceInfo
// 判断是否是iPad
+ (BOOL)isPad
{
    static BOOL isPad;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^
    {
        isPad = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
    });
    return isPad;
}

// 判断是否是ios7
+ (BOOL)isIOS7
{
    static BOOL isIOS7;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^
                  {
                        isIOS7 = (7 == [self getMajorVersionNumber:[self systemVersionString]]);
                  });
    return isIOS7;
}

// 判断是否是iOS8
+ (BOOL)iOS8OrHigher
{
    static BOOL iOS8OrHigher;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      iOS8OrHigher = (8 <= [self getMajorVersionNumber:[self systemVersionString]]);
                  });
    return iOS8OrHigher;
}

+ (NSString *)systemVersionString
{
#ifdef BB_DEBUG
    NSLog(@"1----%@", [NSString stringWithFormat:@"iOS: %@", [UIDevice currentDevice].systemVersion]);
#endif
    return [NSString stringWithFormat:@"iOS: %@", [UIDevice currentDevice].systemVersion];
}

+ (NSString *)appNameString
{
    return [NSString stringWithFormat:@"App Name: %@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]];
}

+ (NSString *)appVersionString
{
    return [NSString stringWithFormat:@"Version: %@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];
}

+ (NSInteger)getMajorVersionNumber:(NSString *)versionString
{
    NSString *rawString = [[versionString componentsSeparatedByString:@"."] firstObject];
    NSString *majorVersionNumberString = [[rawString componentsSeparatedByString:@" "] lastObject];
#ifdef BB_DEBUG
    NSLog(@"BB_DEBUG: versionString: %@---------NO.:%ld", versionString, (long)[majorVersionNumberString integerValue]);
    
#endif
    
#ifdef BB_DEBUG_IOS7
    return 7;
#endif
    
#ifdef BB_DEBUG_IOS8
    return 8;
#endif
    
    return [majorVersionNumberString integerValue];

}

@end
