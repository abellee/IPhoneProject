//
//  ChatInput.m
//  MovingTribal
//
//  Created by Lee Abel on 9/24/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "ChatInput.h"

@implementation ChatInput

@synthesize delegate;

@synthesize textInput;
@synthesize recordButton;
@synthesize emotionsButton;
@synthesize functionButton;
@synthesize userData;

- (id)initWithUserData:(UserData *)data
{
	self = [super init];
	if(self){
		userData = [data retain];
	}
	return self;
}

- (void)setView:(UIView *)view
{
	[super setView:view];
	[self performSelector:@selector(initInterface)];
}

- (void)dealloc
{
	NSLog(@"******| ChatInput |****** receive dealloc message!");
	[textInput release];
	delegate = nil;
	textInput = nil;
	emotionsButton = nil;
	functionButton = nil;
	[super dealloc];
}

- (void)initInterface
{
	functionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	functionButton.tag = kFunction;
	[functionButton setTitle:@"F" forState:UIControlStateNormal];
	[functionButton setFrame:CGRectMake(5, 5, 40, 40)];
	[functionButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	
	textInput = [[UITextField alloc] initWithFrame:CGRectMake(50, 5, 215, 30)];
	textInput.delegate = self;
	textInput.borderStyle = UITextBorderStyleRoundedRect;
	textInput.returnKeyType = UIReturnKeySend;
	textInput.autocorrectionType = UITextAutocorrectionTypeNo;
	textInput.keyboardType = UIKeyboardTypeDefault;

	emotionsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	emotionsButton.tag = kEmotion;
	[emotionsButton addTarget:self action:@selector(emotionButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[emotionsButton setTitle:@"E" forState:UIControlStateNormal];
	[emotionsButton setFrame:CGRectMake(270, 5, 40, 40)];
	
	recordButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	recordButton.tag = kRecorder;
	[recordButton setTitle:@"按住 说话" forState:UIControlStateNormal];
	[recordButton setTitle:@"松开 结束" forState:UIControlStateHighlighted];
	[recordButton setFrame:CGRectMake(50, 5, 255, 40)];
	
	[self.view addSubview:functionButton];
	[self.view addSubview:textInput];
	[self.view addSubview:emotionsButton];
	[self.view addSubview:recordButton];
	[recordButton setHidden:YES];
}

- (void)emotionButtonPressed:(id)sender
{
	if(delegate && [delegate conformsToProtocol:@protocol(ChatInputDelegate)]){
		[delegate showEmotionView];
	}
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	if(textField.text != @""){
		if(delegate && [delegate conformsToProtocol:@protocol(ChatInputDelegate)]){
			[delegate sendText:textField.text];
		}
		[NetWork sendText:textField.text targetUser:userData];
		textField.text = @"";
		return YES;
	}
	return NO;
}

- (void)buttonPressed:(id)sender
{
	UIView* view = (UIView *)sender;
	switch (view.tag) {
		case kFunction:
			if(delegate && [delegate conformsToProtocol:@protocol(ChatInputDelegate)]) [delegate showChatCategory];
			break;
		case kEmotion:
			// show emotions;
			break;
		default:
			break;
	}
	view = nil;
}

- (void)showText
{
	[textInput setHidden:NO];
	[emotionsButton setHidden:NO];
}

- (void)hideText
{
	[textInput setHidden:YES];
	[emotionsButton setHidden:YES];
}

- (void)showRecorder
{
	[recordButton setHidden:NO];
}

- (void)hideRecorder
{
	[recordButton setHidden:YES];
}

- (void)resign
{
	[textInput resignFirstResponder];
}

- (void)sign
{
	[textInput becomeFirstResponder];
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
