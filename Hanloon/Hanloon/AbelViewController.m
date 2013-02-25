//
//  AbelViewController.m
//  Hanloon
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import "AbelViewController.h"
#import "Global.h"
#import "Definitions.h"
#import "HLPhotographyViewController.h"
#import "HLPhotoViewerViewController.h"

@implementation AbelViewController

- (void)dealloc
{
    NSLog(@"*************** AbelViewController Dealloc ****************");
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self initView];
}

- (void)initView
{
    [[Global sharedInstance] app:self];
    background = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"background" ofType:@"png"]]];
    background.userInteractionEnabled = NO;
    [self.view addSubview:background];
    
    UIImage* logo = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"hanloon" ofType:@"png"]];
    logoImage = [[UIImageView alloc] initWithImage:logo];
    [logoImage setFrame:CGRectMake((FULL_WIDTH - logo.size.width) / 2, FULL_HEIGHT - logo.size.height - 80, logo.size.width, logo.size.height)];
    logoImage.userInteractionEnabled = NO;
    [self.view addSubview:logoImage];
    
    funcScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, FULL_WIDTH, FULL_HEIGHT)];
    funcScrollView.contentSize = CGSizeMake(FULL_WIDTH, FULL_HEIGHT);
    funcScrollView.pagingEnabled = YES;
    funcScrollView.showsHorizontalScrollIndicator = NO;
    funcScrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:funcScrollView];
    
    UIImage* cameraImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"camera" ofType:@"png"]];
    UIImage* photoImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"photo" ofType:@"png"]];

    float fontSize = 18.0;
    NSString* viewButtonStr = @"恒龙拍照系统";
    CGSize viewButtonLabelSize = [viewButtonStr sizeWithFont:[UIFont boldSystemFontOfSize:fontSize]];
    viewButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [viewButton setFrame:CGRectMake((FULL_WIDTH / 2 - cameraImage.size.width) / 2, (FULL_HEIGHT - cameraImage.size.height) / 2 - 100, cameraImage.size.width, cameraImage.size.height)];
    [viewButton setBackgroundImage:cameraImage forState:UIControlStateNormal];
    [viewButton setBackgroundImage:cameraImage forState:UIControlStateHighlighted];
    [viewButton setTitle:viewButtonStr forState:UIControlStateNormal];
    [viewButton setTitle:viewButtonStr forState:UIControlStateHighlighted];
    [viewButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [viewButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    viewButton.contentHorizontalAlignment = UIControlContentVerticalAlignmentBottom;
    viewButton.contentEdgeInsets = UIEdgeInsetsMake(cameraImage.size.height + 20, (cameraImage.size.width - viewButtonLabelSize.width) / 2, -20, (cameraImage.size.width - viewButtonLabelSize.width) / 2);
    [viewButton.titleLabel setFont:[UIFont boldSystemFontOfSize:fontSize]];
    [viewButton addTarget:self action:@selector(viewButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [funcScrollView addSubview:viewButton];
    
    NSString* photoButtonStr = @"恒龙图片浏览系统";
    CGSize photoButtonLabelSize = [photoButtonStr sizeWithFont:[UIFont boldSystemFontOfSize:fontSize]];
    photoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [photoButton setFrame:CGRectMake((FULL_WIDTH / 2 - photoImage.size.width) / 2 + FULL_WIDTH / 2, (FULL_HEIGHT - photoImage.size.height) / 2 - 100, photoImage.size.width, photoImage.size.height)];
    [photoButton setTitle:photoButtonStr forState:UIControlStateNormal];
    [photoButton setTitle:photoButtonStr forState:UIControlStateNormal];
    [photoButton setTitle:photoButtonStr forState:UIControlStateHighlighted];
    [photoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [photoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [photoButton setBackgroundImage:photoImage forState:UIControlStateNormal];
    [photoButton setBackgroundImage:photoImage forState:UIControlStateHighlighted];
    photoButton.contentHorizontalAlignment = UIControlContentVerticalAlignmentBottom;
    photoButton.contentEdgeInsets = UIEdgeInsetsMake(photoImage.size.height + 20, (photoImage.size.width - photoButtonLabelSize.width) / 2, -20, (photoImage.size.width - photoButtonLabelSize.width) / 2);
    [photoButton.titleLabel setFont:[UIFont boldSystemFontOfSize:fontSize]];
    [photoButton addTarget:self action:@selector(photoButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [funcScrollView addSubview:photoButton];
}

- (void)backToMain
{
    if (photoViewerViewController != nil) {
        [photoViewerViewController.view removeFromSuperview];
        [photoViewerViewController release];
        photoViewerViewController = nil;
    }
    
    if (photographyViewController != nil) {
        [photographyViewController.view removeFromSuperview];
        [photographyViewController release];
        photographyViewController = nil;
    }
    [self enabledAll];
}

//进入拍照系统
- (void)viewButtonPressed:(id)sender
{
    [self disabledAll];
    if (photographyViewController == nil) {
        photographyViewController = [[HLPhotographyViewController alloc] init];
        photographyViewController.view.backgroundColor = [UIColor blackColor];
        [photographyViewController.view setFrame:CGRectMake(FULL_WIDTH, 0, FULL_WIDTH, FULL_HEIGHT)];
        //photographyViewController.view.transform = CGAffineTransformRotate(photographyViewController.view.transform, -M_PI / 2);
    }
    [self.view addSubview:photographyViewController.view];
}

//进入图片浏览系统
- (void)photoButtonPressed:(id)sender
{
    [self disabledAll];
    if (photoViewerViewController == nil) {
        photoViewerViewController = [[HLPhotoViewerViewController alloc] init];
        photoViewerViewController.view.backgroundColor = [UIColor blackColor];
        [photoViewerViewController.view setFrame:CGRectMake(0, 0, FULL_WIDTH, FULL_HEIGHT)];
    }
    [self.view addSubview:photoViewerViewController.view];
}

- (void)disabledAll
{
    viewButton.userInteractionEnabled = NO;
    photoButton.userInteractionEnabled = NO;
    funcScrollView.userInteractionEnabled = NO;
}

- (void)enabledAll
{
    viewButton.userInteractionEnabled = YES;
    photoButton.userInteractionEnabled = YES;
    funcScrollView.userInteractionEnabled = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

@end
