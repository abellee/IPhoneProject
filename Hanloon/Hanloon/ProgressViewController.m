//
//  ProgressViewController.m
//  Hanloon
//
//  Created by Abel Lee on 13-11-4.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import "ProgressViewController.h"

@implementation ProgressViewController

@synthesize titleLabel, progressView, cancelBtn, alertBK, maskLayer, delegate, textLabel;

- (id)init
{
    self = [super init];
    if (self == nil) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [self.view setFrame:CGRectMake(0, 0, FULL_WIDTH, FULL_HEIGHT)];
    CALayer* mask = [CALayer layer];
    [mask setFrame:self.view.frame];
    [mask setBackgroundColor:[UIColor blackColor].CGColor];
    [mask setOpacity:0.2];
    [self setMaskLayer:mask];
    [self.view.layer addSublayer:maskLayer];
    
    float centerX = (self.view.frame.size.width - ALERT_WIDTH) / 2;
    float centerY = (self.view.frame.size.height - ALERT_HEIGHT) / 2;
    
    CALayer* layer = [CALayer layer];
    [self setAlertBK:layer];
    [alertBK setFrame:CGRectMake(centerX, centerY, ALERT_WIDTH, ALERT_HEIGHT)];
    [alertBK setBackgroundColor:[UIColor whiteColor].CGColor];
    [alertBK setOpacity:0.7];
    [alertBK setCornerRadius:10.0];
    [self.view.layer addSublayer:alertBK];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(centerX, centerY + 10, ALERT_WIDTH, 40)];
    [label setText:@"正在上传"];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:[UIColor blueColor]];
    [label setAlpha:0.7];
    [self setTitleLabel:label];
    [self.view addSubview:titleLabel];
    [label release];
    
    UIProgressView* pv = [[UIProgressView alloc] initWithFrame:CGRectMake(centerX + 10, centerY + 70, ALERT_WIDTH - 20, 40)];
    [pv setProgress:0.4];
    [self setProgressView:pv];
    [self.view addSubview:progressView];
    [pv release];
    
//    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(centerX + 80, centerY + 100, ALERT_WIDTH - 160, 40)];
//    [btn setTitle:@"取消" forState:UIControlStateNormal];
//    [btn setTitle:@"取消" forState:UIControlStateHighlighted];
//    [self setCancelBtn:btn];
//    [self.view addSubview:cancelBtn];
//    [cancelBtn addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
//    [btn release];
    
    [self animateIn];
}

- (void)cancel:(id)sender
{
    if(delegate && [delegate respondsToSelector:@selector(cancel)]){
        [delegate performSelector:@selector(cancel)];
    }
}

- (void)animateIn
{
    CABasicAnimation* alphaAnimation = [CABasicAnimation animationWithKeyPath:@"alpha"];
    alphaAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    alphaAnimation.toValue = [NSNumber numberWithFloat:0.7];
    alphaAnimation.removedOnCompletion = NO;
    
    CABasicAnimation* scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.3, 1.3, 1.0)];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)];
    scaleAnimation.removedOnCompletion = NO;
    
    CAAnimationGroup* animationGroup = [CAAnimationGroup animation];
    [animationGroup setAnimations:[NSArray arrayWithObjects:alphaAnimation, scaleAnimation, nil]];
    [animationGroup setDuration:0.35];
    animationGroup.removedOnCompletion = NO;
    [alertBK addAnimation:animationGroup forKey:nil];
}

- (void)showProgress:(float)newProgress
{
    if(progressView){
        [progressView setProgress:newProgress animated:YES];
    }
}

- (void)dealloc
{
    [titleLabel release];
    [progressView release];
    [cancelBtn release];
    [alertBK release];
    [maskLayer release];
    
    titleLabel = nil;
    progressView = nil;
    cancelBtn = nil;
    alertBK = nil;
    maskLayer = nil;
    
    [super dealloc];
}

@end
