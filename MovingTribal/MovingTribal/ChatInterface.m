//
//  ChatInterface.m
//  MovingTribal
//
//  Created by Lee Abel on 9/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//
//  ios5 如果中文输入法 键盘上方会有一个白条 高度不同

#import "ChatInterface.h"

@implementation ChatInterface

@synthesize delegate;

//@synthesize topBackground;
//@synthesize bottomBackground;
//@synthesize chatInput;
@synthesize scrollView;
@synthesize userData;
@synthesize chatInput;
@synthesize chatCategory;
@synthesize emotionView;
@synthesize dir;
@synthesize keyboardHeight;
@synthesize isEmotion;
@synthesize chatInputPosY;
@synthesize entryList;

- (void)dealloc
{
    NSLog(@"******| Chat Interface |****** receive dealloc message!");
//    [topBackground release];
//    [bottomBackground release];
//    [chatInput release];
    [scrollView release];
	[chatInput release];
    [userData release];
	[emotionView release];
	[chatCategory release];
	[entryList removeAllObjects];
	[entryList release];
	entryList = nil;
    delegate = nil;
	emotionView = nil;
	userData = nil;
	chatInput = nil;
	chatCategory = nil;
	scrollView = nil;
	dir = nil;
	[[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:NEW_MESSAGE object:nil];
    [super dealloc];
}

- (id)initWithUserData:(UserData *)data frame:(CGRect)frame
{
	self = [super init];
	if(self){
		[self.view setFrame:frame];
		userData = [data retain];
		entryList = [[NSMutableArray arrayWithCapacity:10] retain];
		[self performSelector:@selector(initInterface)];
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
	isEmotion = NO;
	self.navigationItem.title = userData.nickname;
    CGRect scrollViewRect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 84);
    scrollView = [[TouchableUIScrollView alloc] initWithFrame:scrollViewRect];
//	scrollView.backgroundColor = [UIColor redColor];
	scrollView.userInteractionEnabled = YES;
    [self.view addSubview:scrollView];
    
    CGRect bottomRect = CGRectMake(0, scrollViewRect.origin.y + scrollViewRect.size.height, self.view.frame.size.width, 84);
    UIView* bottomBackground = [[UIView alloc] initWithFrame:bottomRect];
    bottomBackground.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bottomBackground];
	
	chatInput = [[ChatInput alloc] initWithUserData:userData];
	chatInput.delegate = self;
	chatInputPosY = bottomRect.origin.y + (bottomRect.size.height - 50) / 2;
	CGRect chatInputRect = CGRectMake(0, chatInputPosY, self.view.frame.size.width, 50.0);
	UIView* view = [[UIView alloc] initWithFrame:chatInputRect];
	[chatInput setView:view];
	[view release];
	[self.view addSubview:chatInput.view];
	
	chatCategory = [[ChatCategory alloc] init];
	chatCategory.delegate = self;
	[chatCategory.view setFrame:CGRectMake(10, chatInputPosY - 40, 250, 40)];
    
    [bottomBackground release];
	
	emotionView = [[EmotionsView alloc] init];
	UIView* emoView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 216)];
	emotionView.delegate = self;
	[emotionView setView:emoView];
	[emoView release];
	emoView = nil;
	[self.view addSubview:emotionView.view];
	[emotionView.view setHidden:YES];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newMessage:) name:NEW_MESSAGE object:nil];
}

