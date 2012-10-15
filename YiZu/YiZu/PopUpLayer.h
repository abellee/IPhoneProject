//
//  PopUpLayer.h
//  YiZu
//
//  Created by Abel Lee on 12-8-10.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SystemConfig.h"

@interface PopUpLayer : UIViewController<UIAlertViewDelegate>{
    UIActivityIndicatorView *activityView;
    UIView *masker;
}

-(void)showActivityViewWithMask:(BOOL)isMask;
-(void)hideActivityView;
-(void)showErrorAlertWithTitle:(NSString *)title info:(NSString *)error;

@end
