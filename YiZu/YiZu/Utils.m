//
//  Utils.m
//  YiZu
//
//  Created by Abel Lee on 12-8-10.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+(NSString *)genUUID
{
    // Create universally unique identifier (object)
    CFUUIDRef uuidObject = CFUUIDCreate(kCFAllocatorDefault);
    
    // Get the string representation of CFUUID object.
    NSString *uuidStr = (NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuidObject);
    
    // If needed, here is how to get a representation in bytes, returned as a structure
    // typedef struct {
    //   UInt8 byte0;
    //   UInt8 byte1;
    //   ...
    //   UInt8 byte15;
    // } CFUUIDBytes;
    //CFUUIDBytes bytes = CFUUIDGetUUIDBytes(uuidObject);
    
    CFRelease(uuidObject);
    
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

+(void)easeInFromBottomWithView:(UIView *)view delegate:(id)delegate
{
    [view setFrame:CGRectMake(0, 0, 320, 480)];
    CATransition* animation = [CATransition animation];
    animation.duration = 0.5;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionMoveIn;
    animation.subtype = kCATransitionFromTop;
    animation.delegate = delegate;
    [view.layer addAnimation:animation forKey:nil];
}

+(void)easeOutFromTopWithView:(UIView *)view delegate:(id)delegate
{
    [view setFrame:CGRectMake(0, -480, 320, 480)];
    CATransition* animation = [CATransition animation];
    animation.duration = 0.5;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionMoveIn;
    animation.subtype = kCATransitionFromTop;
    animation.delegate = delegate;
    [view.layer addAnimation:animation forKey:nil];
}

@end