- (void)showEmotionView
{
	if(isEmotion){
		[chatInput sign];
		return;
	}
	isEmotion = YES;
	[emotionView.view setHidden:NO];
	[chatInput resign];
	
	keyboardHeight = emotionView.view.frame.size.height;
	
	CGRect frame = chatInput.view.frame;
	if(frame.origin.y > emotionView.view.frame.size.height){
		[self chatInputMoveUp:0.3];
	}
	[self emotionViewMoveUp:0.3];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
	CAAnimation* emoAnime = [emotionView.view.layer animationForKey:@"EmotionAnimation"];
	CAAnimation* inputAnime = [chatInput.view.layer animationForKey:@"ChatInputAnimation"];
	CGRect emoFrame = emotionView.view.frame;
	if(isEmotion){
		if(anim == inputAnime) [self performSelector:@selector(animationStop)];
		if(anim == emoAnime){
			emoFrame.origin.y -= emoFrame.size.height;
			[emotionView.view setFrame:emoFrame];
			[emotionView.view.layer removeAllAnimations];
		}
		return;
	}
	if(anim == inputAnime) [self performSelector:@selector(animationStop)];
	if(anim == emoAnime && !emotionView.view.isHidden){
		emoFrame.origin.y = self.view.frame.size.height;
		[emotionView.view setFrame:emoFrame];
		[emotionView.view setHidden:YES];
		[emotionView.view.layer removeAllAnimations];
	}
}

- (void)animationStop
{
	CGRect frame = chatInput.view.frame;
	CGRect scrollViewFrame = scrollView.frame;
	if(dir == @"up"){
		frame.origin.y = self.view.frame.size.height - keyboardHeight - frame.size.height;
		scrollViewFrame.size.height = self.view.frame.size.height - keyboardHeight - frame.size.height;
	}else if(dir == @"down"){
		frame.origin.y = chatInputPosY;
		scrollViewFrame.size.height = self.view.frame.size.height - 84;
	}
	[chatInput.view setFrame:frame];
	[chatInput.view.layer removeAllAnimations];
	[scrollView setFrame:scrollViewFrame];
}

- (void)newMessage:(NSNotification *) notification
{
	MessageInfo* messageInfo = (MessageInfo *)[notification object];
	if(messageInfo){
		[self performSelector:@selector(addMessage:) withObject:messageInfo];
	}
}

- (void)keyboardWillShow:(NSNotification *) notification
{
	if([chatCategory.view superview]){
		[chatCategory.view removeFromSuperview];
	}
	NSDictionary* info = [notification userInfo];
	NSValue* value = [info objectForKey:UIKeyboardAnimationDurationUserInfoKey];
	NSTimeInterval animationInterval;
	[value getValue:&animationInterval];
	if(isEmotion){
		[self emotionViewMoveDown:animationInterval];
		return;
	}
	
	NSValue* sizeValue = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
	CGRect keyboardRect = [sizeValue CGRectValue];
	keyboardHeight = keyboardRect.size.height;
	
	[self chatInputMoveUp:animationInterval];
}

- (void)keyboardWillHide:(NSNotification *) notification
{
	if([chatCategory.view superview]){
		[chatCategory.view removeFromSuperview];
	}
	
	NSDictionary* info = [notification userInfo];
	NSValue* value = [info objectForKey:UIKeyboardAnimationDurationUserInfoKey];
	NSTimeInterval animationInterval;
	[value getValue:&animationInterval];
	
	if(isEmotion){
		if([emotionView.view isHidden]){
			[self emotionViewMoveDown:animationInterval];
		}
		return;
	}
	
	NSValue* sizeValue = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
	CGRect keyboardRect = [sizeValue CGRectValue];
	keyboardHeight = keyboardRect.size.height;
	
	[self chatInputMoveDown:animationInterval];
}

- (void)emotionViewMoveUp:(NSTimeInterval)animationInterval
{
	CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
	animation.removedOnCompletion = NO;
	animation.autoreverses = NO;
	animation.delegate = self;
	animation.fillMode = kCAFillModeForwards;
	animation.fromValue = [NSNumber numberWithInt:0];
	animation.toValue = [NSNumber numberWithInt:-emotionView.view.frame.size.height];
	[animation setDuration:animationInterval];
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	[emotionView.view.layer addAnimation:animation forKey:@"EmotionAnimation"];
}

