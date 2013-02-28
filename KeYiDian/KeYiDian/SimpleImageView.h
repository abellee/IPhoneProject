//
//  SimpleImageView.h
//  KeYiDian
//
//  Created by Lee Abel on 13-2-28.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 简单的图标类
 */
@interface SimpleImageView : UIImageView{
    
}

/**
 初始化方法
 
 @param filename 文件名
 
 @return id
 */
- (id)initWithFileName:(NSString*)filename;

@end
