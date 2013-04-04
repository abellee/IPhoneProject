//
//  EditableUITableViewCellData.h
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EditableUITableViewCellDefinition.h"

@interface EditableUITableViewCellData : NSObject

#pragma mark - 当cell为TextField/Label等的可显示文字的view
@property (nonatomic, copy) NSString *label;

#pragma mark - 当cell为TextField/Label等的可显示文字的view
@property (nonatomic, copy) NSString *placeholder;

#pragma mark - 你可以自己设置该值 也可以设置为用户设置的值
@property (nonatomic, copy) NSString *value;

#pragma mark - NSUserDefaults中的键值
@property (nonatomic, copy) NSString *key;

#pragma mark - 如果该cell中存在可编辑的文本时，该处设置其keyboardType
@property (nonatomic, assign) UIKeyboardType keyboardType;

#pragma mark - 如果该cell中存在可编辑的文本时，该处设置其keyboardAppearance
@property (nonatomic, assign) UIKeyboardAppearance keyboardAppearance;

#pragma mark - 如果该cell中存在可编辑的文本时，该处设置其returnKeyType
@property (nonatomic, assign) UIReturnKeyType returnKeyType;

#pragma mark - 如果该cell中存在可编辑的文本时，该处设置其isSecureTextEntry
@property (nonatomic, assign) BOOL secureTextEntry;

#pragma mark - 如果该cell中存在可编辑的文本时，该处设置其autocapitalizationType
@property (nonatomic, assign, getter = autocapitalizationType, setter = autocapitali:) UITextAutocapitalizationType autocapitalizationType;

#pragma mark - 如果该cell中存在可编辑的文本时，该处设置其autocorrectionType
@property (nonatomic, assign, getter = autocorrectionType, setter = autocorrectionType:) UITextAutocorrectionType autocorrectionType;

#pragma mark - 在cell中的宽度
@property (nonatomic, assign) NSUInteger width;

#pragma mark - 在cell中的高度
@property (nonatomic, assign) NSUInteger height;

#pragma mark - 该cell的类型
@property (nonatomic, assign) EditableUITableViewCellType cellType;

#pragma mark - 二级视图
@property (nonatomic, retain) UIView *secondView;

#pragma mark - cell左边的图片
@property (nonatomic, retain) UIImage *image;

#pragma mark - 右边自定义视图
@property (nonatomic, retain, getter = customView, setter = customView:) UIView* customView;

#pragma mark - cell高度
@property (nonatomic, assign, getter = cellHeight, setter = cellHeight:) float cellHeight;

#pragma mark - 如果该cell中存在可编辑的文本时，该处设置文本字体大小
@property (nonatomic, assign, getter = font, setter = font:) UIFont* font;

#pragma mark - 如果该cell中存在可编辑的文本时，该处设置文本字体颜色
@property (nonatomic, assign, getter = fontColor, setter = fontColor:) UIColor* fontColor;

#pragma mark - label字体大小
@property (nonatomic, assign, getter = labelFont, setter = labelFont:) UIFont* labelFont;

#pragma mark - label字体颜色
@property (nonatomic, assign, getter = labelFontColor, setter = labelFontColor:) UIColor* labelFontColor;

@end
