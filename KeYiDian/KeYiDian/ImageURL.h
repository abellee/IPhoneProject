//
//  ImageURL.h
//  KeYiDian
//
//  Created by Lee Abel on 13-2-28.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageURL : NSObject{
    NSString* thumbImage;
    NSString* middleImage;
    NSString* originImage;
}

@property (nonatomic, copy, getter = thumbImage, setter = thumbImage:) NSString* thumbImage;
@property (nonatomic, copy, getter = middleImage, setter = middleImage:) NSString* middleImage;
@property (nonatomic, copy, getter = originImage, setter = originImage:) NSString* originImage;

@end
