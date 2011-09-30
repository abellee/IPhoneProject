//
//  ChatInputDelegate.h
//  MovingTribal
//
//  Created by Lee Abel on 9/24/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ChatInputDelegate <NSObject>

@optional
- (void)showChatCategory;
- (void)showEmotionView;

@end
