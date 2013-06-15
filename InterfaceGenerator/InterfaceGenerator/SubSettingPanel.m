//
//  SubSettingPanel.m
//  InterfaceGenerator
//
//  Created by Lee Abel on 13-5-15.
//  Copyright (c) 2013年 YiZu. All rights reserved.
//

#import "SubSettingPanel.h"
#import "Global.h"
#import "PPAppDelegate.h"
#import "SubInfo.h"

@implementation SubSettingPanel

@synthesize resType, resIndex, pathTextField, rotationTextFieldInSub, flipHorInSub, flipVerInSub, view0, view1, previewImage;

- (void)awakeFromNib
{
    resTypeArray = [NSMutableArray arrayWithCapacity:0];
    NSDictionary* resDict0 = [NSDictionary dictionaryWithObjectsAndKeys:@"公共资源", @"label", nil];
    NSDictionary* resDict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"外部资源", @"label", nil];
    [resTypeArray addObject:resDict0];
    [resTypeArray addObject:resDict1];
    resType.dataSource = self;
    resType.delegate = self;
    resType.tag = 1;
    [resType selectItemAtIndex:0];
    [view0 setHidden:NO];
    [view1 setHidden:YES];
    
    [self center];
}

- (void)setDataBySubInfo:(SubInfo *)subInfo
{
    if (!subInfo) {
        [resType selectItemAtIndex:0];
        [resIndex setStringValue:@""];
        [pathTextField setStringValue:@""];
        [rotationTextFieldInSub setStringValue:@""];
        [flipHorInSub setState:0];
        [flipVerInSub setState:0];
        [previewImage setImage:nil];
        return;
    }
    if (subInfo.isPublicRes) {
        [resType selectItemAtIndex:0];
        [resIndex setStringValue:[NSString stringWithFormat:@"%d", subInfo.arrayIndex]];
    }
    else
    {
        [resType selectItemAtIndex:1];
        [pathTextField setStringValue:subInfo.imagePath];
    }
    [rotationTextFieldInSub setStringValue:[NSString stringWithFormat:@"%d", subInfo.degree]];
    [flipHorInSub setState:[[NSNumber numberWithBool:subInfo.isFlipX] intValue]];
    [flipVerInSub setState:[[NSNumber numberWithBool:subInfo.isFlipY] intValue]];
    [previewImage setImage:subInfo.imageData];
}

- (IBAction)chooseImage:(id)sender
{
    NSOpenPanel* openPanel = [NSOpenPanel openPanel];
    [openPanel setCanChooseDirectories:NO];
    [openPanel setCanChooseFiles:YES];
    [openPanel setCanCreateDirectories:NO];
    [openPanel setPrompt:@"确定"];
    [openPanel setAllowedFileTypes:[NSArray arrayWithObjects:@"jpg", @"png", nil]];
    [openPanel setDirectoryURL:[NSURL fileURLWithPath:NSHomeDirectory()]];
    [openPanel beginWithCompletionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {
            imagePath = openPanel.URL.path;
            NSImage* img = [[NSImage alloc] initWithContentsOfFile:imagePath];
            [previewImage setImage:img];
        }
    }];
}

- (IBAction)setSubImageData:(id)sender
{
    SubInfo* subInfo = [[SubInfo alloc] init];
    [subInfo imagePath:imagePath];
    [subInfo isPublicRes:[resType indexOfSelectedItem] == 0 ? YES : NO];
    if (subInfo.isPublicRes) {
        [subInfo arrayIndex:[[resIndex stringValue] intValue]];
    }
    [subInfo degree:[[rotationTextFieldInSub stringValue] intValue]];
    [subInfo imageData:previewImage.image];
    [subInfo isFlipX:flipHorInSub.state ? YES : NO];
    [subInfo isFlipY:flipVerInSub.state ? YES : NO];
    [[[Global sharedGlobal] app] setSubImageInfo:subInfo];
    
    [self close];
}

- (IBAction)setPublicImageData:(id)sender
{
    int index = [[resIndex stringValue] intValue];
    NSImage* imageData = [[[Global sharedGlobal] app] getPublicResImageData:index];
    [previewImage setImage:imageData];
}

- (void)comboBoxSelectionDidChange:(NSNotification *)notification
{
    if([resType indexOfSelectedItem] == 0){
        [view0 setHidden:NO];
        [view1 setHidden:YES];
    }else{
        [view0 setHidden:YES];
        [view1 setHidden:NO];
    }
}

- (NSInteger)numberOfItemsInComboBox:(NSComboBox *)aComboBox
{
    return [resTypeArray count];
}

- (id)comboBox:(NSComboBox *)aComboBox objectValueForItemAtIndex:(NSInteger)index
{
    return [[resTypeArray objectAtIndex:index] objectForKey:@"label"];
}

@end
