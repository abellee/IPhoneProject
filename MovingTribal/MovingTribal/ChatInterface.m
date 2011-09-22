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
@synthesize userData;

- (void)dealloc
{
    NSLog(@"******| Chat Interface |****** receive dealloc message!");
//    [topBackground release];
//    [bottomBackground release];
//    [chatInput release];
//    [scrollView release];
    [userData release];
    delegate = nil;
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if(self){
        
    }
    return self;
}

- (UserData *)userData
{
    return userData;
}

- (void)userData:(UserData *)ud
{
    if(userData != ud){
        [userData release];
        userData = [ud retain];
    }
}

- (void)initInterface
{
	self.navigationItem.title = userData.username;
    CGRect scrollViewRect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 84);
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:scrollViewRect];
    [self.view addSubview:scrollView];
    
    CGRect bottomRect = CGRectMake(0, scrollViewRect.origin.y + scrollViewRect.size.height, self.view.frame.size.width, 84);
    UIView* bottomBackground = [[UIView alloc] initWithFrame:bottomRect];
    bottomBackground.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bottomBackground];
    
    [scrollView release];
    [bottomBackground release];
}

- (void)buttonPressed:(id)sender
{
    UIView* view = (UIView *)sender;
    switch (view.tag) {
        case 0:
            if(delegate != nil && [delegate conformsToProtocol:@protocol(InterfaceDelegate)]) [delegate exitChatInterface];
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
