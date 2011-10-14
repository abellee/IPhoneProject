//
//  LoginInterfaceController.m
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "LoginInterfaceController.h"

@implementation LoginInterfaceController

- (void)dealloc
{
	NSLog(@"******| LoginInterfaceController |****** received dealloc message!");
	[logo release];
	[username release];
	[password release];
	[forgetPassword release];
	[modeControl release];
	[loginButton removeTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[registButton removeTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	
	logo = nil;
	modeControl = nil;
	username = nil;
	password = nil;
	registButton = nil;
	loginButton = nil;
	forgetPassword = nil;
	[super dealloc];
}

- (id)init
{
	self = [super init];
	if(self){
		[self performSelector:@selector(initInterface)];
	}
	return self;
}

- (void)initInterface
{
	UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"png"]];
	logo = [[UIImageView alloc] initWithImage:image];
	CGFloat imageWidth = image.size.width;
	CGFloat imageHeight = image.size.height;
	CGFloat imageYPos = 10;
	CGFloat centerX = ([[Config instance] size].width - imageWidth) / 2;
	logo.frame = CGRectMake(centerX, imageYPos, imageWidth, imageHeight);
	[self.view addSubview:logo];
	
	CGFloat posX = 20;
	CGFloat textFieldHeight = 30;
	CGFloat gap = 10;
	CGFloat usernamePosY = imageHeight + imageYPos + gap;
	CGFloat width = [[Config instance] size].width - posX * 2;
	username = [[UITextField alloc] initWithFrame:CGRectMake(posX, usernamePosY, width, textFieldHeight)];
	username.borderStyle = UITextBorderStyleRoundedRect;
	username.placeholder = @"邮箱";
	username.returnKeyType = UIReturnKeyNext;
	username.autocorrectionType = UITextAutocorrectionTypeNo;
	username.keyboardType = UIKeyboardTypeEmailAddress;
	username.clearButtonMode = UITextFieldViewModeWhileEditing;
	username.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	username.delegate = self;
	username.text = [[DataCenter instance] player].account;
	[self.view addSubview:username];
	
	CGFloat passwordPosY = usernamePosY + textFieldHeight + gap;
	password = [[UITextField alloc] initWithFrame:CGRectMake(posX, passwordPosY, width, textFieldHeight)];
	password.borderStyle = UITextBorderStyleRoundedRect;
	password.placeholder = @"密码";
	password.returnKeyType = UIReturnKeyDone;
	password.autocorrectionType = UITextAutocorrectionTypeNo;
	password.keyboardType = UIKeyboardTypeEmailAddress;
	password.clearButtonMode = UITextFieldViewModeWhileEditing;
	password.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	password.secureTextEntry = YES;
	password.delegate = self;
	password.text = [[DataCenter instance] player].password;
	[self.view addSubview:password];
	
	CGFloat speedModePosY = passwordPosY + textFieldHeight + gap;
	
	modeControl = [[UISegmentedControl alloc] initWithFrame:CGRectMake(posX, speedModePosY, width, textFieldHeight)];
	[modeControl insertSegmentWithTitle:@"极速模式" atIndex:0 animated:NO];
	[modeControl insertSegmentWithTitle:@"体验模式" atIndex:1 animated:NO];
	[self.view addSubview:modeControl];
	
	int defaultMode = [[[Config instance] configValueForKey:kLoginMode] intValue];
	if(defaultMode)
		[modeControl setSelectedSegmentIndex:(defaultMode - 1)];
	else
		[modeControl setSelectedSegmentIndex:1];
	
	CGFloat labelPosY = speedModePosY + textFieldHeight;
	UIFont *fontStyle = [[UIFont alloc] fontWithSize:12.0];
	UILabel *speedModeLabel = [[UILabel alloc] initWithFrame:CGRectMake(posX, labelPosY, 135, 20)];
	speedModeLabel.text = @"更快的速度、更省的流量";
	speedModeLabel.textAlignment = UITextAlignmentCenter;
	speedModeLabel.font = fontStyle;
	speedModeLabel.alpha = 0.5;
	[self.view addSubview:speedModeLabel];
	
	UILabel *fullModeLabel = [[UILabel alloc] initWithFrame:CGRectMake(posX + 145, labelPosY, 135, 20)];
	fullModeLabel.text = @"尽情畅游移族世界";
	fullModeLabel.textAlignment = UITextAlignmentCenter;
	fullModeLabel.font = fontStyle;
	fullModeLabel.alpha = 0.5;
	[self.view addSubview:fullModeLabel];
	
	[speedModeLabel release];
	[fullModeLabel release];
	[fontStyle release];
	speedModeLabel = nil;
	fullModeLabel = nil;
	fontStyle = nil;
	
	CGFloat loginButtonPosX = labelPosY + gap + 20;
	loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[loginButton setFrame:CGRectMake(posX, loginButtonPosX, width, textFieldHeight)];
	[loginButton setTitle:@"进入移族世界" forState:UIControlStateNormal];
	[loginButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:loginButton];
	
	CGFloat registButtonPosX = loginButtonPosX + gap + textFieldHeight;
	registButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[registButton setFrame:CGRectMake(posX, registButtonPosX, width, textFieldHeight)];
	[registButton setTitle:@"成为移族" forState:UIControlStateNormal];
	[registButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:registButton];
	
	CGFloat forgetPasswordPosY = registButtonPosX + gap + textFieldHeight;
	forgetPassword = [[TouchableUILabel alloc] initWithFrame:CGRectMake(posX, forgetPasswordPosY, width, textFieldHeight)];
	forgetPassword.text = @"找回密码";
	forgetPassword.delegate = self;
	forgetPassword.textAlignment = UITextAlignmentCenter;
	[self.view addSubview:forgetPassword];
}

- (void)buttonPressed:(id)sender
{
	UIButton *button = (UIButton *)sender;
	if(button == registButton){
		if(delegate && [delegate conformsToProtocol:@protocol(InterfaceDelegate)])
			[delegate showRegistInterface];
	}else if(button == loginButton){
		//do login
	}
}

- (void)doLoginByLoginMode:(int)mode
{
	NSLog(@"%d", mode);
}

- (void)touchesBeganWithTouchableUILabel:(TouchableUILabel *)label
{
	NSLog(@"forget password label touched!");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[username resignFirstResponder];
	[password resignFirstResponder];
	[super touchesBegan:touches withEvent:event];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	if ([textField isEqual:username]) {
		[password becomeFirstResponder];
		return NO;
	}else if([textField isEqual:password]){
		//do login
		return YES;
	}
	return YES;
}

/*----------------------------------------------------------------------------*/

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
