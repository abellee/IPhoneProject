//
//  PetData.m
//  YiZu
//
//  Created by Abel Lee on 12-6-28.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "PetData.h"

@implementation PetData

@synthesize uid;
@synthesize state;
@synthesize life;
@synthesize grow;
@synthesize feel;
@synthesize cur_exp;
@synthesize total_exp;
@synthesize age;
@synthesize equipList;

-(id)init
{
    if(self = [super init]){
        
    }
    return self;
}

-(void)dealloc
{
    NSLog(@"*********| PetData dealloc! |*********");
    
    [super dealloc];
}

@end
