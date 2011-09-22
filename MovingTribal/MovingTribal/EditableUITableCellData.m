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
@synthesize key;
@synthesize cellType;

@synthesize keyboardType;
@synthesize keyboardAppearance;
@synthesize returnKeyType;
@synthesize secureTextEntry;

@synthesize width;
@synthesize height;

@synthesize secondView;
@synthesize image;

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
	[secondView release];
	[key release];
	[image release];
    [super dealloc];
}

/**
 * cell左边的图片
 */
- (void)image:(UIImage *)img
{
	if(image != img){
		[image release];
		image = [img retain];
	}
}

- (UIImage *)image
{
	return image;
}

/**
 * NSUserDefaults中的键值
 */
- (void)key:(NSString *)k
{
	if(key != k){
		[key release];
		key = [k retain];
	}
}

- (NSString *)key
{
	return key;
}

/**
 * 该cell的类型
 */
- (void)type:(NSUInteger)t
{
	if(cellType != t){
		cellType = t;
	}
}

- (NSUInteger)cellType
{
	return cellType;
}

/**
 * 二级视图
 */
- (void)secondView:(UIView *)sv
{
	if(secondView != sv){
		[secondView release];
		secondView = [sv retain];
	}
}

- (UIView *)secondView
{
	return secondView;
}

/**
 * don't tell me you don't know what is the label?
 * so, that's it!
 * 如果cell为TextField/Label等的可显示文字的view
 */
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

/**
 * don't tell me you don't know what is the placeholder?
 * so, that's it!
 * 如果cell为TextField/Label等的可显示文字的view
 */
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

/**
 * 你可以自己设置该值 也可以设置为用户设置的值
 */
- (NSString *)value
{
    return value;
}

- (void)value:(NSString *)str
{
    if(value != str){
        [value release];
        value = [str copy];
    }
}

/**
 * 如果该cell中存在可编辑的文本时，该处设置其keyboardType
 */
- (UIKeyboardType)keyboardType
{
    return keyboardType;
}

- (void)keyboardType:(UIKeyboardType)type
{
    if(keyboardType != type) keyboardType = type;
}

/**
 * 如果该cell中存在可编辑的文本时，该处设置其keyboardAppearance
 */
- (UIKeyboardAppearance)keyboardAppearance
{
    return keyboardAppearance;
}

- (void)keyboardAppearance:(UIKeyboardAppearance)appearance
{
    if(keyboardAppearance != appearance) keyboardAppearance = appearance;
}

/**
 * 如果该cell中存在可编辑的文本时，该处设置其returnKeyType
 */
- (UIReturnKeyType)returnKeyType
{
    return returnKeyType;
}

- (void)returnKeyType:(UIReturnKeyType)t
{
    if(returnKeyType != t) returnKeyType = t;
}

/**
 * 如果该cell中存在可编辑的文本时，该处设置其isSecureTextEntry
 */
- (BOOL)isSecureTextEntry
{
    return secureTextEntry;
}

- (void)isSecureTextEntry:(BOOL)secure
{
    if(secureTextEntry != secure) secureTextEntry = secure;
}

/**
 * 在cell中的宽度
 */
- (NSUInteger)width
{
    return width;
}

- (void)width:(NSUInteger)num
{
    if(width != num) width = num;
}

/**
 * 在cell中的高度
 */
- (NSUInteger)height
{
    return height;
}

- (void)height:(NSUInteger)num
{
    if(height != num) height = num;
}

@end
