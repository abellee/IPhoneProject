//
//  OthersLoginInterface.h
//  MovingTribal
//
//  Created by Lee Abel on 9/13/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "UIKit/UIKit.h"
#import "InterfaceDelegate.h"

@interface OthersLoginInterface : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    UITableViewController* otherPlatformList;
    UIButton* backwardBtn;
    NSArray* platformList;
    
    id<InterfaceDelegate> delegate;
}

@property (nonatomic, retain) UITableViewController* otherPlatformList;
@property (nonatomic, retain) UIButton* backwardBtn;
@property (nonatomic, assign) NSArray* platformList;

@property (nonatomic, assign) id<InterfaceDelegate> delegate;

- (void)initInterface;

@end
