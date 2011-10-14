//
//  ParentInterfaceController.h
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InterfaceDelegate.h"

@interface ParentInterfaceController : UIViewController{
	id<InterfaceDelegate> delegate;
}

@property (nonatomic, assign) id<InterfaceDelegate> delegate;

@end
