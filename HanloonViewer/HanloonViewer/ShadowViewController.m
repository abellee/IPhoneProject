//
//  ShadowViewController.m
//  HanloonViewer
//
//  Created by Abel Lee on 13-2-13.
//  Copyright (c) 2013年 Abel Lee. All rights reserved.
//

#import "ShadowViewController.h"

@implementation ShadowViewController

- (void)contentsGravity:(NSString *)contentsGravity
{
    contentsGravity_ = contentsGravity;
    self.view.layer.contentsGravity = contentsGravity_;
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
    self.view.layer.contents = contents_;
}

- (UIView*)contents
{
    return contents_;
}

- (void)borderWidth:(float)borderWidth
{
    borderWidth_ = borderWidth;
    self.view.layer.borderWidth = borderWidth_;
}

- (float)borderWidth
{
    return borderWidth_;
}

- (void)borderColor:(UIColor*)borderColor
{
    borderColor_ = borderColor;
    self.view.layer.borderColor = borderColor_.CGColor;
}

- (UIColor*)borderColor
{
    return borderColor_;
}

- (void)shadowColor:(UIColor*)shadowColor
{
    shadowColor_ = shadowColor;
    self.view.layer.shadowColor = shadowColor_.CGColor;
}

- (UIColor*)shadowColor
{
    return shadowColor_;
}

- (void)shadowOffset:(CGSize)shadowOffset
{
    shadowOffset_ = shadowOffset;
    self.view.layer.shadowOffset = shadowOffset_;
}

- (CGSize)shadowOffset
{
    return shadowOffset_;
}

- (void)shadowRadius:(float)shadowRadius
{
    shadowRadius_ = shadowRadius;
    self.view.layer.shadowRadius = shadowRadius_;
}

- (float)shadowOpacity
{
    return shadowOpacity_;
}

- (void)shadowOpacity:(float)shadowOpacity
{
    shadowOpacity_ = shadowOpacity;
    self.view.layer.shadowOpacity = shadowOpacity_;
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
    if (contents_ != nil) {
        [contents_ release];
    }
    [super dealloc];
}

@end
