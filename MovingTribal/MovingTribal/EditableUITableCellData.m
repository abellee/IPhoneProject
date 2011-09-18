//
//  EditableUITableCellData.m
//  MovingTribal
//
//  Created by Lee Abel on 9/18/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "EditableUITableCellData.h"

@implementation EditableUITableCellData

@synthesize label;
@synthesize placeholder;
@synthesize value;
@synthesize keyboardType;
@synthesize keyboardAppearance;
@synthesize returnKeyType;
@synthesize secureTextEntry;
@synthesize x;
@synthesize y;
@synthesize width;
@synthesize height;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    NSLog(@"******| EditableUITableCellData |****** receive dealloc message!");
    [label release];
    [placeholder release];
    [value release];
    [super dealloc];
}

- (NSString *)label
{
    return label;
}

- (void)label:(NSString *)str
{
    if(label != str){
        NSString* tempStr = label;
        label = [str copy];
        [tempStr release];
    }
}

- (NSString *)placeholder
{
    return placeholder;
}

- (void)placeholder:(NSString *)str
{
    if(placeholder != str){
        NSString* tempStr = placeholder;
        placeholder = [str copy];
        [tempStr release];
    }
}

- (NSString *)value
{
    return value;
}

- (void)value:(NSString *)str
{
    if(value != str){
        NSString* tempStr = value;
        value = [str copy];
        [tempStr release];
    }
}

- (UIKeyboardType)keyboardType
{
    return keyboardType;
}

- (void)keyboardType:(UIKeyboardType)type
{
    if(keyboardType != type) keyboardType = type;
}

- (UIKeyboardAppearance)keyboardAppearance
{
    return keyboardAppearance;
}

- (void)keyboardAppearance:(UIKeyboardAppearance)appearance
{
    if(keyboardAppearance != appearance) keyboardAppearance = appearance;
}

- (UIReturnKeyType)returnKeyType
{
    return returnKeyType;
}

- (void)returnKeyType:(UIReturnKeyType)type
{
    if(returnKeyType != type) returnKeyType = type;
}

- (BOOL)isSecureTextEntry
{
    return secureTextEntry;
}

- (void)isSecureTextEntry:(BOOL)secure
{
    if(secureTextEntry != secure) secureTextEntry = secure;
}

- (NSUInteger)x
{
    return x;
}

- (void)x:(NSUInteger)num
{
    if(x != num) x = num;
}

- (NSUInteger)y
{
    return y;
}

- (void)y:(NSUInteger)num
{
    if(y != num) y = num;
}

- (NSUInteger)width
{
    return width;
}

- (void)width:(NSUInteger)num
{
    if(width != num) width = num;
}

- (NSUInteger)height
{
    return height;
}

- (void)height:(NSUInteger)num
{
    if(height != num) height = num;
}

@end
