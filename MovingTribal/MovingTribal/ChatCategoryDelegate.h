//
//  ChatCategoryDelegate.h
//  MovingTribal
//
//  Created by Lee Abel on 9/24/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

enum{
	kTextInput,
	kVoiceInput,
	kLocation,
	kPhoto,
	kVideo
};

@protocol ChatCategoryDelegate <NSObject>

- (void)determineCategory:(NSUInteger)tag;

@end
