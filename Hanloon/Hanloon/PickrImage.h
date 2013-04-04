//
//  PickrImage.h
//  Hanloon
//
//  Created by Lee Abel on 13-3-18.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PickrImage : NSObject{
    UIImage* image;
    BOOL isAlbum;
}

@property (nonatomic, retain, getter = image, setter = image:) UIImage* image;
@property (nonatomic, assign, getter = isAlbum, setter = isAlbum:) BOOL isAlbum;

@end
