//
//  Config.h
//  MovingTribal
//
//  Created by Abel Lee on 10/13/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginMode.h"
#import "ConfigurationKeys.h"

@interface Config : NSObject{
	NSMutableSet *config;
}

@property (nonatomic, retain) NSString *server;
@property (nonatomic, assign) CGSize size;

+ (id)instance;
- (id)configValueForKey:(NSString *)key;
- (void)setConfigValueByKey:(NSString *)key value:(id)configValue;

@end
