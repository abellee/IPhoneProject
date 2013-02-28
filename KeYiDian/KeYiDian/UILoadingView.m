//
//  UILoadingView.m
//  KeYiDian
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "UILoadingView.h"

@implementation UILoadingView

@synthesize contentStr;

- (id)initWithFrameAndContent:(CGRect)rect content:(NSString *)content
{
    if (self = [super initWithFrame:rect]) {
        [self contentStr:content];
        self.backgroundColor = [UIColor clearColor];
        [self initLabel];
        [self initIndicatorView];
        
        [self addSubview:indicatorView];
        [self addSubview:contentLabel];
    }
    return self;
}

- (void)initIndicatorView
{
    indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [indicatorView setCenter:CGPointMake(self.frame.size.width / 2, 40)];
    [indicatorView startAnimating];
}

- (void)initLabel
{
    if (contentLabel == nil) {
        CGSize strSize = [contentStr sizeWithFont:[UIFont systemFontOfSize:14.0]];
        contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height - strSize.height - 20, self.frame.size.width, strSize.height)];
        [contentLabel setText:contentStr];
        [contentLabel setTextColor:[UIColor whiteColor]];
        contentLabel.backgroundColor = [UIColor clearColor];
        [contentLabel setFont:[UIFont systemFontOfSize:14.0]];
        contentLabel.textAlignment = NSTextAlignmentCenter;
    }
}

- (void)contentStr:(NSString *)content
{
    if (contentStr != nil) {
        [contentStr release];
    }
    contentStr = [content retain];
    
    [self initLabel];
    [contentLabel setText:contentStr];
}

- (void)drawRect:(CGRect)rect
{
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    // 简便起见，这里把圆角半径设置为长和宽平均值的1/10
    CGFloat radius = (width + height) * 0.05;
    
    // 获取CGContext，注意UIKit里用的是一个专门的函数
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 移动到初始点
    CGContextMoveToPoint(context, radius, 0);
    
    // 绘制第1条线和第1个1/4圆弧
    CGContextAddLineToPoint(context, width - radius, 0);
    CGContextAddArc(context, width - radius, radius, radius, -0.5 * M_PI, 0.0, 0);
    
    // 绘制第2条线和第2个1/4圆弧
    CGContextAddLineToPoint(context, width, height - radius);
    CGContextAddArc(context, width - radius, height - radius, radius, 0.0, 0.5 * M_PI, 0);
    
    // 绘制第3条线和第3个1/4圆弧
    CGContextAddLineToPoint(context, radius, height);
    CGContextAddArc(context, radius, height - radius, radius, 0.5 * M_PI, M_PI, 0);
    
    // 绘制第4条线和第4个1/4圆弧
    CGContextAddLineToPoint(context, 0, radius);
    CGContextAddArc(context, radius, radius, radius, M_PI, 1.5 * M_PI, 0);
    
    // 闭合路径
    CGContextClosePath(context);
    // 填充半透明黑色
    CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.5);
    CGContextDrawPath(context, kCGPathFill);
}

- (void)dealloc
{
    NSLog(@"*********** UILoadingView Dealloc **************");
    
    [indicatorView release];
    [contentLabel release];
    [contentStr release];
    
    [super dealloc];
}

@end
