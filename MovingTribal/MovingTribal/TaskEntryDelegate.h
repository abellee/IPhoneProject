//
//  TaskEntryDelegate.h
//  MovingTribal
//
//  Created by Lee Abel on 10/1/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"
#import "UserData.h"

@protocol TaskEntryDelegate <NSObject>

@optional
- (void)showTaskDetailByTask:(Task *)task ud:(UserData *)data;

@end
