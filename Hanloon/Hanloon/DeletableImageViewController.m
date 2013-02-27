//
//  DeletableImageViewController.m
//  Hanloon
//
//  Created by Lee Abel on 13-2-27.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import "DeletableImageViewController.h"
#import "UIImage+ImageScale.h"

@interface DeletableImageViewController ()

@end

@implementation DeletableImageViewController

@synthesize delegate;

- (void)dealloc
{
    NSLog(@"************************* DeletableImageViewController dealloc ****************************************");
    
    [imageView release];
    [deleteButton release];
    
    [super dealloc];
}

- (void)setImageData:(UIImage *)image size:(CGSize)cgSize
{
    UIImage* buttonSkin = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"enterButton" ofType:@"png"]];
    
    CGSize finalSize = CGSizeMake(cgSize.width, cgSize.height - buttonSkin.size.height - 20);
    originImage = image;
    imageData = [image scaleToSize:finalSize];
    imageView = [[UIImageView alloc] initWithImage:imageData];
    [self.view addSubview:imageView];
    
    deleteButton = [[UIButton alloc] initWithFrame:CGRectMake((cgSize.width - buttonSkin.size.width) / 2, finalSize.height + 10, buttonSkin.size.width, buttonSkin.size.height)];
    [deleteButton setBackgroundImage:buttonSkin forState:UIControlStateNormal];
    [deleteButton setTitle:@"删除图片" forState:UIControlStateNormal];
    [deleteButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [deleteButton.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [self.view addSubview:deleteButton];
    [deleteButton addTarget:self action:@selector(deleteButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)deleteButtonPressed:(id)sender
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
            if (delegate && [delegate respondsToSelector:@selector(deleteImage:controller:)]) {
                [delegate deleteImage:originImage controller:self];
            }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
