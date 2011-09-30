//
//  EmotionsView.h
//  MovingTribal
//
//  Created by Lee Abel on 9/23/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "EmotionsDelegate.h"

#define ITEM_SIZE 35
#define GAP 0
#define NUM_PER_ROW 9
#define ROWS_PER_PAGE 5
#define kKeyboardHeight 216
#define kMoveableOffset 30

@interface EmotionsView : UIViewController<UIScrollViewDelegate>{
	id<EmotionsDelegate> delegate;
	UIPageControl* pageControl;
	UIScrollView* scrollView;
	
	NSArray* emotions;
	BOOL isPageControl;
}

@property (nonatomic, assign) id<EmotionsDelegate> delegate;

@property (nonatomic, assign) BOOL isPageControl;
@property (nonatomic, assign) NSArray* emotions;

@property (nonatomic, assign) UIScrollView* scrollView;
@property (nonatomic, assign) UIPageControl* pageControl;

@end
