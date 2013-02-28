//
//  UILoadingView.h
//  KeYiDian
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILoadingView : UIView{
    UIActivityIndicatorView* indicatorView;
    NSString* contentStr;
    
    UILabel* contentLabel;
}

@property (nonatomic, retain, getter = contentStr, setter = contentStr:) NSString* contentStr;

- (id)initWithFrameAndContent:(CGRect)rect content:(NSString*)content;

@end
