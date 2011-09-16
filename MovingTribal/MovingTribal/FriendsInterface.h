//
//  FriendsInterface.h
//  MovingTribal
//
//  Created by Lee Abel on 9/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "InterfaceDelegate.h"

@interface FriendsInterface : UIViewController{
    id<InterfaceDelegate> delegate;
}

@property (nonatomic, retain) id<InterfaceDelegate> delegate;

@end
