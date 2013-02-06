//
//  CameraOverlayViewController.m
//  Photygraphy
//
//  Created by Lee Abel on 12-12-26.
//  Copyright (c) 2012年 Lee Abel. All rights reserved.
//

#import "CameraOverlayViewController.h"

@interface CameraOverlayViewController ()

@end

@implementation CameraOverlayViewController

- (id)init
{
    if(self = [super init]){
        
    }
    return self;
}

-(void)setViewFrame:(CGRect)rect
{
    [self.view setFrame:rect];
    if(toolbar){
        [toolbar removeFromSuperview];
        [toolbar release];
    }
    toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, 60)];
    UIBarButtonItem* exitButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(toolbarButtonPressed:)];
    exitButton.tag = 0;
    UIBarButtonItem* takePhoto = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(toolbarButtonPressed:)];
    takePhoto.tag = 1;
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(toolbarButtonPressed:)];
    doneButton.tag = 2;
    UIBarButtonItem* flexiable = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    toolbar.items = [NSArray arrayWithObjects:exitButton, flexiable, takePhoto, flexiable, doneButton, nil];
    [exitButton release];
    [takePhoto release];
    [doneButton release];
    [flexiable release];
    [self.view addSubview:toolbar];
}

- (void)toolbarButtonPressed:(UIBarButtonItem*)sender
{
    NSLog(@"%d", sender.tag);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	if (interfaceOrientation == UIInterfaceOrientationPortrait) {
        return YES;
    }
    return NO;
}

@end
