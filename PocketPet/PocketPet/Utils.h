//
//  Utils.h
//  YiZu
//
//  Created by Abel Lee on 12-8-10.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface Utils : NSObject

+(NSString *)genUDID;
+(BOOL)isSupportMultiTask;
+(NSString *)deviceName;
+(NSString *)systemName;
+(NSString *)systemVersion;
+(NSString *)model;
+(NSString *)localizeModel;
+(NSString *)uniqueIdentifier;
+(BOOL)batteryMonitoringEnabled;
+(float)batteryLevel;
+(int)batteryState;
+(int)secTimeSince1970;
+(int)milliTimeSince1970;

+(void)easeInFromBottomWithView:(UIView *)view rect:(CGRect)rect delegate:(id)delegate;
+(void)easeOutFromTopWithView:(UIView *)view rect:(CGRect)rect delegate:(id)delegate;

@end
