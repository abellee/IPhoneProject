//
//  MessageCenter.m
//  MovingTribal
//
//  Created by Lee Abel on 9/30/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "MessageCenter.h"

@implementation MessageCenter

@synthesize messagesList;

- (id)init
{
    self = [super init];
    if (self) {
        messagesList = [[NSMutableDictionary dictionaryWithCapacity:10] retain];
    }
    return self;
}

- (void)dealloc
{
	NSLog(@"******| MessageCenter |****** receive dealloc message!");
	for (NSString* key in messagesList) {
		NSMutableArray* arr = [messagesList objectForKey:key];
		if(arr){
			[arr removeAllObjects];
			[messagesList removeObjectForKey:key];
		}
	}
	messagesList = nil;
	[super dealloc];
}

- (void)insertUnreadMessage:(MessageInfo *)info userData:(UserData *)data
{
	NSMutableArray* messageArr = [messagesList objectForKey:[NSString stringWithFormat:@"%d", data.uid]];
	if(messageArr == nil){
		messageArr = [NSMutableArray arrayWithCapacity:10];
		[messageArr addObject:[info retain]];
		[messagesList setObject:messageArr forKey:[NSString stringWithFormat:@"%d", data.uid]];
	}else{
		[messageArr addObject:[info retain]];
	}
}

/**
 * 删除指定用户的聊天信息
 * UserData* data: 目标用户
 * index         : 消息在队列中的索引，如果allDelete为NO的情况下才起作用
 * allDelete     : 确定是删除与该用户的所有聊天信息，还是与该用户的某一条聊天信息，只有当此参数为NO的时候，index才起作用
 */
- (void)deleteUnreadMessageByUserData:(UserData *)data messageIndex:(NSUInteger)index allDelete:(BOOL)isAll
{
	if(isAll == YES){
		NSString* key = [NSString stringWithFormat:@"%d", data.uid];
		if([messagesList objectForKey: key]){
			[messagesList removeObjectForKey:key];
		}
	}else{
		NSString* key = [NSString stringWithFormat:@"%d", data.uid];
		NSMutableArray* arr = [messagesList objectForKey: key];
		if(arr){
			MessageInfo* info = [arr objectAtIndex:index];
			if(info){
				[arr removeObjectAtIndex:index];
				[info release];
			}
		}
	}
}

@end
