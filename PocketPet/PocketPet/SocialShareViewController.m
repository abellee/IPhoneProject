//
//  SocialShareViewController.m
//  PocketPet
//
//  Created by Lee Abel on 13-1-17.
//
//

#import "SocialShareViewController.h"
#import "Global.h"
#import "Utils.h"

@implementation SocialShareViewController

- (id)initWithBackgroundImage:(UIImage *)image text:(NSString *)content
{
    if (self = [super init]) {
        alphaBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[Global sharedGlobal] totalWidth], [[Global sharedGlobal] totalHeight])];
        alphaBackground.backgroundColor = [UIColor blackColor];
        alphaBackground.alpha = 0.5;
        
        container = [[UIView alloc] initWithFrame:CGRectMake(([[Global sharedGlobal] totalWidth] - image.size.width) / 2, [[Global sharedGlobal] totalHeight], image.size.width, image.size.height)];
        
        backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        [backgroundImage setImage:image];
        
        [self.view addSubview:alphaBackground];
        [container addSubview:backgroundImage];
        shareContent = content;
        shareText = [[UITextView alloc] initWithFrame:CGRectMake(backgroundImage.frame.origin.x + 20, backgroundImage.frame.origin.y + 60, image.size.width - 35, image.size.height - 140)];
        shareText.backgroundColor = [UIColor clearColor];
        [shareText setText:shareContent];
        [container addSubview:shareText];
        
        float ypos = backgroundImage.frame.size.height - 50;
        
        enterButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [enterButton setFrame:CGRectMake(20, ypos, 80, 30)];
        [enterButton setTitle:@"分享" forState:UIControlStateNormal];
        [enterButton addTarget:self action:@selector(doShare:) forControlEvents:UIControlEventTouchUpInside];
        [container addSubview:enterButton];
        
        cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [cancelButton setFrame:CGRectMake(150, ypos, 80, 30)];
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [cancelButton addTarget:self action:@selector(cancelShare:) forControlEvents:UIControlEventTouchUpInside];
        [container addSubview:cancelButton];
        [self.view addSubview:container];
        
        [UIView beginAnimations:@"Curl" context:nil];
        [UIView setAnimationDuration:0.5];
        container.frame = CGRectMake(([[Global sharedGlobal] totalWidth] - image.size.width) / 2, ([[Global sharedGlobal] totalHeight] - image.size.height) / 2, image.size.width, image.size.height);
        [UIView commitAnimations];
    }
    return self;
}

- (void)doShare:(id)sender
{
    
}

- (void)cancelShare:(id)sender
{
    [UIView beginAnimations:@"Curl" context:nil];
    [UIView setAnimationDuration:0.5];
    container.frame = CGRectMake(([[Global sharedGlobal] totalWidth] - backgroundImage.frame.size.width) / 2, [[Global sharedGlobal] totalHeight], backgroundImage.frame.size.width, backgroundImage.frame.size.height);
    [UIView commitAnimations];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [shareText resignFirstResponder];
}

- (void)dealloc
{
    NSLog(@"***************| SocialShareViewController dealloc! |****************");
    
    [alphaBackground release];
    [backgroundImage release];
    [shareText release];
    [container release];
    
    [enterButton removeTarget:self action:@selector(doShare:) forControlEvents:UIControlEventTouchUpInside];
    [cancelButton removeTarget:self action:@selector(cancelShare:) forControlEvents:UIControlEventTouchUpInside];
    
    alphaBackground = nil;
    backgroundImage = nil;
    shareText = nil;
    container = nil;
    
    [super dealloc];
}

@end
