//
//  ChatCategory.m
//  MovingTribal
//
//  Created by Lee Abel on 9/24/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "ChatCategory.h"

@implementation ChatCategory

@synthesize delegate;
@synthesize voiceButton;
@synthesize textButton;
@synthesize imageButton;
@synthesize locationButton;
@synthesize videoButton;

- (id)init
{
	self = [super init];
	if(self){
		[self performSelector:@selector(initInterface)];
	}
	return self;
}

- (void)dealloc
{
	NSLog(@"******| ChatCategory |****** receive dealloc message!");
	delegate = nil;
	[voiceButton release];
	[textButton release];
	[imageButton release];
	[locationButton release];
	[videoButton release];
	[super dealloc];
}

- (void)initInterface
{
	CGSize buttonSize = CGSizeMake(40, 30);
	voiceButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	voiceButton.tag = kVoiceInput;
	[voiceButton setFrame:CGRectMake(5, 5, buttonSize.width, buttonSize.height)];
	[voiceButton setTitle:@"语音" forState:UIControlStateNormal];
	
	textButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	textButton.tag = kTextInput;
	[textButton setFrame:CGRectMake(50, 5, buttonSize.width, buttonSize.height)];
	[textButton setTitle:@"文字" forState:UIControlStateNormal];
	
	imageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	imageButton.tag = kPhoto;
	[imageButton setFrame:CGRectMake(95, 5, buttonSize.width, buttonSize.height)];
	[imageButton setTitle:@"照片" forState:UIControlStateNormal];
	
	videoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	videoButton.tag = kVideo;
	[videoButton setFrame:CGRectMake(140, 5, buttonSize.width, buttonSize.height)];
	[videoButton setTitle:@"视频" forState:UIControlStateNormal];
	
	locationButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	locationButton.tag = kLocation;
	[locationButton setFrame:CGRectMake(185, 5, buttonSize.width, buttonSize.height)];
	[locationButton setTitle:@"位置" forState:UIControlStateNormal];
	
	[voiceButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[textButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[imageButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[videoButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[locationButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	
	[self.view addSubview:voiceButton];
	[self.view addSubview:textButton];
	[self.view addSubview:imageButton];
	[self.view addSubview:videoButton];
	[self.view addSubview:locationButton];
}

- (void)buttonPressed:(id)sender
{
	UIView* view = (UIView *)sender;
	switch (view.tag) {
		case kVoiceInput:
		case kTextInput:
		case kPhoto:
			if(delegate && [delegate conformsToProtocol:@protocol(ChatCategoryDelegate)]) [delegate determineCategory:view.tag];
			break;
		case kVideo:
			// call out video recorder
			break;
		case kLocation:
			// locate me!
			break;
		default:
			break;
	}
	view = nil;
}

/*----------------------------------------------------------------------------*/

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
