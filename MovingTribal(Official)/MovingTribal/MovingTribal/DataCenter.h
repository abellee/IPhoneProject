//
//  DataCenter.h
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "ConfigurationKeys.h"

@interface DataCenter : NSObject

@property (nonatomic, retain) Player *player;

+ (id)instance;

@end