- (void)emotionViewMoveDown:(NSTimeInterval)animationInterval
{
	isEmotion = NO;
	CABasicAnimation* emotionAnime = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
	emotionAnime.removedOnCompletion = NO;
	emotionAnime.autoreverses = NO;
	emotionAnime.delegate = self;
	emotionAnime.fillMode = kCAFillModeForwards;
	emotionAnime.fromValue = [NSNumber numberWithInt:0];
	emotionAnime.toValue = [NSNumber numberWithInt:emotionView.view.frame.size.height];
	[emotionAnime setDuration:animationInterval];
	emotionAnime.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	[emotionView.view.layer addAnimation:emotionAnime forKey:@"EmotionAnimation"];
}

- (void)chatInputMoveUp:(NSTimeInterval)animationInterval
{
	dir = @"up";
	CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
	animation.removedOnCompletion = NO;
	animation.autoreverses = NO;
	animation.delegate = self;
	animation.fillMode = kCAFillModeForwards;
	animation.fromValue = [NSNumber numberWithInt:0];
	animation.toValue = [NSNumber numberWithInt:-keyboardHeight];
	[animation setDuration:animationInterval];
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	[chatInput.view.layer addAnimation:animation forKey:@"ChatInputAnimation"];
}

- (void)chatInputMoveDown:(NSTimeInterval)animationInterval
{
	dir = @"down";
	CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
	animation.removedOnCompletion = NO;
	animation.autoreverses = NO;
	animation.delegate = self;
	animation.fillMode = kCAFillModeForwards;
	animation.fromValue = [NSNumber numberWithInt:0];
	animation.toValue = [NSNumber numberWithInt:keyboardHeight];
	[animation setDuration:animationInterval];
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	[chatInput.view.layer addAnimation:animation forKey:@"ChatInputAnimation"];
}

- (void)emotionInput:(NSString *)emotionStr
{
	[chatInput sign];
	chatInput.textInput.text = [NSString stringWithFormat:@"%@%@", chatInput.textInput.text, emotionStr];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch* touch = [touches anyObject];
	NSLog(@"%@", [touch.view class]);
	if([touch.view isKindOfClass:[TouchableUIScrollView class]]){
		if(isEmotion){
			[self emotionViewMoveDown:0.3];
			[self chatInputMoveDown:0.3];
		}else{
			[chatInput resign];
		}
	}
	[super touchesBegan:touches withEvent:event];
}

- (void)sendText:(NSString *)str
{
	CGRect constainedRect = CGRectMake(0, 0, scrollView.frame.size.width - 100, 500);
	UIView* view = [[UIView alloc] initWithFrame:constainedRect];
	view.backgroundColor = [UIColor grayColor];
	TextEntry* entry = [[TextEntry alloc] initWithCustomBackground:view text:str userData:[Globals getUserData] constrainedSize:constainedRect];
	[view release];
	CGRect entryFrame = CGRectMake(scrollView.frame.size.width - entry.entrySize.width - 10, 10, entry.entrySize.width, entry.entrySize.height);
	UIViewController* tempView = [entryList count] > 0 ? [entryList objectAtIndex:[entryList count] - 1] : nil;
	if(tempView){
		NSLog(@"tempview frame:%@", NSStringFromCGRect(tempView.view.frame));
		entryFrame.origin.y += tempView.view.frame.origin.y + tempView.view.frame.size.height;
	}
	NSLog(@"%@", NSStringFromCGRect(entryFrame));
	[entry.view setFrame:entryFrame];
	[scrollView addSubview:entry.view];
	UIView* lastView = [scrollView.subviews objectAtIndex:[scrollView.subviews count] - 1];
	CGFloat totalHeight = lastView.frame.origin.y + lastView.frame.size.height;
	[scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, totalHeight)];
	[entryList addObject:entry];
	[entry release];
	System* system = [Globals getMainSystem];
	[system playSystemSound:SentMessage];
}

- (void)addMessage:(MessageInfo *)messageInfo
{
	SEL selector;
	if(messageInfo.type == TextMessage){
		NSLog(@"%@>>>>>>%d", messageInfo.text, messageInfo.from.uid);
		selector = @selector(addTextMessageWithMessageInfo:);
	}else if(messageInfo.type == TaskMessage){
		selector = @selector(addTaskMessageWithMessageInfo:);
	}
	[self performSelector:selector withObject:messageInfo];
	[[Globals getMainSystem] playSystemSound:ReceivedMessage];
}

