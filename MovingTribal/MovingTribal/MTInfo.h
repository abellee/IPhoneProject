//
//  MTInfo.h
//  MovingTribal
//
//  Created by Lee Abel on 9/28/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTInfo : NSObject{
	NSString* infoString;
}

@property (nonatomic, assign, getter = infoString, setter = infoString:) NSString* infoString;

@end
