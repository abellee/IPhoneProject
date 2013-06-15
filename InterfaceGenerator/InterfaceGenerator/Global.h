//
//  Global.h
//  InterfaceGenerator
//
//  Created by Lee Abel on 13-4-28.
//  Copyright (c) 2013年 YiZu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PPAppDelegate;
@interface Global : NSObject

@property (nonatomic, retain, getter = publicResource, setter = publicResource:) NSMutableData* publicResource;
@property (nonatomic, retain, getter = curResource, setter = curResource:) NSMutableData* curResource;
@property (nonatomic, copy, getter = publicResPath, setter = publicResPath:) NSString* publicResPath;
@property (nonatomic, assign, getter = canvasWidth, setter = canvasWidth:) int canvasWidth;
@property (nonatomic, assign, getter = canvasHeight, setter = canvasHeight:) int canvasHeight;
@property (nonatomic, assign, getter = app, setter = app:) PPAppDelegate* app;

+ (id)sharedGlobal;

@end
