//
//  AvatarChooser.h
//  MovingTribal
//
//  Created by Abel Lee on 10/15/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AvatarChooser : UIViewController{
	UIButton *avatar;
	UIButton *choosePhoto;
	UIButton *chooseCamera;
}

- (id)initWidthFrame:(CGRect)frame;

@end
