//
//  KYDViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PanViewControllerDelegate.h"

@class IndexViewController;
@class LeftSideViewController;
@class RightSideViewController;
@interface KYDViewController : UIViewController<PanViewControllerDelegate>{
    IndexViewController* indexViewController;
    LeftSideViewController* leftSideViewController;
    RightSideViewController* rightSideViewController;
}

- (void)hurryUpInterface;
- (void)orderListInterface;
- (void)addressManagerInterface;
- (void)collectionInterface;
- (void)commentManagerInterface;
- (void)processingOrderInterface;

- (void)searchViewInterface;
- (void)changeLocationInterface;
- (void)aboutInterface;
- (void)feedBackInterface;

- (void)logoff;

@end