//
//  ChatInterface.m
//  MovingTribal
//
//  Created by Lee Abel on 9/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "ChatInterface.h"

@implementation ChatInterface

@synthesize delegate;

//@synthesize topBackground;
//@synthesize bottomBackground;
//@synthesize chatInput;
//@synthesize scrollView;
//@synthesize returnBtn;
@synthesize nameLabel;

- (void)dealloc
{
    NSLog(@"chat interface dealloc");
//    [topBackground release];
//    [bottomBackground release];
//    [chatInput release];
//    [scrollView release];
    [nameLabel release];
    delegate = nil;
    [super dealloc];
}

- (void)setView:(UIView *)view
{
    [super setView:view];
    [self performSelector:@selector(initInterface)];
}

- (void)initInterface
{
    CGRect rect = CGRectMake(0, 0, 320, 30);
    UIView* topBackground = [[UIView alloc] initWithFrame:rect];
    topBackground.backgroundColor = [UIColor grayColor];
    [self.view addSubview:topBackground];
    
    CGRect scrollViewRect = CGRectMake(0, rect.size.height, 320, 350);
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:scrollViewRect];
    [self.view addSubview:scrollView];
    
    CGRect bottomRect = CGRectMake(0, scrollViewRect.origin.y + scrollViewRect.size.height, 320, 40);
    UIView* bottomBackground = [[UIView alloc] initWithFrame:bottomRect];
    bottomBackground.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bottomBackground];
    
    CGRect nameLabelRect = CGRectMake(55, 5, 215, 20);
    nameLabel = [[UILabel alloc] initWithFrame:nameLabelRect];
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.textAlignment = UITextAlignmentCenter;
    nameLabel.text = @"用户名";
    [self.view addSubview:nameLabel];
    
    CGRect returnBtnRect = CGRectMake(5, 5, 45, 20);
    UIButton* returnButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [returnButton setFrame:returnBtnRect];
    [returnButton setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:returnButton];
    
    [topBackground release];
    [scrollView release];
    [bottomBackground release];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
