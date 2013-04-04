//
//  DeletableImageViewController.h
//  Hanloon
//
//  Created by Lee Abel on 13-2-27.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeletableImageDelegate.h"

@class PickrImage;
@interface DeletableImageViewController : UIViewController<UIAlertViewDelegate>{
    UIImage* imageData;
    UIImage* originImage;
    UIImageView* imageView;
    UIButton* deleteButton;
    
    PickrImage* pickrImage;
    
    id<DeletableImageDelegate> delegate;
}

@property (nonatomic, assign, getter = delegate, setter = delegate:) id<DeletableImageDelegate> delegate;
@property (nonatomic, assign, getter = isAlbum, setter = isAlbum:) BOOL isAlbum;

- (void)setImageData:(PickrImage*)image size:(CGSize)cgSize;

@end
