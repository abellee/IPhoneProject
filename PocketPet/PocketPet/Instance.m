//
//  Instance.m
//  PocketPet
//
//  Created by Lee Abel on 13-5-4.
//
//

#import "Instance.h"
#import "InstanceImages.h"

@implementation Instance

@synthesize instanceId, instanceName, instanceImages;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [instanceName release];
    [instanceImages release];
    
    [super dealloc];
}

@end