- (void)addTextMessageWithMessageInfo:(MessageInfo *)messageInfo
{
	NSString* str = messageInfo.text;
	UserData* ud = messageInfo.from;
	CGRect constainedRect = CGRectMake(0, 0, scrollView.frame.size.width - 100, 500);
	UIView* view = [[UIView alloc] initWithFrame:constainedRect];
	view.backgroundColor = [UIColor grayColor];
	TextEntry* entry = [[TextEntry alloc] initWithCustomBackground:view text:str userData:ud constrainedSize:constainedRect];
	[view release];
	CGRect entryFrame = CGRectMake(10, 10, entry.entrySize.width, entry.entrySize.height);
	UIViewController* tempView = [entryList count] > 0 ? [entryList objectAtIndex:[entryList count] - 1] : nil;
	if(tempView){
		NSLog(@"tempView frame add:%@", NSStringFromCGRect(tempView.view.frame));
		entryFrame.origin.y += tempView.view.frame.origin.y + tempView.view.frame.size.height;
	}
	NSLog(@"add:%@", NSStringFromCGRect(entryFrame));
	[entry.view setFrame:entryFrame];
	[scrollView addSubview:entry.view];
	UIView* lastView = [scrollView.subviews objectAtIndex:[scrollView.subviews count] - 1];
	CGFloat totalHeight = lastView.frame.origin.y + lastView.frame.size.height;
	[scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, totalHeight)];
	[entryList addObject:entry];
	[entry release];
}

- (void)addTaskMessageWithMessageInfo:(MessageInfo *)messageInfo
{
	TaskMessageInfo* taskMessageInfo = (TaskMessageInfo *)messageInfo;
	UserData* ud = taskMessageInfo.from;
	CGRect constainedRect = CGRectMake(0, 0, scrollView.frame.size.width - 100, 500);
	UIView* view = [[UIView alloc] initWithFrame:constainedRect];
	view.backgroundColor = [UIColor grayColor];
	TaskEntry* entry = [[TaskEntry alloc] initWithCustomBackground:view taskData:taskMessageInfo.taskData userData:ud constrainedSize:constainedRect];
	entry.delegate = self;
	[view release];
	CGRect entryFrame = CGRectMake(10, 10, entry.entrySize.width, entry.entrySize.height);
	UIViewController* tempView = [entryList count] > 0 ? [entryList objectAtIndex:[entryList count] - 1] : nil;
	if(tempView){
		NSLog(@"tempView frame task:%@", NSStringFromCGRect(tempView.view.frame));
		entryFrame.origin.y += tempView.view.frame.origin.y + tempView.view.frame.size.height;
	}
	NSLog(@"task:%@", NSStringFromCGRect(entryFrame));
	[entry.view setFrame:entryFrame];
	[scrollView addSubview:entry.view];
	UIView* lastView = [scrollView.subviews objectAtIndex:[scrollView.subviews count] - 1];
	CGFloat totalHeight = lastView.frame.origin.y + lastView.frame.size.height;
	[scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, totalHeight)];
	[entryList addObject:entry];
	[entry release];
}

- (void)showTaskDetailByTask:(Task *)task ud:(UserData *)data
{
	if(delegate && [delegate conformsToProtocol:@protocol(InterfaceDelegate)]){
		[delegate showTaskDetailWithTaskData:task withUserData:data];
	}
}

- (void)showChatCategory
{
	if([chatCategory.view superview]){
		[chatCategory.view removeFromSuperview];
	}else{
		CGRect frame = chatInput.view.frame;
		[chatCategory.view setFrame:CGRectMake(10, frame.origin.y - 40, 250, 40)];
		[self.view addSubview:chatCategory.view];
	}
}

- (void)determineCategory:(NSUInteger)tag
{
	[self showChatCategory];
	switch (tag) {
		case kRecorder:
			[chatInput resign];
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
