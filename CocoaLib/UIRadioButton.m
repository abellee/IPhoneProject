//
//  UIRadioButton.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "UIRadioButton.h"
#import "Utility.h"

@implementation UIRadioButton

@synthesize isSelected, delegate;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    if (unselectedImage) {
        [unselectedImage release];
    }
    if (selectedImage) {
        [selectedImage release];
    }
    
    if (unselectedLabel) {
        [unselectedLabel release];
    }
    if (selectedLabel) {
        [selectedLabel release];
    }
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state
{
    if (state == UIControlStateNormal)
    {
        if (unselectedImage == nil)
        {
            unselectedImage = [[UIImageView alloc] initWithImage:image];
        }
        [unselectedImage setImage:image];
        [unselectedImage setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        [self insertSubview:unselectedImage atIndex:0];
    }
    else if(state == UIControlStateSelected)
    {
        if (selectedImage == nil) {
            selectedImage = [[UIImageView alloc] initWithImage:image];
        }
        [selectedImage setImage:image];
        [self addSubview:selectedImage];
    }
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    if (state == UIControlStateNormal)
    {
        if (unselectedLabel == nil) {
            unselectedLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            [unselectedLabel setText:title];
            [unselectedLabel setBackgroundColor:[UIColor clearColor]];
            [unselectedLabel sizeToFit];
            [self addSubview:unselectedLabel];
        }
    }
    else if(state == UIControlStateSelected)
    {
        if (selectedLabel == nil) {
            selectedLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            [selectedLabel setBackgroundColor:[UIColor clearColor]];
            [selectedLabel sizeToFit];
            [self addSubview:selectedLabel];
        }
    }
}

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state
{
    if (state == UIControlStateNormal)
    {
        unselectedColor = color;
    }
    else if(state == UIControlStateSelected)
    {
        selectedColor = color;
    }
}

- (void)setFont:(UIFont *)font
{
    labelFont = font;
}

- (void)setNeedsDisplay
{
    [super setNeedsDisplay];
    
    [self placeSelectedImage];
    
    CGFloat unselectedWidth = unselectedImage.frame.size.width - ABS(unselectedImage.frame.origin.x);
    CGFloat unselectedHeight = unselectedImage.frame.size.height - ABS(unselectedImage.frame.origin.y);
    
    CGFloat selectedWidth = selectedImage.frame.size.width - ABS(selectedImage.frame.origin.x);
    CGFloat selectedHeight = selectedImage.frame.size.height - ABS(selectedImage.frame.origin.y);
    
    CGFloat finalWidth = MAX(unselectedWidth, selectedWidth);
    CGFloat finalHeight = MAX(unselectedHeight, selectedHeight);
    
    CGSize unselectedLabelSize = [Utility getCGSizeWithUIFont:labelFont str:unselectedLabel.text];
    [unselectedLabel setFont:labelFont];
    [unselectedLabel setTextColor:unselectedColor];
    [unselectedLabel setFrame:CGRectMake(finalWidth + 2, (finalHeight - unselectedLabelSize.height) / 2, unselectedLabelSize.width, unselectedLabelSize.height)];
    
    CGSize selectedLabelSize = [Utility getCGSizeWithUIFont:labelFont str:selectedLabel.text];
    [selectedLabel setFont:labelFont];
    [selectedLabel setTextColor:selectedColor];
    [selectedLabel setFrame:CGRectMake(finalWidth + 2, (finalHeight - selectedLabelSize.height) / 2, selectedLabelSize.width, selectedLabelSize.height)];
    
    [self addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self isSelected:NO];
}

- (void)touchUpInside:(id)sender
{
    if(delegate && [delegate respondsToSelector:@selector(radioButtonPressed:)])
    {
        [delegate performSelector:@selector(radioButtonPressed:) withObject:self];
    }
    else
    {
        [self isSelected:!self.isSelected];
        if (!self.isSelected)
        {
            [self isSelected:YES];
        }
    }
}

- (void)placeSelectedImage
{
    if (selectedImage && unselectedImage) {
        [selectedImage setFrame:CGRectMake((unselectedImage.frame.size.width - selectedImage.frame.size.width) / 2, (unselectedImage.frame.size.height - selectedImage.frame.size.height) / 2, selectedImage.frame.size.width, selectedImage.frame.size.height)];
    }
}

- (void)isSelected:(BOOL)selected
{
    isSelected = selected;
    if (selected) {
        [selectedImage setHidden:NO];
    }
    else{
        [selectedImage setHidden:YES];
    }
}

- (NSString*)getTitleForState:(UIControlState)state
{
    if (state == UIControlStateNormal && unselectedLabel)
    {
        return unselectedLabel.text;
    }
    else if(state == UIControlStateSelected && selectedLabel)
    {
        return selectedLabel.text;
    }
    return nil;
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
