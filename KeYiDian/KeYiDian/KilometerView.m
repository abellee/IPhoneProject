//
//  KilometerView.m
//  KeYiDian
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "KilometerView.h"
#import "UIImage+Extensions.h"

@implementation KilometerView

@synthesize curIndex;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    float buttonWidth = 30;
    float buttonHeight = 80;
    float fontSize = 16.0;
    float labelYPos = 70.0;
    float buttonYPos = 31.0;
    float pointYPos = 39.0;
    background = [[UIImageView alloc] initWithImage:[UIImage getImageWithFileName:@"juli"]];
    point = [[UIImageView alloc] initWithImage:[UIImage getImageWithFileName:@"hdian"]];
    [point setFrame:CGRectMake(26, pointYPos, 18, 18)];
    [self addSubview:background];
    [self addSubview:point];
    
    fiveHundred = [UIButton buttonWithType:UIButtonTypeCustom];
    [fiveHundred setFrame:CGRectMake(18, buttonYPos, buttonWidth, buttonHeight)];
    [self addSubview:fiveHundred];
    fiveHundred.tag = 0;
    [fiveHundred addTarget:self action:@selector(distanceButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    NSString* fiveHundredStr = @"500m";
    CGSize fiveHundredSize = [fiveHundredStr sizeWithFont:[UIFont boldSystemFontOfSize:fontSize]];
    fiveHundredLabel = [[UILabel alloc] initWithFrame:CGRectMake(13, labelYPos, fiveHundredSize.width, fiveHundredSize.height)];
    [fiveHundredLabel setText:fiveHundredStr];
    [fiveHundredLabel setFont:[UIFont boldSystemFontOfSize:fontSize]];
    fiveHundredLabel.backgroundColor = [UIColor clearColor];
    [fiveHundredLabel setTextColor:[UIColor grayColor]];
    [self addSubview:fiveHundredLabel];
    
    oneKilometer = [UIButton buttonWithType:UIButtonTypeCustom];
    [oneKilometer setFrame:CGRectMake(78, buttonYPos, buttonWidth, buttonHeight)];
    [self addSubview:oneKilometer];
    oneKilometer.tag = 1;
    [oneKilometer addTarget:self action:@selector(distanceButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    NSString* oneKilometerStr = @"1km";
    CGSize oneKilometerSize = [oneKilometerStr sizeWithFont:[UIFont boldSystemFontOfSize:fontSize]];
    oneKilometerLabel = [[UILabel alloc] initWithFrame:CGRectMake(76, labelYPos, oneKilometerSize.width, oneKilometerSize.height)];
    [oneKilometerLabel setText:oneKilometerStr];
    [oneKilometerLabel setFont:[UIFont boldSystemFontOfSize:fontSize]];
    oneKilometerLabel.backgroundColor = [UIColor clearColor];
    [oneKilometerLabel setTextColor:[UIColor grayColor]];
    [self addSubview:oneKilometerLabel];
    
    twoKilometer = [UIButton buttonWithType:UIButtonTypeCustom];
    [twoKilometer setFrame:CGRectMake(143, buttonYPos, buttonWidth, buttonHeight)];
    [self addSubview:twoKilometer];
    twoKilometer.tag = 2;
    [twoKilometer addTarget:self action:@selector(distanceButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    NSString* twoKilometerStr = @"2km";
    CGSize twoKilometerSize = [twoKilometerStr sizeWithFont:[UIFont boldSystemFontOfSize:fontSize]];
    twoKilometerLabel = [[UILabel alloc] initWithFrame:CGRectMake(141, labelYPos, twoKilometerSize.width, twoKilometerSize.height)];
    [twoKilometerLabel setText:twoKilometerStr];
    [twoKilometerLabel setFont:[UIFont boldSystemFontOfSize:fontSize]];
    twoKilometerLabel.backgroundColor = [UIColor clearColor];
    [twoKilometerLabel setTextColor:[UIColor grayColor]];
    [self addSubview:twoKilometerLabel];
    
    fiveKilometer = [UIButton buttonWithType:UIButtonTypeCustom];
    [fiveKilometer setFrame:CGRectMake(202, buttonYPos, buttonWidth, buttonHeight)];
    [self addSubview:fiveKilometer];
    fiveKilometer.tag = 3;
    [fiveKilometer addTarget:self action:@selector(distanceButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    NSString* fiveKilometerStr = @"5km";
    CGSize fiveKilometerSize = [fiveKilometerStr sizeWithFont:[UIFont boldSystemFontOfSize:fontSize]];
    fiveKilometerLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, labelYPos, fiveKilometerSize.width, fiveKilometerSize.height)];
    [fiveKilometerLabel setText:fiveKilometerStr];
    [fiveKilometerLabel setFont:[UIFont boldSystemFontOfSize:fontSize]];
    fiveKilometerLabel.backgroundColor = [UIColor clearColor];
    [fiveKilometerLabel setTextColor:[UIColor grayColor]];
    [self addSubview:fiveKilometerLabel];
    
    allDis = [UIButton buttonWithType:UIButtonTypeCustom];
    [allDis setFrame:CGRectMake(265, buttonYPos, buttonWidth, buttonHeight)];
    [self addSubview:allDis];
    allDis.tag = 4;
    [allDis addTarget:self action:@selector(distanceButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    NSString* allDisStr = @"全部";
    CGSize allDisSize = [allDisStr sizeWithFont:[UIFont boldSystemFontOfSize:fontSize]];
    allDisLabel = [[UILabel alloc] initWithFrame:CGRectMake(263, labelYPos, allDisSize.width, allDisSize.height)];
    [allDisLabel setText:allDisStr];
    [allDisLabel setFont:[UIFont boldSystemFontOfSize:fontSize]];
    allDisLabel.backgroundColor = [UIColor clearColor];
    [allDisLabel setTextColor:[UIColor grayColor]];
    [self addSubview:allDisLabel];
}

- (void)distanceButtonPressed:(id)sender
{
    UIButton* btn = (UIButton*)sender;
    curIndex = btn.tag;
    float pointYPos = 39.0;
    float pointXPos = 85;
    
    switch (curIndex) {
        case 0:
            pointXPos = 26;
            break;
        case 1:
            pointXPos = 85;
            break;
        case 2:
            pointXPos = 150;
            break;
        case 3:
            pointXPos = 209;
            break;
        case 4:
            pointXPos = 272;
            break;
            
        default:
            break;
    }
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDelegate:self];
    [point setFrame:CGRectMake(pointXPos, pointYPos, 18, 18)];
    [UIView commitAnimations];
}

- (void)dealloc
{
    NSLog(@"***************** KilometerView dealloc ******************");
    
    [background release];
    [point release];
    [fiveHundredLabel release];
    [oneKilometerLabel release];
    [twoKilometerLabel release];
    [fiveKilometerLabel release];
    [allDisLabel release];
    
    [super dealloc];
}

@end
