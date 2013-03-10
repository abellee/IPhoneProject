//
//  CurrentLocationViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-10.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITouchableViewDelegate.h"

@class UITouchableLabel;
@interface CurrentLocationViewController : UIViewController<UITouchableViewDelegate>{
    UIImageView* locationIcon;
    UIView* background;
    UITouchableLabel* changeLocation;
    UILabel* locationLabel;
}

- (void)setLocation:(NSString*)location;

@end
