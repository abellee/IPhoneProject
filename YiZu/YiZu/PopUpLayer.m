//
//  PopUpLayer.m
//  YiZu
//
//  Created by Abel Lee on 12-8-10.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "PopUpLayer.h"
#import "SystemConfig.h"

@implementation PopUpLayer

-(id)init
{
    self = [super init];
    if(self){
        activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        masker = [[UIView alloc] initWithFrame:CGRectMake(0, 0, TOTLE_WIDTH, TOTLE_HEIGHT)];
        masker.backgroundColor = [UIColor blackColor];
        masker.alpha = 0.3;
    }
    return self;
}

-(void)showActivityViewWithMask:(BOOL)isMask
{
    if(isMask){
        [self.view insertSubview:masker atIndex:0];
    }else{
        [masker removeFromSuperview];
    }
    [self.view addSubview:activityView];
    [activityView startAnimating];
    activityView.center = self.view.center;
}

-(void)hideActivityView
{
    if(activityView){
        [activityView stopAnimating];
        [activityView removeFromSuperview];
        [masker removeFromSuperview];
    }
}

-(void)showErrorAlertWithTitle:(NSString *)title info:(NSString *)error
{
    [self hideActivityView];
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title message:error delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
    alert = nil;
}

-(void)dealloc
{
    [activityView release];
    [masker release];
    
    [super dealloc];
}

@end
