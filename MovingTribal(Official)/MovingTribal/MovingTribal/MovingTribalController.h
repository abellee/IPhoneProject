//
//  MovingTribalController.h
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginInterfaceController.h"
#import "RegistInterfaceController.h"

@interface MovingTribalController : UIViewController<InterfaceDelegate>{
	LoginInterfaceController *loginInterface;
	RegistInterfaceController *registInterface;
}

@end
