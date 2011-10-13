//
//  ChatInterface.h
//  MovingTribal
//
//  Created by Lee Abel on 9/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIkit/UIkit.h>
#import <QuartzCore/QuartzCore.h>
#import "InterfaceDelegate.h"
#import "TaskEntryDelegate.h"
#import "NotificationType.h"
#import "TaskMessageInfo.h"

#import "ChatInput.h"
#import "ChatCategory.h"
#import "TouchableUIScrollView.h"
#import "EmotionsView.h"
#import "EmotionsDelegate.h"
#import "TextEntry.h"
#import "VoiceEntry.h"
#import "TaskEntry.h"

@interface ChatInterface : UIViewController<ChatInputDelegate, ChatCategoryDelegate, EmotionsDelegate, TaskEntryDelegate, UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
    id<InterfaceDelegate> delegate;
    
//    UIScrollView* scrollView;
//    UIView* chatList;
//    UITextField* chatInput;
//    UIView* topBackground;
//    UIView* bottomBackground;
    
    UserData* userData;
	ChatInput* chatInput;
	ChatCategory* chatCategory;
	TouchableUIScrollView* scrollView;
	EmotionsView* emotionView;
	
	NSString* dir;
	CGFloat keyboardHeight;
	CGFloat chatInputPosY;
	BOOL isEmotion;
	NSMutableArray* entryList;
}

@property (nonatomic, assign) id<InterfaceDelegate> delegate;
@property (nonatomic, assign) ChatInput* chatInput;
@property (nonatomic, assign) ChatCategory* chatCategory;
@property (nonatomic, assign) TouchableUIScrollView* scrollView;
@property (nonatomic, assign) EmotionsView* emotionView;
@property (nonatomic, assign) NSString* dir;
@property (nonatomic, assign) CGFloat keyboardHeight;
@property (nonatomic, assign) CGFloat chatInputPosY;
@property (nonatomic, assign) BOOL isEmotion;
@property (nonatomic, assign) NSMutableArray* entryList;

//@property (nonatomic, retain) UIScrollView* scrollView;
//@property (nonatomic, retain) UITextField* chatInput;
//@property (nonatomic, retain) UIView* topBackground;
//@property (nonatomic, retain) UIView* bottomBackground;

@property (nonatomic, assign, getter = userData, setter = userData:) UserData* userData;

- (id)initWithUserData:(UserData *)data frame:(CGRect)frame;
- (void)chatInputMoveUp:(NSTimeInterval)animationInterval;
- (void)chatInputMoveDown:(NSTimeInterval)animationInterval;
- (void)emotionViewMoveUp:(NSTimeInterval)animationInterval;
- (void)emotionViewMoveDown:(NSTimeInterval)animationInterval;

@end
