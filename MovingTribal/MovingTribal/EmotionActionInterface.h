//
//  EmotionActionInterface.h
//  MovingTribal
//
//  Created by Lee Abel on 9/28/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InterfaceDelegate.h"
#import "UserData.h"
#import "NetWork.h"

@interface EmotionActionInterface : UIViewController<UITableViewDelegate, UITableViewDataSource>{
	id<InterfaceDelegate> delegate;
	UserData* userData;
	UITableViewController* emotionsList;
	NSArray* emotionsData;
}

@property (nonatomic, assign) id<InterfaceDelegate> delegate;
@property (nonatomic, assign) UserData* userData;
@property (nonatomic, retain) UITableViewController* emotionsList;
@property (nonatomic, assign) NSArray* emotionsData;

- (id)initWithUserData:(UserData *)data;

@end
