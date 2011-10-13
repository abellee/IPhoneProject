//
//  MessageCenter.h
//  MovingTribal
//
//  Created by Lee Abel on 9/30/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessageInfo.h"
#import "UserData.h"

@interface MessageCenter : NSObject{
	NSMutableDictionary* messagesList;
}

@property (nonatomic, assign) NSMutableDictionary* messagesList;

- (void)insertUnreadMessage:(MessageInfo *)info userData:(UserData *)data;
- (void)deleteUnreadMessageByUserData:(UserData *)data messageIndex:(NSUInteger)index allDelete:(BOOL)isAll;

@end
