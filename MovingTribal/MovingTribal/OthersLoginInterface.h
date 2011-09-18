//
//  OthersLoginInterface.h
//  MovingTribal
//
//  Created by Lee Abel on 9/13/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "UIKit/UIKit.h"
#import "LoginContainerDelegate.h"

@interface OthersLoginInterface : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    UITableViewController* otherPlatformList;
    UIButton* backwardBtn;
    NSArray* platformList;
    
    id<LoginContainerDelegate> delegate;
}

@property (nonatomic, retain) UITableViewController* otherPlatformList;
@property (nonatomic, retain) UIButton* backwardBtn;
@property (nonatomic, assign) NSArray* platformList;

@property (nonatomic, assign) id<LoginContainerDelegate> delegate;

- (void)initInterface;

@end
