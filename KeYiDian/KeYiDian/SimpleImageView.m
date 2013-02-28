//
//  SimpleImageView.m
//  KeYiDian
//
//  Created by Lee Abel on 13-2-28.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "SimpleImageView.h"
#import "UIImage+Extensions.h"

@implementation SimpleImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFileName:(NSString *)filename
{
    if (self = [super init]) {
        
        UIImage* image = [UIImage getImageWithFileName:filename];
        [self setImage:image];
        [self setClipsToBounds:YES];
        [self setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        
    }
    return self;
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
