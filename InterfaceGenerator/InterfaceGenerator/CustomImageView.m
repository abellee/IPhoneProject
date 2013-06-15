//
//  CustomImageView.m
//  InterfaceGenerator
//
//  Created by Lee Abel on 13-4-28.
//  Copyright (c) 2013年 YiZu. All rights reserved.
//

#import "CustomImageView.h"
#import "ImageInfo.h"
#import "ImageInfoInCanvas.h"

@implementation CustomImageView

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
    [menu insertItemWithTitle:@"上一层" action:@selector(upLayerItemSelected:) keyEquivalent:@"" atIndex:1];
    [menu insertItemWithTitle:@"下一层" action:@selector(downLayerItemSelected:) keyEquivalent:@"" atIndex:2];
    [menu insertItemWithTitle:@"添加子图" action:@selector(addSubImageSelected:) keyEquivalent:@"" atIndex:3];
    [NSMenu popUpContextMenu:menu withEvent:theEvent forView:self];
}

- (void)deleteItemSelected:(id)sender
{
    if ([self delegate] && [[self delegate] respondsToSelector:@selector(removeFromCanvas:)]) {
        [[self delegate] performSelector:@selector(removeFromCanvas:) withObject:self];
    }
}

- (void)addSubImageSelected:(id)sender
{
    if ([self delegate] && [[self delegate] respondsToSelector:@selector(showSubImageSetting:)]) {
        [[self delegate] performSelector:@selector(showSubImageSetting:) withObject:self];
    }
}

- (void)upLayerItemSelected:(id)sender
{
    if ([self delegate] && [[self delegate] respondsToSelector:@selector(upLayerInCanvas:)]) {
        [[self delegate] performSelector:@selector(upLayerInCanvas:) withObject:self];
    }
}

- (void)downLayerItemSelected:(id)sender
{
    if ([self delegate] && [[self delegate] respondsToSelector:@selector(downLayerInCanvas:)]) {
        [[self delegate] performSelector:@selector(downLayerInCanvas:) withObject:self];
    }
}

- (void)mouseDown:(NSEvent *)theEvent
{
    lastPoint = theEvent.locationInWindow;
    isDown = YES;
    if ([self delegate] && [[self delegate] respondsToSelector:@selector(imageClicked:)]) {
        [[self delegate] performSelector:@selector(imageClicked:) withObject:self];
    }
}

- (void)mouseUp:(NSEvent *)theEvent
{
    [super mouseUp:theEvent];
}

- (void)mouseDragged:(NSEvent *)theEvent
{
    NSPoint newPoint = theEvent.locationInWindow;
    float xDis = newPoint.x - lastPoint.x;
    float yDis = newPoint.y - lastPoint.y;
    NSRect rect = self.frame;
    NSPoint finalPoint = NSMakePoint(rect.origin.x + xDis, rect.origin.y + yDis);
    [self setFrame:NSMakeRect(finalPoint.x, finalPoint.y, self.frame.size.width, self.frame.size.height)];
    lastPoint = newPoint;
    if ([self delegate] && [[self delegate] respondsToSelector:@selector(imageDragged:)]) {
        [[self delegate] performSelector:@selector(imageDragged:) withObject:self];
    }
}

@end
