//
//  ResourceConfig.m
//  PocketPet
//
//  Created by Lee Abel on 13-4-18.
//
//

#import "ResourceConfig.h"

@implementation ResourceConfig

@synthesize subtype;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

@end
