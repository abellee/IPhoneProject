//
//  MovingTribalController.h
//  MovingTribal
//
//  Created by Lee Abel on 9/12/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "InterfaceDelegate.h"

#import "IntroduceContainer.h"
#import "LoginContainer.h"
#import "MainContainer.h"
#import "ChatInterface.h"
#import "DataGetter.h"

@interface MovingTribalController : UIViewController<InterfaceDelegate>{
    IntroduceContainer* introContainer;
    LoginContainer* loginContainer;
    MainContainer* mainContainer;
    ChatInterface* chatInterface;
    DataGetter* dataGetter;
    
    NSInteger currentState;
}

@property (nonatomic, assign) IntroduceContainer* introContainer;
@property (nonatomic, assign) LoginContainer* loginContainer;
@property (nonatomic, assign) MainContainer* mainContainer;
@property (nonatomic, assign) ChatInterface* chatInterface;
@property (nonatomic, assign) DataGetter* dataGetter;
@property (nonatomic, assign) NSInteger currentState;

@end
