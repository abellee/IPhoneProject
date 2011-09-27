//
//  ChatInterface.m
//  MovingTribal
//
//  Created by Lee Abel on 9/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "ChatInterface.h"
#import "TouchableUIScrollView.h"

@implementation ChatInterface

@synthesize delegate;

//@synthesize topBackground;
//@synthesize bottomBackground;
//@synthesize chatInput;
//@synthesize scrollView;
@synthesize userData;
@synthesize chatInput;
@synthesize chatCategory;

- (void)dealloc
{
    NSLog(@"******| Chat Interface |****** receive dealloc message!");
//    [topBackground release];
//    [bottomBackground release];
//    [chatInput release];
//    [scrollView release];
	[chatInput release];
    [userData release];
	[chatCategory release];
    delegate = nil;
    [super dealloc];
	userData = nil;
	chatInput = nil;
	chatCategory = nil;
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
	self.navigationItem.title = userData.nickname;
    CGRect scrollViewRect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 84);
    TouchableUIScrollView* scrollView = [[TouchableUIScrollView alloc] initWithFrame:scrollViewRect];
	scrollView.backgroundColor = [UIColor redColor];
	scrollView.userInteractionEnabled = YES;
    [self.view addSubview:scrollView];
    
    CGRect bottomRect = CGRectMake(0, scrollViewRect.origin.y + scrollViewRect.size.height, self.view.frame.size.width, 84);
    UIView* bottomBackground = [[UIView alloc] initWithFrame:bottomRect];
    bottomBackground.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bottomBackground];
	
	chatInput = [[ChatInput alloc] init];
	chatInput.delegate = self;
	CGFloat posY = bottomRect.origin.y + (bottomRect.size.height - 50) / 2;
	CGRect chatInputRect = CGRectMake(0, posY, self.view.frame.size.width, 50.0);
	UIView* view = [[UIView alloc] initWithFrame:chatInputRect];
	[chatInput setView:view];
	[view release];
	[self.view addSubview:chatInput.view];
	
	chatCategory = [[ChatCategory alloc] init];
	chatCategory.delegate = self;
	[chatCategory.view setFrame:CGRectMake(10, posY - 40, 250, 40)];
    
    [scrollView release];
    [bottomBackground release];
}

//- (void)buttonPressed:(id)sender
//{
//    UIView* view = (UIView *)sender;
//    switch (view.tag) {
//        case 0:
//            if(delegate != nil && [delegate conformsToProtocol:@protocol(InterfaceDelegate)]) [delegate exitChatInterface];
//            break;
//            
//        default:
//            break;
//    }
//}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch* touch = [touches anyObject];
	if([touch.view isKindOfClass:[TouchableUIScrollView class]]) [chatInput resign];
	[super touchesBegan:touches withEvent:event];
}

- (void)showChatCategory
{
	if([chatCategory.view superview]) [chatCategory.view removeFromSuperview];
	else [self.view addSubview:chatCategory.view];
}

- (void)determineCategory:(NSUInteger)tag
{
	[self showChatCategory];
	switch (tag) {
		case kRecorder:
			[chatInput hideText];
			[chatInput showRecorder];
			break;
		case kTextInput:
			[chatInput hideRecorder];
			[chatInput showText];
			break;
		case kPhoto:
			[self performSelector:@selector(showActionSheet)];
			break;
		default:
			break;
	}
}

- (void)showActionSheet
{
	UIActionSheet* actionSheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"从相册选择", nil];
	[actionSheet showInView:self.view];
	[actionSheet release];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	if(buttonIndex == [actionSheet firstOtherButtonIndex]){
		[self performSelector:@selector(pickCamera)];
	}else if(buttonIndex == [actionSheet cancelButtonIndex]){
		[actionSheet dismissWithClickedButtonIndex:buttonIndex animated:YES];
	}else{
		[self performSelector:@selector(pickPhoto)];
	}
}

- (void)pickCamera
{
	if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
		UIImagePickerController* picker = [[UIImagePickerController alloc] init];
		picker.delegate = self;
		picker.sourceType = UIImagePickerControllerSourceTypeCamera;
		[self presentModalViewController:picker animated:YES];
		[picker release];
	}else{
		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:@"您的设备不支持拍照功能!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
		[alert show];
		[alert release];
	}
}

- (void)pickPhoto
{
	if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
		UIImagePickerController* picker = [[UIImagePickerController alloc] init];
		picker.delegate = self;
		picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
		[self presentModalViewController:picker animated:YES];
		[picker release];
	}else{
		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:@"您的设备不支持照片库功能!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
		[alert show];
		[alert release];
	}
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
//	UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
	[picker dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	[picker dismissModalViewControllerAnimated:YES];
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
