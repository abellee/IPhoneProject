//
//  NetWork.m
//  MovingTribal
//
//  Created by Lee Abel on 9/25/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "NetWork.h"

@implementation NetWork

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+ (BOOL)sendText:(NSString *)text targetUser:(UserData *)userData
{
	NSString* urlString = [NSString stringWithFormat:@"/push.php?text=%@", text];
	NSURL *url = [[NSURL alloc] initWithScheme:@"http" host:[Globals root] path:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	NSString* str = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    [url release];
    [request release];
	if(str == @"YES"){
		[str release];
		return YES;
	}else{
		[str release];
		return NO;
	}
}

@end
