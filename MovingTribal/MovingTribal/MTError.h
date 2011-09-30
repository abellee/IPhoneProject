//
//  MTError.h
//  MovingTribal
//
//  Created by Lee Abel on 9/28/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTInfo.h"

@interface MTError : MTInfo{
	int errorCode;
}

@property (nonatomic, assign, getter = errorCode, setter = errorCode:) int errorCode;

@end
