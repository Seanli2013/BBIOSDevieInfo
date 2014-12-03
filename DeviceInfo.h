//
//  DeviceInfo.h
//  适用于目标为7.0以上的系统
//
//  Created by Xiang LI on 4/24/14.
//  Copyright (c) 2014 com.bigbelldev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DeviceInfo : NSObject
+ (BOOL)isPad;
+ (BOOL)isIOS7;
+ (BOOL)iOS8OrHigher;
+ (NSString *)systemVersionString;
+ (NSString *)appNameString;
+ (NSString *)appVersionString;
@end
