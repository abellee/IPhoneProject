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

+(NSString *)genUUID;
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

+(void)easeInFromBottomWithView:(UIView *)view delegate:(id)delegate;
+(void)easeOutFromTopWithView:(UIView *)view delegate:(id)delegate;

@end
