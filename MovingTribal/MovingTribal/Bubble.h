//
//  Bubble.h
//  MovingTribal
//
//  Created by Lee Abel on 9/24/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BubbleDelegate.h"

@interface Bubble : UIViewController{
	id<BubbleDelegate> delegate;
}

@property (nonatomic, assign) id<BubbleDelegate> delegate;

@end
