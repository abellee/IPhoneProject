//
//  SimpleButton.m
//  KeYiDian
//
//  Created by Lee Abel on 13-2-28.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "SimpleButton.h"
#import "UIImage+Extensions.h"

@implementation SimpleButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithStateImage:(NSString *)normalStateImage hilighted:(NSString *)hilightedStateImage selected:(NSString *)selectedStateImage
{
    if (self = [super init]) {
        
        if (normalStateImage != nil) {
            UIImage* normalImage = [UIImage getImageWithFileName:normalStateImage];
            [self setBackgroundImage:normalImage forState:UIControlStateNormal];
            [self setFrame:CGRectMake(0, 0, normalImage.size.width, normalImage.size.height)];
        }
        
        if (hilightedStateImage != nil) {
            [self setBackgroundImage:[UIImage getImageWithFileName:hilightedStateImage] forState:UIControlStateHighlighted];
        }
        
        if (selectedStateImage != nil) {
            [self setBackgroundImage:[UIImage getImageWithFileName:selectedStateImage] forState:UIControlStateSelected];
        }
        
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
