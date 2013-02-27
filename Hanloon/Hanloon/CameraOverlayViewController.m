//
//  CameraOverlayViewController.m
//  Hanloon
//
//  Created by Lee Abel on 13-2-26.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import "CameraOverlayViewController.h"
#import "Definitions.h"

@interface CameraOverlayViewController ()

@end

@implementation CameraOverlayViewController

@synthesize delegate;

- (void)dealloc
{
    NSLog(@"********************* CameraOverlayViewController dealloc ***************************");
    
    [closeButton release];
    [background release];
    [dock release];
    [takePhotoButton release];
    [doneButton release];
    
    [super dealloc];
}

- (void)setView:(UIView *)view
{
    [super setView:view];
    
    [self initView];
}

- (void)initView
{
    UIImage* closeButtonSkin = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"closeButton" ofType:@"png"]];
    closeButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, closeButtonSkin.size.width, closeButtonSkin.size.height)];
    [closeButton setBackgroundImage:closeButtonSkin forState:UIControlStateNormal];
    [self.view addSubview:closeButton];
    [closeButton addTarget:self action:@selector(closeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage* dockBackgroundImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cameraDock" ofType:@"png"]];
    background = [[UIImageView alloc] initWithImage:dockBackgroundImage];
    dock = [[UIView alloc] initWithFrame:CGRectMake(0, FULL_HEIGHT - dockBackgroundImage.size.height - 20, dockBackgroundImage.size.width, dockBackgroundImage.size.height)];
    [self.view addSubview:dock];
    
    [dock addSubview:background];
    
    UIImage* cameraButtonSkin = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cameraButton" ofType:@"png"]];
    takePhotoButton = [[UIButton alloc] initWithFrame:CGRectMake((dockBackgroundImage.size.width - cameraButtonSkin.size.width) / 2, dock.frame.origin.y + (dockBackgroundImage.size.height - cameraButtonSkin.size.height) / 2, cameraButtonSkin.size.width, cameraButtonSkin.size.height)];
    [takePhotoButton setBackgroundImage:cameraButtonSkin forState:UIControlStateNormal];
    [self.view addSubview:takePhotoButton];
    [takePhotoButton addTarget:self action:@selector(takePhotoButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage* doneButtonSkin = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"doneButton" ofType:@"png"]];
    doneButton = [[UIButton alloc] initWithFrame:CGRectMake(dockBackgroundImage.size.width - doneButtonSkin.size.width - 10, dock.frame.origin.y + (dockBackgroundImage.size.height - doneButtonSkin.size.height) / 2, doneButtonSkin.size.width, doneButtonSkin.size.height)];
    [doneButton setBackgroundImage:doneButtonSkin forState:UIControlStateNormal];
    [self.view addSubview:doneButton];
    [doneButton addTarget:self action:@selector(doneButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)closeButtonPressed:(id)sender
{
    if (delegate && [delegate respondsToSelector:@selector(closeButtonPressed)]) {
        [delegate closeButtonPressed];
    }
}

- (void)takePhotoButtonPressed:(id)sender
{
    if (delegate && [delegate respondsToSelector:@selector(takePhotoPressed)]) {
        [delegate takePhotoPressed];
    }
}

- (void)doneButtonPressed:(id)sender
{
    if (delegate && [delegate respondsToSelector:@selector(doneButtonPressed)]) {
        [delegate doneButtonPressed];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
