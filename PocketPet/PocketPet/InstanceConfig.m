//
//  InstanceConfig.m
//  PocketPet
//
//  Created by Lee Abel on 13-5-4.
//
//

#import "InstanceConfig.h"

@implementation InstanceConfig

@synthesize instanceId, dataRange, instanceName, battleRange;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [instanceName release];
    
    [super dealloc];
}

@end
