//
//  ChatInput.h
//  MovingTribal
//
//  Created by Lee Abel on 9/24/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ChatInputDelegate.h"
#import "NetWork.h"
#import "UserData.h"

enum{
	kFunction,
	kRecorder,
	kEmotion
};

@interface ChatInput : UIViewController<UITextFieldDelegate>{
	id<ChatInputDelegate> delegate;
	
	UITextField* textInput;
	UIButton* functionButton;
	UIButton* recordButton;
	UIButton* emotionsButton;
	
	UserData* userData;
}

@property (nonatomic, assign) id<ChatInputDelegate>delegate;
@property (nonatomic, retain) UITextField* textInput;
@property (nonatomic, retain) UIButton* functionButton;
@property (nonatomic, retain) UIButton* recordButton;
@property (nonatomic, retain) UIButton* emotionsButton;
@property (nonatomic, assign) UserData* userData;

- (id)initWithUserData:(UserData *)data;
- (void)resign;
- (void)sign;
- (void)showText;
- (void)hideText;
- (void)showRecorder;
- (void)hideRecorder;

@end
