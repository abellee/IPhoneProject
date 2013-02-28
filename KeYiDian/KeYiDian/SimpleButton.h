//
//  SimpleButton.h
//  KeYiDian
//
//  Created by Lee Abel on 13-2-28.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 普通按钮类
 */
@interface SimpleButton : UIButton

/**
 初始化方法
 
 @param normalStateImage 普通状态下的图片文件名
 @param hilightedStateImage 按下时的图片文件名
 @param selectedStateImage 选中时的图片文件名
 
 @return id
 */
- (id)initWithStateImage:(NSString*)normalStateImage hilighted:(NSString*)hilightedStateImage selected:(NSString*)selectedStateImage;

@end
