//
//  MessageInfo.h
//  MovingTribal
//
//  Created by Lee Abel on 9/30/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserData.h"

typedef enum MessageType{
	TextMessage,
	VoiceMessage,
	TaskMessage,
	VideoMessage,
	ImageMessage
}MessageType;

@interface MessageInfo : NSObject{
	MessageType type;
	UserData* from;
	NSString* text;
	NSDate* time;
}

@property (nonatomic, assign, getter = type, setter = type:) MessageType type;
@property (nonatomic, assign, getter = from, setter = from:) UserData* from;
@property (nonatomic, assign, getter = text, setter = text:) NSString* text;
@property (nonatomic, assign, getter = time, setter = time:) NSDate* time;

@end
