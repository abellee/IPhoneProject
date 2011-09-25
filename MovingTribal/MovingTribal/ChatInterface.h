//
//  ChatInterface.h
//  MovingTribal
//
//  Created by Lee Abel on 9/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIkit/UIkit.h>
#import "InterfaceDelegate.h"

#import "ChatInput.h"
#import "ChatCategory.h"

@interface ChatInterface : UIViewController<ChatInputDelegate, ChatCategoryDelegate, UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
    id<InterfaceDelegate> delegate;
    
//    UIScrollView* scrollView;
//    UIView* chatList;
//    UITextField* chatInput;
//    UIView* topBackground;
//    UIView* bottomBackground;
    
    UserData* userData;
	ChatInput* chatInput;
	ChatCategory* chatCategory;
}

@property (nonatomic, assign) id<InterfaceDelegate> delegate;
@property (nonatomic, assign) ChatInput* chatInput;
@property (nonatomic, assign) ChatCategory* chatCategory;

//@property (nonatomic, retain) UIScrollView* scrollView;
//@property (nonatomic, retain) UITextField* chatInput;
//@property (nonatomic, retain) UIView* topBackground;
//@property (nonatomic, retain) UIView* bottomBackground;

@property (nonatomic, assign, getter = userData, setter = userData:) UserData* userData;

- (void)initInterface;

@end
