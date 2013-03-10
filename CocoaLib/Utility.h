//
//  Utility.h
//  KeYiDian
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface Utility : NSObject

+ (id)sharedInstance;
+ (NSString *)genUDID;
+ (BOOL)isSupportMultiTask;
+ (NSString *)deviceName;
+ (NSString *)systemName;
+ (NSString *)systemVersion;
+ (NSString *)model;
+ (NSString *)localizeModel;
+ (BOOL)batteryMonitoringEnabled;
+ (float)batteryLevel;
+ (int)batteryState;
+ (int)secTimeSince1970;
+ (int)milliTimeSince1970;
+ (CGSize)getCGSizeWithFontSize:(float)fontSize str:(NSString*)string isBold:(BOOL)bold;
+ (CABasicAnimation*)animationProperty:(NSString *)property duration:(float)duration fromValue:(NSNumber *)fromValue toValue:(NSNumber *)toValue delegate:(id)delegate bounce:(BOOL)isBounce animationIdentifyKey:(NSString *)key animationIdentifyValue:(NSString *)value;

@end
