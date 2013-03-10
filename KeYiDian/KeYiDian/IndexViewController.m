//
//  IndexViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-9.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "IndexViewController.h"
#import "ShopTableViewController.h"
#import "UIImage+Extensions.h"

@interface IndexViewController ()

@end

@implementation IndexViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
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
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    shopTableViewController = [[ShopTableViewController alloc] init];
    [shopTableViewController.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64)];
    
    navigator = [[UINavigationController alloc] initWithRootViewController: shopTableViewController];
    [navigator.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    navigator.delegate = self;
    
    if ([UINavigationBar instancesRespondToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        [navigator.navigationBar setBackgroundImage:[UIImage getImageWithFileName:@"top"] forBarMetrics:UIBarMetricsDefault];
    }else{
        UIImageView* topBackground = [[UIImageView alloc] initWithImage:[UIImage getImageWithFileName:@"top"]];
        [navigator.navigationBar insertSubview:topBackground atIndex:1];
        [topBackground release];
    }
    
    UIButton* kydButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage* kydLogo = [UIImage getImageWithFileName:@"logo"];
    [kydButton setFrame:CGRectMake(0, 0, kydLogo.size.width, kydLogo.size.height)];
    [kydButton setImage:kydLogo forState:UIControlStateNormal];
    [kydButton setImage:kydLogo forState:UIControlStateHighlighted];
    kydButton.center = CGPointMake(navigator.navigationBar.frame.size.width / 2, navigator.navigationBar.frame.size.height / 2);
    [navigator.navigationBar addSubview:kydButton];
    [kydButton addTarget:self action:@selector(logoPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* profileButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [profileButton setFrame:CGRectMake(0, 0, 30, 30)];
    [profileButton setImage:[UIImage getImageWithFileName:@"geren0"] forState:UIControlStateNormal];
    [profileButton setImage:[UIImage getImageWithFileName:@"geren1"] forState:UIControlStateHighlighted];
    [navigator.navigationBar addSubview:profileButton];
    profileButton.center = CGPointMake(25, navigator.navigationBar.frame.size.height / 2);
    [profileButton addTarget:self action:@selector(profileButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [moreButton setFrame:CGRectMake(0, 0, 30, 30)];
    [moreButton setImage:[UIImage getImageWithFileName:@"geduo0"] forState:UIControlStateNormal];
    [moreButton setImage:[UIImage getImageWithFileName:@"geduo1"] forState:UIControlStateHighlighted];
    moreButton.center = CGPointMake(navigator.navigationBar.frame.size.width - 25, navigator.navigationBar.frame.size.height / 2);
    [navigator.navigationBar addSubview:moreButton];
    [moreButton addTarget:self action:@selector(moreButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:navigator.view];
}

- (void)profileButtonPressed:(id)sender
{
    [self panRightAuto:YES];
    if (delegate && [delegate respondsToSelector:@selector(autoPanWithData:)]) {
        [delegate autoPanWithData:@"left"];
    }
}

- (void)moreButtonPressed:(id)sender
{
    [self panLeftAuto:NO];
    if (delegate && [delegate respondsToSelector:@selector(autoPanWithData:)]) {
        [delegate autoPanWithData:@"right"];
    }
}

- (void)logoPressed:(id)sender
{
    [shopTableViewController scrollToTop];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
