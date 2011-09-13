//
//  InterfaceDelegate.h
//  MovingTribal
//
//  Created by Lee Abel on 9/13/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol InterfaceDelegate <NSObject>

@optional
- (void)showRegistInterface:(NSInteger)tag;
- (void)showOtherLoginInterface:(NSInteger)tag;
- (void)showForgetPasswordInterface:(NSInteger)tag;
- (void)showMapInterface:(NSInteger)tag;

- (void)exitRegistion:(NSInteger)tag;
- (void)exitOtherLoginInterface:(NSInteger)tag;
- (void)exitForgetPasswordInterface:(NSInteger)tag;

@end
