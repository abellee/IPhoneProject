//
//  ProfileInterface.h
//  MovingTribal
//
//  Created by Lee Abel on 9/28/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserData.h"
#import "EditableUITableView.h"
#import "EditableUITableCellData.h"
#import "InterfaceDelegate.h"

@interface ProfileInterface : UIViewController{
	UIImageView* avatar;
	UILabel* nicknameLabel;
	UILabel* ageLabel;
	UILabel* sexLabel;
	UILabel* mtIdLabel;
	
	UIButton* textButton;
	UIButton* voiceButton;
	UIButton* taskButton;
	UIButton* actionButton;
	
	UserData* userData;
	EditableUITableView* profileTable;
	
	id<InterfaceDelegate> delegate;
}

@property (nonatomic, assign) id<InterfaceDelegate> delegate;
@property (nonatomic, retain) UIImageView* avatar;
@property (nonatomic, retain) UILabel* nicknameLabel;
@property (nonatomic, retain) UILabel* ageLabel;
@property (nonatomic, retain) UILabel* sexLabel;
@property (nonatomic, retain) UILabel* mtIdLabel;
@property (nonatomic, retain) UIButton* textButton;
@property (nonatomic, retain) UIButton* voiceButton;
@property (nonatomic, retain) UIButton* taskButton;
@property (nonatomic, retain) UIButton* actionButton;
@property (nonatomic, retain) EditableUITableView* profileTable;

@property (nonatomic, assign, getter = userData, setter = userData:) UserData* userData;

- (id)initWithUserData:(UserData *)data;

@end
