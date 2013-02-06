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
@property (nonatomic, retain) NSString *label;

#pragma mark - 当cell为TextField/Label等的可显示文字的view
@property (nonatomic, retain) NSString *placeholder;

#pragma mark - 你可以自己设置该值 也可以设置为用户设置的值
@property (nonatomic, retain) NSString *value;

#pragma mark - NSUserDefaults中的键值
@property (nonatomic, retain) NSString *key;

#pragma mark - 如果该cell中存在可编辑的文本时，该处设置其keyboardType
@property (nonatomic, assign) UIKeyboardType keyboardType;

#pragma mark - 如果该cell中存在可编辑的文本时，该处设置其keyboardAppearance
@property (nonatomic, assign) UIKeyboardAppearance keyboardAppearance;

#pragma mark - 如果该cell中存在可编辑的文本时，该处设置其returnKeyType
@property (nonatomic, assign) UIReturnKeyType returnKeyType;

#pragma mark - 如果该cell中存在可编辑的文本时，该处设置其isSecureTextEntry
@property (nonatomic, assign) BOOL secureTextEntry;

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

#pragma mark - 自定义的UITableViewCell
@property (nonatomic, retain) UITableViewCell* customCell;

@end
