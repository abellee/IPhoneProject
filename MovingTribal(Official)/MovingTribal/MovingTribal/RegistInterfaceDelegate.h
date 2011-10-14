//
//  RegistInterfaceDelegate.h
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RegistInterfaceDelegate <NSObject>

@optional
- (void)backwardForInterface:(UIViewController *)viewController;
- (void)forwardForInterface:(UIViewController *)viewController;

@end
