//
//  UIRadioButton.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIRadioButton : UIControl
{
    UIImageView* unselectedImage;
    UIImageView* selectedImage;
    UILabel* selectedLabel;
    UILabel* unselectedLabel;
    UIFont* labelFont;
    UIColor* unselectedColor;
    UIColor* selectedColor;
    id delegate;
}

@property (nonatomic, assign, getter = isSelected, setter = isSelected:) BOOL isSelected;
@property (nonatomic, assign, getter = delegate, setter = delegate:) id delegate;

- (void)setBackgroundImage:(UIImage*)image forState:(UIControlState)state;
- (void)setTitle:(NSString*)title forState:(UIControlState)state;
- (void)setTitleColor:(UIColor*)color forState:(UIControlState)state;
- (void)setFont:(UIFont*)font;
- (NSString*)getTitleForState:(UIControlState)state;

@end
