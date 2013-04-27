//
//  MainLayerViewController.m
//  YiZu
//
//  Created by Lee Abel on 12-10-27.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "MainLayerViewController.h"
#import "WorldMapLayer.h"
#import "StoreHouseViewController.h"
#import "ShopViewController.h"
#import "ProfileLayer.h"
#import "SystemSettingLayer.h"
#import "ResourceViewController.h"
#import "Global.h"

@implementation MainLayerViewController

-(id)init
{
    if(self = [super init]){
        worldMap = [[WorldMapLayer alloc] init];
        [worldMap delegate:self];
        
        navigationController = [[UINavigationController alloc] initWithRootViewController:worldMap];
        navigationController.navigationBar.topItem.title = @"口袋宠物";
        UIBarButtonItem* profileButton = [[UIBarButtonItem alloc] initWithTitle:@"资料" style:UIBarButtonItemStylePlain target:self action:@selector(profileButtonClicked:)];
        UIBarButtonItem* systemSettingButton = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(systemSettingButtonClicked:)];
        navigationController.navigationBar.topItem.leftBarButtonItem = profileButton;
        navigationController.navigationBar.topItem.rightBarButtonItem = systemSettingButton;
        [profileButton release];
        [systemSettingButton release];
        [self.view addSubview:navigationController.view];
    }
    return self;
}

-(void)profileButtonClicked:(id)sender
{
    if(!profile) profile = [[ProfileLayer alloc] init];
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[Global sharedGlobal] totalWidth], [[Global sharedGlobal] totalHeight])];
    view.backgroundColor = [UIColor grayColor];
    [profile setView:view];
    [navigationController pushViewController:profile animated:YES];
}

-(void)systemSettingButtonClicked:(id)sender
{
    if(!systemSetting) systemSetting = [[SystemSettingLayer alloc] init];
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[Global sharedGlobal] totalWidth], [[Global sharedGlobal] totalHeight])];
    view.backgroundColor = [UIColor blueColor];
    [systemSetting setView:view];
    [navigationController pushViewController:systemSetting animated:YES];
}

-(void)shopButtonClicked
{
    
}

-(void)resourceButtonClicked
{
    if(!resource) resource = [[ResourceViewController alloc] init];
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[Global sharedGlobal] totalWidth], [[Global sharedGlobal] totalHeight])];
    view.backgroundColor = [UIColor yellowColor];
    [resource setView:view];
    [navigationController pushViewController:resource animated:YES];
}

-(void)storehouseButtonClicked
{
    if(!storehouse) storehouse = [[StoreHouseViewController alloc] init];
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[Global sharedGlobal] totalWidth], [[Global sharedGlobal] totalHeight])];
    view.backgroundColor = [UIColor whiteColor];
    [storehouse setView:view];
    [navigationController pushViewController:storehouse animated:YES];
}

-(void)mapButtonClicked
{
//    if(!map) map = [[MapViewController alloc] init];
//    [navigationController pushViewController:map animated:YES];
}

-(void)pethouseButtonClicked
{
    
}

-(void)bagButtonClicked
{
    
}

-(void)dealloc
{
    NSLog(@"*********| MainLayerViewController dealloc! |*********");
    
    [super dealloc];
}

@end
