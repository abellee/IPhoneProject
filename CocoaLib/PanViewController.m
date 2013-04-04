//
//  PanViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-9.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "PanViewController.h"
#import "Utility.h"

@interface PanViewController ()

@end

@implementation PanViewController

@synthesize delegate;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [masker release];
    delegate = nil;
    
    [super dealloc];
}

- (id)initWithOpenedPosition:(float)xpos isTwoSide:(BOOL)twoSide withMaskerAlpha:(float)alpha
{
    if (self = [super init]) {
        isTwoSide = twoSide;
        openPos = xpos;
        maskerAlpha = alpha;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    masker = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    masker.backgroundColor = [UIColor blackColor];
    masker.alpha = 0;
    
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(imageWallPanGesture:)];
    [self.view addGestureRecognizer:pan];
    [pan release];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (isMoving) {
        return;
    }
    preDis = 0;
    if (self.view.frame.origin.x == openPos) {
        [self panLeftAuto:YES];
    }else if(self.view.frame.origin.x == -openPos){
        [self panRightAuto:NO];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}

- (void)imageWallPanGesture:(UIPanGestureRecognizer*)pan
{
    return;
    if (self.view.layer.shadowRadius != 8) {
        self.view.layer.shadowColor = [UIColor blackColor].CGColor;
        self.view.layer.shadowOpacity = 0.8;
        self.view.layer.shadowRadius = 8;
        self.view.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.view.frame cornerRadius:0].CGPath;
    }
    [self.view addSubview:masker];
    CGPoint p = [pan translationInView:self.view];
    if (pan.state == UIGestureRecognizerStateEnded) {
        preDis = 0;
        if (self.view.frame.origin.x > openPos / 2) {
            [self panRightAuto:YES];
        }else if(self.view.frame.origin.x <= openPos / 2 && self.view.frame.origin.x > 0){
            [self panLeftAuto:YES];
        }else if(self.view.frame.origin.x < 0 && self.view.frame.origin.x >= - openPos / 2){
            [self panRightAuto:NO];
        }else if(self.view.frame.origin.x < - openPos / 2){
            [self panLeftAuto:NO];
        }
        return;
    }
    isMoving = YES;
    if (p.x > 0) {
        if (self.view.frame.origin.x < openPos) {
            [self.view setFrame:CGRectMake(self.view.frame.origin.x + p.x - preDis, 0, self.view.frame.size.width, self.view.frame.size.height)];
            preDis = p.x;
        }else{
            [self.view setFrame:CGRectMake(openPos, 0, self.view.frame.size.width, self.view.frame.size.height)];
        }
    }else{
        if (self.view.frame.origin.x > 0) {
            [self.view setFrame:CGRectMake(self.view.frame.origin.x + p.x - preDis, 0, self.view.frame.size.width, self.view.frame.size.height)];
            preDis = p.x;
        }else{
            if (isTwoSide) {
                if (self.view.frame.origin.x <= - openPos) {
                    return;
                }else{
                    [self.view setFrame:CGRectMake(self.view.frame.origin.x + p.x - preDis, 0, self.view.frame.size.width, self.view.frame.size.height)];
                    preDis = p.x;
                }
            }else{
                [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            }
        }
    }
    if (delegate && [delegate respondsToSelector:@selector(isPanning:)]) {
        [delegate isPanning:p.x];
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    masker.alpha = abs(self.view.frame.origin.x) / openPos * maskerAlpha;
    [UIView commitAnimations];
}

- (void)panLeftAuto:(BOOL)fromLeft
{
    if (isAnimating) {
        return;
    }
    [self.view addSubview:masker];
    isAnimating = YES;
    float toValue = self.view.frame.size.width / 2;
    float toAlpha = 0.0;
    NSString* identifyValue = @"pl";
    NSString* alphaIdentify = @"opacityO";
    if (!fromLeft) {
        toValue = toValue - openPos;
        toAlpha = maskerAlpha;
        identifyValue = @"plr";
        alphaIdentify = @"opacityI";
    }
    CABasicAnimation* animation = [Utility animationProperty:@"position.x" duration:0.3 fromValue:[NSNumber numberWithFloat:self.view.frame.size.width / 2 + self.view.frame.origin.x] toValue:[NSNumber numberWithFloat:toValue] delegate:self bounce:YES animationIdentifyKey:@"anime" animationIdentifyValue:identifyValue];
    [self.view.layer addAnimation:animation forKey:@"animation"];
    
    CABasicAnimation* alphaAnimation = [Utility animationProperty:@"opacity" duration:0.2 fromValue:[NSNumber numberWithFloat: masker.alpha] toValue:[NSNumber numberWithFloat:toAlpha] delegate:self bounce:NO animationIdentifyKey:@"anime" animationIdentifyValue:alphaIdentify];
    [masker.layer addAnimation:alphaAnimation forKey:@"animation"];
}

- (void)panRightAuto:(BOOL)fromLeft
{
    if (isAnimating) {
        return;
    }
    [self.view addSubview:masker];
    isAnimating = YES;
    float toValue = self.view.frame.size.width / 2 + openPos;
    float toAlpha = maskerAlpha;
    NSString* identifyValue = @"pr";
    NSString* alphaIdentify = @"opacityI";
    if (!fromLeft) {
        toValue = toValue - openPos;
        toAlpha = 0.0;
        identifyValue = @"prl";
        alphaIdentify = @"opacityO";
    }
    CABasicAnimation* animation = [Utility animationProperty:@"position.x" duration:0.3 fromValue:[NSNumber numberWithFloat:self.view.frame.size.width / 2 + self.view.frame.origin.x] toValue:[NSNumber numberWithFloat:toValue] delegate:self bounce:YES animationIdentifyKey:@"anime" animationIdentifyValue:identifyValue];
    [self.view.layer addAnimation:animation forKey:@"animation"];
    
    if (masker.alpha != maskerAlpha || !fromLeft) {
        CABasicAnimation* alphaAnimation = [Utility animationProperty:@"opacity" duration:0.2 fromValue:[NSNumber numberWithFloat: masker.alpha] toValue:[NSNumber numberWithFloat:toAlpha] delegate:self bounce:NO animationIdentifyKey:@"anime" animationIdentifyValue:alphaIdentify];
        [masker.layer addAnimation:alphaAnimation forKey:@"animation"];
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        isMoving = NO;
        isAnimating = NO;
        NSString* animeValue = [anim valueForKey:@"anime"];
        if ([animeValue isEqualToString:@"pl"] || [animeValue isEqualToString:@"prl"]) {
            [self.view.layer removeAnimationForKey:@"animation"];
            [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        }else if([animeValue isEqualToString:@"opacityO"]){
            [masker.layer removeAnimationForKey:@"animation"];
            [masker removeFromSuperview];
            masker.alpha = 0;
        }else if([animeValue isEqualToString:@"pr"]){
            [self.view.layer removeAnimationForKey:@"animation"];
            [self.view setFrame:CGRectMake(openPos, 0, self.view.frame.size.width, self.view.frame.size.height)];
        }else if([animeValue isEqualToString:@"opacityI"]){
            [masker.layer removeAnimationForKey:@"animation"];
            masker.alpha = maskerAlpha;
        }else if([animeValue isEqualToString:@"plr"]){
            [self.view.layer removeAnimationForKey:@"animation"];
            [self.view setFrame:CGRectMake(- openPos, 0, self.view.frame.size.width, self.view.frame.size.height)];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
