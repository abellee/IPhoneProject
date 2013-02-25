//
//  ShadowViewController.h
//  HanloonViewer
//
//  Created by Abel Lee on 13-2-13.
//  Copyright (c) 2013年 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class ImageDownloadData;
@interface ShadowViewController : UIViewController{
    UIColor* borderColor_;
    UIColor* shadowColor_;
    CGSize shadowOffset_;
    NSString* contentsGravity_;
    float borderWidth_;
    float shadowRadius_;
    float shadowOpacity_;
    id contents_;
    CALayer* contentLayer;
    ImageDownloadData* imageData;
}

@property (nonatomic, assign, getter = borderColor, setter = borderColor:) UIColor* borderColor;
@property (nonatomic, assign, getter = shadowColor, setter = shadowColor:) UIColor* shadowColor;
@property (nonatomic, assign, getter = shadowOffset, setter = shadowOffset:) CGSize shadowOffset;
@property (nonatomic, assign, getter = borderWidth, setter = borderWidth:) float borderWidth;
@property (nonatomic, assign, getter = shadowRadius, setter = shadowRadius:) float shadowRadius;
@property (nonatomic, assign, getter = shadowOpacity, setter = shadowOpacity:) float shadowOpacity;
@property (nonatomic, retain, getter = contents, setter = contents:) id contents;
@property (nonatomic, assign, getter = contentsGravity, setter = contentsGravity:) NSString* contentsGravity;
@property (nonatomic, retain, getter = imageData, setter = imageData:) ImageDownloadData* imageData;

@end
