//
//  BaseImageView.m
//  InterfaceGenerator
//
//  Created by Lee Abel on 13-4-28.
//  Copyright (c) 2013年 YiZu. All rights reserved.
//

#import "BaseImageView.h"
#import "ImageInfo.h"

@implementation BaseImageView

@synthesize delegate, imageInfo;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)rightMouseDown:(NSEvent *)theEvent
{
    NSMenu* menu = [[NSMenu alloc] initWithTitle:@""];
    [menu insertItemWithTitle:@"删除" action:@selector(deleteItemSelected:) keyEquivalent:@"" atIndex:0];
    [NSMenu popUpContextMenu:menu withEvent:theEvent forView:self];
}

- (void)showPublicLabel
{
    if (imageInfo.isPublicRes) {
        publicLabel = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 40, 30)];
        [publicLabel setBackgroundColor:[NSColor blackColor]];
        [publicLabel setEditable:NO];
        [publicLabel setStringValue:[NSString stringWithFormat:@"%d", imageInfo.arrayIndex]];
        [publicLabel setTextColor:[NSColor whiteColor]];
        [self addSubview:publicLabel];
    }
}

- (void)deleteItemSelected:(id)sender
{
    if (delegate && [delegate respondsToSelector:@selector(removeFromLib:)]) {
        [delegate performSelector:@selector(removeFromLib:) withObject:self];
    }
}

- (void)mouseUp:(NSEvent *)theEvent
{
    if (theEvent.clickCount == 2) {
        if (delegate && [delegate respondsToSelector:@selector(imageDoubleClicked:)]) {
            [delegate performSelector:@selector(imageDoubleClicked:) withObject:self];
        }
    }
}

@end
