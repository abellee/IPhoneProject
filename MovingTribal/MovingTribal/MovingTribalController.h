//
//  MovingTribalController.h
//  MovingTribal
//
//  Created by Lee Abel on 9/12/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "RegistInterface.h"
#import "LoginInterface.h"
#import "OthersLoginInterface.h"
#import "MapInterface.h"

@interface MovingTribalController : UIViewController<InterfaceDelegate>{
    RegistInterface* registInterface;
    LoginInterface* loginInterface;
    OthersLoginInterface* othersInterface;
    MapInterface* mapInterface;
    
    UIView* currentView;
}
@property (nonatomic, retain) RegistInterface* registInterface;
@property (nonatomic, retain) LoginInterface* loginInterface;
@property (nonatomic, retain) OthersLoginInterface* othersInterface;
@property (nonatomic, retain) MapInterface* mapInterface;

@property (nonatomic, retain) UIView* currentView;

- (void)showLoginInterface;
- (void)easeOut:(UIView *)view;
- (void)easeIn:(UIView *)view;

@end
