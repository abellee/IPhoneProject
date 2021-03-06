//
//  XinIcon.m
//  KeYiDian
//
//  Created by Lee Abel on 13-2-28.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "XinIcon.h"
#import "UIImage+Extensions.h"

@implementation XinIcon

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)init
{
    if (self = [super init]) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    UIImage* image = [UIImage getImageWithFileName:@"cai_xin"];
    [self setImage:image];
    [self setClipsToBounds:YES];
    [self setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
}

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
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
