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
#import "ProfileInterface.h"
#import "TaskInterface.h"
#import "TaskDetailInterface.h"
#import "EmotionActionInterface.h"

@interface MovingTribalController : UIViewController<InterfaceDelegate, UINavigationControllerDelegate>{
    IntroduceContainer* introContainer;
    LoginContainer* loginContainer;
    MainContainer* mainContainer;
    ChatInterface* chatInterface;
    DataGetter* dataGetter;
	ProfileInterface* profileInterface;
	TaskInterface* taskInterface;
	TaskDetailInterface* taskDetailInterface;
	EmotionActionInterface* emotionActionInterface;
    
    NSInteger currentState;
	UINavigationController* navigationController;
}

@property (nonatomic, assign) IntroduceContainer* introContainer;
@property (nonatomic, assign) LoginContainer* loginContainer;
@property (nonatomic, assign) MainContainer* mainContainer;
@property (nonatomic, assign) ChatInterface* chatInterface;
@property (nonatomic, assign) DataGetter* dataGetter;
@property (nonatomic, assign) ProfileInterface* profileInterface;
@property (nonatomic, assign) TaskInterface* taskInterface;
@property (nonatomic, assign) TaskDetailInterface* taskDetailInterface;
@property (nonatomic, assign) EmotionActionInterface* emotionActionInterface;
@property (nonatomic, assign) NSInteger currentState;
@property (nonatomic, retain) UINavigationController* navigationController;

@end
