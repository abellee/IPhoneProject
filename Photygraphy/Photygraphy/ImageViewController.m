//
//  ImageViewController.m
//  Photygraphy
//
//  Created by Lee Abel on 12-12-26.
//  Copyright (c) 2012年 Lee Abel. All rights reserved.
//

#import "ImageViewController.h"

#import "AbelViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

-(void)addPicture:(UIImage *)image parent:(AbelViewController *)parent
{
    originalImage = image;
    parentController = parent;
    UIImageView* img = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:img];
    [img release];
    
    deleteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [deleteButton setFrame:CGRectMake((image.size.width - 100) / 2, image.size.height + 10, 100, 30)];
    [deleteButton setTitle:@"删除" forState:UIControlStateNormal];
    [self.view addSubview:deleteButton];
    [deleteButton addTarget:self action:@selector(deleteImage:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)deleteImage:(id)sender
{
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"删除图片" message:@"确认删除图片?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
    [alertView release];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [alertView dismissWithClickedButtonIndex:buttonIndex animated:YES];
            break;
        case 1:
            [parentController deleteImage:originalImage];
            break;
        default:
            break;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
