//
//  AvatarCell.m
//  YiZu
//
//  Created by Lee Abel on 12-10-15.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "AvatarCell.h"

@implementation AvatarCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImage* headImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"qq" ofType:@"png"]];
        head = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, 100, 100)];
        [head setBackgroundImage:headImg forState:UIControlStateNormal];
        [head addTarget:self action:@selector(showChooser:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:head];
        
        takePhoto = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [takePhoto setTitle:@"马上拍一张!" forState:UIControlStateNormal];
        [takePhoto setFrame:CGRectMake(140, 0, 150, 40)];
        [self addSubview:takePhoto];
        
        album = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [album setTitle:@"选择相册照片" forState:UIControlStateNormal];
        [album setFrame:CGRectMake(140, 50, 150, 40)];
        [self addSubview:album];
    }
    return self;
}

-(void)showChooser:(id)sender
{
    NSLog(@"aaa");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self setSelected:NO animated:NO];
    //	[super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self setSelected:NO animated:YES];
    //	[super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self setSelected:NO animated:YES];
    //	[super touchesCancelled:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self setSelected:NO animated:YES];
    //	[super touchesMoved:touches withEvent:event];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)dealloc
{
    NSLog(@"***********| AvatarCell dealloc! |***********");
    [head release];
    [takePhoto release];
    [album release];
    
    head = nil;
    takePhoto = nil;
    album = nil;
    
    [super dealloc];
}

@end
