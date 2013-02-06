//
//  MapViewController.m
//  YiZu
//
//  Created by Lee Abel on 12-10-27.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "MapViewController.h"
#import "Global.h"

@implementation MapViewController

@synthesize map;
@synthesize localManager;

-(id)init
{
    if(self = [super init]){
        map = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, [[Global sharedGlobal] totalWidth], [[Global sharedGlobal] heightInNavigator])];
        map.delegate = self;
        [self.view addSubview:map];
    }
    return self;
}

-(void)dealloc
{
    NSLog(@"**********| MapViewController dealloc! |**********");
    
    [super dealloc];
}

@end
