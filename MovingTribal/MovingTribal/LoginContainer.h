//
//  LoginContainer.h
//  MovingTribal
//
//  Created by Lee Abel on 9/17/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "LoginContainerDelegate.h"
#import "InterfaceDelegate.h"

#import "RegistInterface.h"
#import "LoginInterface.h"
#import "OthersLoginInterface.h"

@interface LoginContainer : UIViewController<LoginContainerDelegate>{
    id<InterfaceDelegate> delegate;
    
    RegistInterface* registInterface;
    LoginInterface* loginInterface;
    OthersLoginInterface* othersInterface;
}

@property (nonatomic, assign) id<InterfaceDelegate> delegate;
@property (nonatomic, assign) RegistInterface* registInterface;
@property (nonatomic, assign) LoginInterface* loginInterface;
@property (nonatomic, assign) OthersLoginInterface* othersLoginInterface;

@end
