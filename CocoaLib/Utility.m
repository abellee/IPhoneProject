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
        return [self getCGSizeWithUIFont:[UIFont boldSystemFontOfSize:fontSize] str:string];
    }else{
        return [self getCGSizeWithUIFont:[UIFont systemFontOfSize:fontSize] str:string];
    }
}

+ (CGSize)getCGSizeWithUIFont:(UIFont*)font str:(NSString *)string
{
    return [string sizeWithFont:font];
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

+ (UIImage*)drawCircle:(CGSize)size withColor:(UIColor *)color
{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 0.0);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextAddEllipseInRect(context, CGRectMake(0, 0, size.width, size.height));
    
    CGContextFillPath(context);
    
    UIImage* img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

+ (UIImage*)drawRect:(CGSize)size withColor:(UIColor *)color withAlpha:(float)alpha
{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 0.0);
    CGContextAddRect(context, CGRectMake(0, 0, size.width, size.height));
    CGContextClosePath(context);
    const CGFloat* colorComponent = CGColorGetComponents(color.CGColor);
    CGContextSetRGBFillColor(context, colorComponent[0], colorComponent[1], colorComponent[2], alpha);
    CGContextDrawPath(context, kCGPathFill);
    UIImage* img = UIGraphicsGetImageFromCurrentImageContext();
    return img;
}

+ (CGFloat)getTextHeightWithString:(NSString *)content constrainedToSize:(CGSize)size fontSize:(float)fontSize withMinHeight:(float)minHeight
{
    CGSize finalSize = [content sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap];
    return MAX(finalSize.height, minHeight);
}

@end
