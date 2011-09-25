//
//  ChatInput.h
//  MovingTribal
//
//  Created by Lee Abel on 9/24/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "ChatInputDelegate.h"
#import "NetWork.h"

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
}

@property (nonatomic, assign) id<ChatInputDelegate>delegate;
@property (nonatomic, retain) UITextField* textInput;
@property (nonatomic, retain) UIButton* functionButton;
@property (nonatomic, retain) UIButton* recordButton;
@property (nonatomic, retain) UIButton* emotionsButton;

- (void)resign;
- (void)showText;
- (void)hideText;
- (void)showRecorder;
- (void)hideRecorder;

@end
