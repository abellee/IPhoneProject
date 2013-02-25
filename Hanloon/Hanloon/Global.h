//
//  Global.h
//  Hanloon
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AbelViewController;
@interface Global : NSObject{
    AbelViewController* app;
}

@property (nonatomic, assign, getter = app, setter = app:) AbelViewController* app;

+(id)sharedInstance;

@end
