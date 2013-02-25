//
//  UIImage+ImageScale.h
//  Photygraphy
//
//  Created by Lee Abel on 13-2-20.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageScale)

-(UIImage*)scaleToSize:(CGSize)size;
-(UIImage *)fixOrientation;;

@end
