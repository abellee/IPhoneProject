//
//  UITouchableView.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-10.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "UITouchableView.h"

@implementation UITouchableView

@synthesize delegate;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    delegate = nil;
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (delegate && [delegate respondsToSelector:@selector(touchUpInside:)]) {
        [delegate touchUpInside:self];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
