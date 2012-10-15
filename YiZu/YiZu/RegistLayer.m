//
//  RegistLayer.m
//  YiZu
//
//  Created by Abel Lee on 12-6-28.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "RegistLayer.h"

@implementation RegistLayer

@synthesize nickname;
@synthesize password;
@synthesize repassword;
@synthesize email;
@synthesize head;
@synthesize registForm;
@synthesize delegate;

-(id)init
{
    if(self = [super init]){
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, TOTLE_WIDTH, HEIGHT_IN_NAVIGATION)];
        view.backgroundColor = [UIColor whiteColor];
        [self setView:view];
        
        registForm = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, TOTLE_WIDTH, HEIGHT_IN_NAVIGATION) style:UITableViewStylePlain];
        [self.view addSubview:registForm];
    }
    return self;
}

-(void)registDone
{
    if(delegate && [delegate conformsToProtocol:@protocol(LoginDelegate)]){
        [delegate doLogin:[email text] pass:[password text]];
    }
}

-(void)dealloc
{
    [nickname release];
    [password release];
    [repassword release];
    [email release];
    [head release];
    [takePhoto release];
    [album release];
    [registForm release];
    
    nickname = nil;
    password = nil;
    repassword = nil;
    email = nil;
    head = nil;
    takePhoto = nil;
    album = nil;
    registForm = nil;
    delegate = nil;
    
    [super dealloc];
}

@end
