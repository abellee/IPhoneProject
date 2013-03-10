//
//  PanViewControllerDelegate.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-10.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PanViewControllerDelegate <NSObject>

@optional
- (void)isPanning:(float)panDistance;
- (void)autoPanWithData:(id)data;

@end
