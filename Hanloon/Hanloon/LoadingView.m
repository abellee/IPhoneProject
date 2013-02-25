//
//  LoadingView.m
//  HanloonViewer
//
//  Created by Lee Abel on 13-2-19.
//  Copyright (c) 2013年 Abel Lee. All rights reserved.
//

#import "LoadingView.h"

@implementation LoadingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        back = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        back.alpha = 0.8;
        back.backgroundColor = [UIColor blackColor];
        back.layer.cornerRadius = 10;
        [self addSubview:back];
        
        loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [loadingView setFrame:CGRectMake((frame.size.width - 40) / 2, (frame.size.height - 40) / 2, 40, 40)];
        [loadingView startAnimating];
        [self addSubview:loadingView];
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"*********************** LoadingView dealloc *****************************");
    [back release];
    [loadingView release];
    [super dealloc];
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
