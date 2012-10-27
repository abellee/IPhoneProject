//
//  WorldMapLayer.m
//  YiZu
//
//  Created by Abel Lee on 12-6-28.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "WorldMapLayer.h"
#import "SystemConfig.h"

@implementation WorldMapLayer

@synthesize background;
@synthesize map;
@synthesize shop;
@synthesize storehouse;
@synthesize resource;
@synthesize pethouse;
@synthesize delegate;

-(id)init
{
    if(self = [super init]){
        NSString* backgroundPath = [[NSBundle mainBundle] pathForResource:@"worldmap" ofType:@"png"];
        UIImage* image = [UIImage imageWithContentsOfFile:backgroundPath];
        background = [[UIImageView alloc] initWithImage:image];
        [self.view addSubview:background];

        CGRect buttonRect = CGRectMake(0, 0, 100, 40);
        shop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [shop setTitle:@"商店" forState:UIControlStateNormal];
        [shop setFrame:CGRectMake(0, 300, buttonRect.size.width, buttonRect.size.height)];
        [self.view addSubview:shop];
        [shop setTag:0];
        [shop addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        storehouse = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [storehouse setTitle:@"仓库" forState:UIControlStateNormal];
        [storehouse setFrame:CGRectMake(0, 400, buttonRect.size.width, buttonRect.size.height)];
        [self.view addSubview:storehouse];
        [storehouse setTag:1];
        [storehouse addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        resource = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [resource setTitle:@"资源" forState:UIControlStateNormal];
        [resource setFrame:CGRectMake(220, 300, buttonRect.size.width, buttonRect.size.height)];
        [self.view addSubview:resource];
        [resource setTag:2];
        [resource addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        pethouse = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [pethouse setTitle:@"宠物屋" forState:UIControlStateNormal];
        [pethouse setFrame:CGRectMake(220, 400, buttonRect.size.width, buttonRect.size.height)];
        [self.view addSubview:pethouse];
        [pethouse setTag:3];
        [pethouse addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        map = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [map setTitle:@"地图" forState:UIControlStateNormal];
        [map setFrame:CGRectMake(100, 100, buttonRect.size.width, buttonRect.size.height)];
        [self.view addSubview:map];
        [map setTag:4];
        [map addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)buttonClicked:(id)sender
{
    UIView* button = (UIView*)sender;
    NSAssert(delegate, @"delegate is nil!");
    switch (button.tag) {
        case 0:{
            if(delegate && [delegate conformsToProtocol:@protocol(MainViewDelegate)] && [delegate respondsToSelector:@selector(shopButtonClicked)]){
                [delegate shopButtonClicked];
            }
        }break;
        case 1:{
            if(delegate && [delegate conformsToProtocol:@protocol(MainViewDelegate)] && [delegate respondsToSelector:@selector(storehouseButtonClicked)]){
                [delegate storehouseButtonClicked];
            }
        }break;
        case 2:{
            if(delegate && [delegate conformsToProtocol:@protocol(MainViewDelegate)] && [delegate respondsToSelector:@selector(resourceButtonClicked)]){
                [delegate resourceButtonClicked];
            }
        }break;
        case 3:{
            if(delegate && [delegate conformsToProtocol:@protocol(MainViewDelegate)] && [delegate respondsToSelector:@selector(pethouseButtonClicked)]){
                [delegate pethouseButtonClicked];
            }
        }break;
        case 4:{
            if(delegate && [delegate conformsToProtocol:@protocol(MainViewDelegate)] && [delegate respondsToSelector:@selector(mapButtonClicked)]){
                [delegate mapButtonClicked];
            }
        }break;
        default:
            break;
    }
}

-(void)dealloc
{
    NSLog(@"**********| WorldMapLayer dealloc! |***********");
    
    [background release];
    [map release];
    [delegate release];
    
    [super dealloc];
}

@end
