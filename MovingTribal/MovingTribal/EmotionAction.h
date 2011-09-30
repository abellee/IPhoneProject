//
//  EmotionAction.h
//  MovingTribal
//
//  Created by Lee Abel on 9/28/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmotionAction : NSObject{
	int emotionId;                         // 表情id
	NSString* emotionName;                 // 表情名称
	NSString* emotionDescription;          // 表情介绍
}

@property (nonatomic, assign, getter = emotionId, setter = emotionId:) int emotionId;
@property (nonatomic, assign, getter = emotionName, setter = emotionName:) NSString* emotionName;
@property (nonatomic, assign, getter = emotionDescription, setter = emotionDescription:) NSString* emotionDescription;

@end
