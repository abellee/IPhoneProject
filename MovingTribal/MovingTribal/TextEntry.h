//
//  TextEntry.h
//  MovingTribal
//
//  Created by Lee Abel on 9/30/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserData.h"
#import "Globals.h"
#import "EntryBelong.h"

@interface TextEntry : UIViewController{
	UILabel* label;
	UIView* background;
	UIImageView* avatar;
	
	UserData* data;
	
	ckEntryBelong belong;
	CGSize entrySize;
}

@property (nonatomic, assign) ckEntryBelong belong;
@property (nonatomic, assign) UILabel* label;
@property (nonatomic, assign) UIView* background;
@property (nonatomic, assign) UIImageView* avatar;
@property (nonatomic, assign) CGSize entrySize;

@property (nonatomic, assign) UserData* data;

- (id)initWithCustomBackground:(UIView *)view text:(NSString *)str userData:(UserData *)ud constrainedSize:(CGRect)rect;

@end
