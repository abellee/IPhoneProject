//
//  ShadowImageViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-2-22.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequestDelegate.h"

@interface ShadowImageViewController : UIViewController<ASIHTTPRequestDelegate>{
    UIImageView* background;
    UIImageView* shopImage;
    UIActivityIndicatorView* indicatorView;
    
    BOOL isLoading;
}

@property (nonatomic, assign, getter = isLoading, setter = isLoading:) BOOL isLoading;

- (void)loadImage:(NSString*)src;

@end
