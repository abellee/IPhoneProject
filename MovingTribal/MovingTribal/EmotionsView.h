//
//  EmotionsView.h
//  MovingTribal
//
//  Created by Lee Abel on 9/23/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define ITEM_SIZE 40
#define GAP 0
#define NUM_PER_ROW 8
#define ROWS_PER_PAGE 5
#define kKeyboardHeight 216
#define kMoveableOffset 30

@interface EmotionsView : UIViewController<UIScrollViewDelegate>{
	UIPageControl* pageControl;
	UIScrollView* scrollView;
	
	NSArray* emotions;
	BOOL isPageControl;
}

@property (nonatomic, assign) BOOL isPageControl;
@property (nonatomic, assign) NSArray* emotions;

@property (nonatomic, assign) UIScrollView* scrollView;
@property (nonatomic, assign) UIPageControl* pageControl;

@end
