//
//  DeletableImageViewController.h
//  Hanloon
//
//  Created by Lee Abel on 13-2-27.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeletableImageDelegate.h"

@interface DeletableImageViewController : UIViewController<UIAlertViewDelegate>{
    UIImage* imageData;
    UIImage* originImage;
    UIImageView* imageView;
    UIButton* deleteButton;
    
    id<DeletableImageDelegate> delegate;
}

@property (nonatomic, assign, getter = delegate, setter = delegate:) id<DeletableImageDelegate> delegate;

- (void)setImageData:(UIImage*)image size:(CGSize)cgSize;

@end
