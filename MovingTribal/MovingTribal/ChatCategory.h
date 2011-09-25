//
//  ChatCategory.h
//  MovingTribal
//
//  Created by Lee Abel on 9/24/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ChatCategoryDelegate.h"

@interface ChatCategory : UIViewController{
	id<ChatCategoryDelegate> delegate;
	
	UIButton* voiceButton;
	UIButton* textButton;
	UIButton* imageButton;
	UIButton* locationButton;
	UIButton* videoButton;
}

@property (nonatomic, assign) id<ChatCategoryDelegate> delegate;
@property (nonatomic, retain) UIButton* voiceButton;
@property (nonatomic, retain) UIButton* textButton;
@property (nonatomic, retain) UIButton* imageButton;
@property (nonatomic, retain) UIButton* locationButton;
@property (nonatomic, retain) UIButton* videoButton;

@end
