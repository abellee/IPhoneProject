//
//  Config.m
//  MovingTribal
//
//  Created by Abel Lee on 10/13/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "Config.h"

@implementation Config

@synthesize server;
@synthesize size;

static Config *sharedConfig = nil;

+ (id)instance
{
	if(sharedConfig == nil)
		sharedConfig = [[Config alloc] init];
	return sharedConfig;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self performSelector:@selector(initConfig)];
    }
    
    return self;
}

- (void)initConfig
{
	server = @"192.168.1.101/forios/easyAPNS";
	config = [[NSUserDefaults standardUserDefaults] objectForKey:kConfigInfo];
}

- (id)configValueForKey:(NSString *)key
{
	if(config)
		return [config valueForKey:key];
	return nil;
}

- (void)setConfigValueByKey:(NSString *)key value:(id)configValue
{
	if(config)
		[config setValue:configValue forKey:key];
}

- (void)dealloc
{
	NSLog(@"******| Config |****** received dealloc message!");
	[server release];
	[config removeAllObjects];
	
	server = nil;
	config = nil;
	sharedConfig = nil;
	
	[super dealloc];
}

@end
