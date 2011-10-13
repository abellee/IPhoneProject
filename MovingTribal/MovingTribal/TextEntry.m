//
//  TextEntry.m
//  MovingTribal
//
//  Created by Lee Abel on 9/30/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "TextEntry.h"

@implementation TextEntry

@synthesize label;
@synthesize background;
@synthesize avatar;
@synthesize data;
@synthesize belong;
@synthesize entrySize;

- (id)initWithCustomBackground:(UIView *)view text:(NSString *)str userData:(UserData *)ud constrainedSize:(CGRect)rect
{
	self = [super init];
	if(self){
		data = [ud retain];
		CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:[UIFont systemFontSize]] constrainedToSize:rect.size lineBreakMode:UILineBreakModeWordWrap];
		background = [view retain];
		
		avatar = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"32" ofType:@"png"]]];
		
		CGFloat avatarPosX = 0;
		CGFloat contentPosX = 0;
		if(data.uid == [Globals getUserData].uid){        // self
			belong = Self;
			avatarPosX = size.width + 20;
		}else{                                            // others
			belong = Others;
			contentPosX = 42;                             // 头像暂定为32 + 10
		}
		
		[background setFrame:CGRectMake(contentPosX, 0, size.width + 10, size.height + 10)];
		[self.view addSubview:background];
		
		[avatar setFrame:CGRectMake(avatarPosX, 0, avatar.frame.size.width, avatar.frame.size.height)];
		[self.view addSubview:avatar];
		
		label = [[UILabel alloc] initWithFrame:CGRectMake(5 + contentPosX, 5, size.width, size.height)];
		label.text = str;
		label.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
		label.numberOfLines = 0;
		label.lineBreakMode = UILineBreakModeWordWrap;
		[self.view addSubview:label];
		
		entrySize = CGSizeMake(background.frame.size.width + avatar.frame.size.width + 10, background.frame.size.height);
	}
	return self;
}

- (void)dealloc
{
	NSLog(@"******| TextEntry |****** receive dealloc message!");
	[data release];
	[background release];
	[avatar release];
	[label release];
	data = nil;
	background = nil;
	label = nil;
	[super dealloc];
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
