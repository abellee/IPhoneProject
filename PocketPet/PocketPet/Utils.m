//
//  Utils.m
//  YiZu
//
//  Created by Abel Lee on 12-8-10.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+(NSString *)genUDID
{
    NSString* uuidStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"udid"];
    if (!uuidStr) {
        CFUUIDRef uuidObject = CFUUIDCreate(kCFAllocatorDefault);
        
        uuidStr = (NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuidObject);
        
        CFRelease(uuidObject);
        
        [[NSUserDefaults standardUserDefaults] setValue:uuidStr forKey:@"udid"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    return uuidStr;
}

+(BOOL)isSupportMultiTask
{
    return [[UIDevice currentDevice] isMultitaskingSupported];
}

+(NSString *)deviceName
{
    return [[UIDevice currentDevice] name];
}

+(NSString *)systemName
{
    return [[UIDevice currentDevice] systemName];
}

+(NSString *)systemVersion
{
    return [[UIDevice currentDevice] systemVersion];
}

+(NSString *)model
{
    return [[UIDevice currentDevice] model];
}

+(NSString *)localizeModel
{
    return [[UIDevice currentDevice] localizedModel];
}

/**
 * 5.0以前的版本可以使用此方法获得设备唯一标识
 * 但建议使用genUUID来获取
 */
+(NSString *)uniqueIdentifier
{
    return [[UIDevice currentDevice] uniqueIdentifier];
}

+(BOOL)batteryMonitoringEnabled
{
    return [[UIDevice currentDevice] isBatteryMonitoringEnabled];
}

+(float)batteryLevel
{
    return [[UIDevice currentDevice] batteryLevel];
}

+(int)batteryState
{
    return [[UIDevice currentDevice] batteryState];
}

+(void)easeInFromBottomWithView:(UIView *)view rect:(CGRect)rect delegate:(id)delegate
{
    [view setFrame:rect];
    CATransition* animation = [CATransition animation];
    animation.duration = 0.5;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionMoveIn;
    animation.subtype = kCATransitionFromTop;
    animation.delegate = delegate;
    [view.layer addAnimation:animation forKey:nil];
}

+(void)easeOutFromTopWithView:(UIView *)view rect:(CGRect)rect delegate:(id)delegate
{
    [view setFrame:rect];
    CATransition* animation = [CATransition animation];
    animation.duration = 0.5;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionMoveIn;
    animation.subtype = kCATransitionFromTop;
    animation.delegate = delegate;
    [view.layer addAnimation:animation forKey:nil];
}

+(int)secTimeSince1970
{
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970] * 1000;
    return (int)(time / 1000);
}

+(int)milliTimeSince1970
{
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970] * 1000;
    return (int)time;
}

@end
