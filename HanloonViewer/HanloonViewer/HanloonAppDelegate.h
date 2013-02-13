//
//  HanloonAppDelegate.h
//  HanloonViewer
//
//  Created by Abel Lee on 13-2-10.
//  Copyright (c) 2013年 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HanloonViewerMainViewController;
@interface HanloonAppDelegate : UIResponder <UIApplicationDelegate>{
    HanloonViewerMainViewController* mainViewController;
}

@property (strong, nonatomic) UIWindow *window;

@end
