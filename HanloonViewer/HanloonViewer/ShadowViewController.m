//
//  ShadowViewController.m
//  HanloonViewer
//
//  Created by Abel Lee on 13-2-13.
//  Copyright (c) 2013年 Abel Lee. All rights reserved.
//

#import "ShadowViewController.h"
#import "Global.h"
#import "HanloonViewerMainViewController.h"

@implementation ShadowViewController

@synthesize imageData;

- (id)init
{
    if (self = [super init]) {
        contentLayer = [[CALayer alloc] init];
    }
    return self;
}

- (void)contentsGravity:(NSString *)contentsGravity
{
    contentsGravity_ = contentsGravity;
    contentLayer.contentsGravity = contentsGravity_;
}

- (NSString *)contentsGravity
{
    return contentsGravity_;
}

- (void)contents:(id)contents
{
    if (contents_ != nil) {
        [contents_ release];
        contents_ = nil;
    }
    contents_ = [contents retain];
    contentLayer.contents = contents_;
    
    contentLayer.masksToBounds = YES;
    [contentLayer setFrame:CGRectMake(5, 5, self.view.frame.size.width - 10, self.view.frame.size.height - 10)];
    [self.view.layer addSublayer:contentLayer];
}

- (UIView*)contents
{
    return contents_;
}

- (void)borderWidth:(float)borderWidth
{
    borderWidth_ = borderWidth;
    //self.view.layer.borderWidth = borderWidth_;
}

- (float)borderWidth
{
    return borderWidth_;
}

- (void)borderColor:(UIColor*)borderColor
{
    borderColor_ = borderColor;
    //self.view.layer.borderColor = borderColor_.CGColor;
}

- (UIColor*)borderColor
{
    return borderColor_;
}

- (void)shadowColor:(UIColor*)shadowColor
{
    shadowColor_ = shadowColor;
    //self.view.layer.shadowColor = shadowColor_.CGColor;
}

- (UIColor*)shadowColor
{
    return shadowColor_;
}

- (void)shadowOffset:(CGSize)shadowOffset
{
    shadowOffset_ = shadowOffset;
    //self.view.layer.shadowOffset = shadowOffset_;
}

- (CGSize)shadowOffset
{
    return shadowOffset_;
}

- (void)shadowRadius:(float)shadowRadius
{
    shadowRadius_ = shadowRadius;
    //self.view.layer.shadowRadius = shadowRadius_;
}

- (float)shadowOpacity
{
    return shadowOpacity_;
}

- (void)shadowOpacity:(float)shadowOpacity
{
    shadowOpacity_ = shadowOpacity;
    //self.view.layer.shadowOpacity = shadowOpacity_;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[[Global sharedGlobal] app] imageViewInterface:imageData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
    NSLog(@"*************** ShadowViewController dealloc **************");
    if (contents_ != nil) {
        [contents_ release];
    }
    if (contentLayer != nil) {
        [contentLayer release];
    }
    if (imageData != nil) {
        [imageData release];
    }
    [super dealloc];
}

@end
