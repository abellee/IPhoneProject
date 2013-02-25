//
//  ImageData.h
//  Hanloon
//
//  Created by Lee Abel on 13-2-25.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageData : NSObject{
    NSString* originImage;
    NSString* thumbImage;
    NSString* name;
    UIImage* thumbImageData;
    UIImage* originImageData;
}

@property (nonatomic, retain, getter = originImage, setter = originImage:) NSString* originImage;
@property (nonatomic, retain, getter = thumbImage, setter = thumbImage:) NSString* thumbImage;
@property (nonatomic, retain, getter = name, setter = name:) NSString* name;
@property (nonatomic, retain, getter = thumbImageData, setter = thumbImageData:) UIImage* thumbImageData;
@property (nonatomic, retain, getter = originImageData, setter = originImageData:) UIImage* originImageData;

@end
