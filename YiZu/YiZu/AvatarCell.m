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
        NSLog(@"hello");
    }
    return self;
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
