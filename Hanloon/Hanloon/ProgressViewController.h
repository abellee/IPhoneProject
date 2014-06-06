//
//  ProgressViewController.h
//  Hanloon
//
//  Created by Abel Lee on 13-11-4.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ProgressViewDelegate.h"

#define ALERT_WIDTH     300
#define ALERT_HEIGHT    100

@interface ProgressViewController : UIViewController

@property (nonatomic, retain) UILabel* titleLabel;
@property (nonatomic, retain) UILabel* textLabel;
@property (nonatomic, retain) UIProgressView* progressView;
@property (nonatomic, retain) UIButton* cancelBtn;
@property (nonatomic, retain) CALayer* alertBK;
@property (nonatomic, retain) CALayer* maskLayer;

@property (nonatomic, assign) id<ProgressViewDelegate> delegate;

- (void)showProgress:(float)newProgress;

@end
