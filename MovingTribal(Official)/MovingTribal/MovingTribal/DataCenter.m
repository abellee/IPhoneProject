//
//  DataCenter.m
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter

@synthesize player;

static DataCenter *sharedCenter = nil;

+ (id)instance
{
	if(sharedCenter == nil)
		sharedCenter = [[DataCenter alloc] init];
	return sharedCenter;
}

- (void)restorePlayer
{
	if(player == nil)
		player = [[Player alloc] init];
	NSMutableSet *playerInfo = [[NSUserDefaults standardUserDefaults] objectForKey:kPlayerInfo];
	if(playerInfo){
		NSString *usernameInCache = [playerInfo valueForKey:kUsername];
		NSString *passwordInCache = [playerInfo valueForKey:kPassword];
		player.account = usernameInCache;
		player.password = passwordInCache;
	}
}

- (void)dealloc
{
	NSLog(@"******| DataCenter |****** received dealloc message!");
	[player release];
	player = nil;
	sharedCenter = nil;
	[super dealloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        [self performSelector:@selector(restorePlayer)];
    }
    
    return self;
}

@end
