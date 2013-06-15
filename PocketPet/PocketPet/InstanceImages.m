//
//  InstanceImages.m
//  PocketPet
//
//  Created by Lee Abel on 13-5-6.
//
//

#import "InstanceImages.h"

@implementation InstanceImages

@synthesize firstImageData, secondImageData, instanceId;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [firstImageData release];
    [secondImageData release];
    
    [super dealloc];
}

@end
