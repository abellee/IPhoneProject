//
//  Utility.m
//  KeYiDian
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "Utility.h"

@implementation Utility

static Utility* instance;

+ (id)sharedInstance
{
    if (instance == nil) {
        instance = [[self alloc] init];
    }
    return instance;
}

+ (NSString *)genUDID
{
    CFUUIDRef uuidObject = CFUUIDCreate(kCFAllocatorDefault);
    NSString* uuidStr = (NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuidObject);
    CFRelease(uuidObject);
    return uuidStr;
}

+ (BOOL)isSupportMultiTask
{
    return [[UIDevice currentDevice] isMultitaskingSupported];
}

+ (NSString *)deviceName
{
    return [[UIDevice currentDevice] name];
}

+ (NSString *)systemName
{
    return [[UIDevice currentDevice] systemName];
}

+ (NSString *)systemVersion
{
    return [[UIDevice currentDevice] systemVersion];
}

+ (NSString *)model
{
    return [[UIDevice currentDevice] model];
}

+ (NSString *)localizeModel
{
    return [[UIDevice currentDevice] localizedModel];
}

+ (BOOL)batteryMonitoringEnabled
{
    return [[UIDevice currentDevice] isBatteryMonitoringEnabled];
}

+ (float)batteryLevel
{
    return [[UIDevice currentDevice] batteryLevel];
}

+ (int)batteryState
{
    return [[UIDevice currentDevice] batteryState];
}

+ (int)secTimeSince1970
{
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970] * 1000;
    return (int)(time / 1000);
}

+ (int)milliTimeSince1970
{
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970] * 1000;
    return (int)time;
}

+ (CGSize)getCGSizeWithFontSize:(float)fontSize str:(NSString *)string isBold:(BOOL)bold
{
    if (bold) {
        return [string sizeWithFont:[UIFont boldSystemFontOfSize:fontSize]];
    }else{
        return [string sizeWithFont:[UIFont systemFontOfSize:fontSize]];
    }
}

+ (CABasicAnimation*)animationProperty:(NSString *)property duration:(float)duration fromValue:(NSNumber *)fromValue toValue:(NSNumber *)toValue delegate:(id)delegate bounce:(BOOL)isBounce animationIdentifyKey:(NSString *)key animationIdentifyValue:(NSString *)value
{
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:property];
    if (key != nil && value != nil) {
        [animation setValue:value forKey:key];
    }
    animation.duration = duration;
    animation.fromValue = fromValue;
    animation.toValue = toValue;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.autoreverses = NO;
    animation.delegate = delegate;
    if (isBounce) {
        animation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.5 :1.5 :0.5 :1.0];
    }
    return animation;
}

@end
