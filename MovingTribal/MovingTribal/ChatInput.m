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

- (id)init
{
	self = [super init];
	if(self){
		
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
	[recordButton release];
	[emotionsButton release];
	[functionButton release];
	delegate = nil;
	[super dealloc];
//	textInput = nil;
//	emotionsButton = nil;
//	functionButton = nil;
}

- (void)initInterface
{
	functionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	functionButton.tag = kFunction;
	[functionButton setTitle:@"F" forState:UIControlStateNormal];
	[functionButton setFrame:CGRectMake(5, 5, 40, 40)];
	[functionButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	
	textInput = [[UITextField alloc] initWithFrame:CGRectMake(50, 5, 215, 40)];
	textInput.delegate = self;
	textInput.borderStyle = UITextBorderStyleRoundedRect;
	textInput.returnKeyType = UIReturnKeySend;
	textInput.keyboardAppearance = UIKeyboardAppearanceAlert;
	textInput.autocorrectionType = UITextAutocorrectionTypeNo;
	textInput.keyboardType = UIKeyboardTypeDefault;
	
	emotionsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	emotionsButton.tag = kEmotion;
	[emotionsButton setTitle:@"E" forState:UIControlStateNormal];
	[emotionsButton setFrame:CGRectMake(270, 5, 40, 40)];
	
	recordButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	recordButton.tag = kRecorder;
	[recordButton setTitle:@"按住 说话" forState:UIControlStateNormal];
	[recordButton setFrame:CGRectMake(50, 5, 255, 40)];
	
	[self.view addSubview:functionButton];
	[self.view addSubview:textInput];
	[self.view addSubview:emotionsButton];
	[self.view addSubview:recordButton];
	[recordButton setHidden:YES];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	if(textField.text != @""){
		[NetWork sendText:textField.text targetUser:nil];
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

- (void)keyboardWillShow:(NSNotification *) notification
{
	NSDictionary* info = [notification userInfo];
	NSValue* value = [info objectForKey:UIKeyboardAnimationDurationUserInfoKey];
	NSTimeInterval animationInterval;
	[value getValue:&animationInterval];
	
	NSValue* sizeValue = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
	CGRect keyboardRect = [sizeValue CGRectValue];
	CGFloat height = keyboardRect.size.height;
	
	CGRect chatInputRect = self.view.frame;
	[self.view setFrame:CGRectMake(0, chatInputRect.origin.y - height, self.view.frame.size.width, chatInputRect.size.height)];
	CATransition* animation = [CATransition animation];
	[animation setDuration:animationInterval];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionReveal;
    animation.subtype = kCATransitionFromBottom;
    animation.delegate = self;
    [self.view.layer addAnimation:animation forKey:nil];
}

- (void)keyboardWillHide:(NSNotification *) notification
{
	NSDictionary* info = [notification userInfo];
	NSValue* value = [info objectForKey:UIKeyboardAnimationDurationUserInfoKey];
	NSTimeInterval animationInterval;
	[value getValue:&animationInterval];
	
	NSValue* sizeValue = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
	CGRect keyboardRect = [sizeValue CGRectValue];
	CGFloat height = keyboardRect.size.height;
	
	CGRect chatInputRect = self.view.frame;
	[self.view setFrame:CGRectMake(0, chatInputRect.origin.y + height, self.view.frame.size.width, chatInputRect.size.height)];
	CATransition* animation = [CATransition animation];
	[animation setDuration:animationInterval];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionReveal;
    animation.subtype = kCATransitionFromBottom;
    animation.delegate = self;
    [self.view.layer addAnimation:animation forKey:nil];
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
