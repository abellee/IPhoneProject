//
//  SubSettingPanel.h
//  InterfaceGenerator
//
//  Created by Lee Abel on 13-5-15.
//  Copyright (c) 2013年 YiZu. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class SubInfo;
@interface SubSettingPanel : NSPanel<NSComboBoxDelegate, NSComboBoxDataSource>
{
    NSMutableArray* resTypeArray;
    NSString* imagePath;
}

@property (retain) IBOutlet NSComboBox* resType;
@property (retain) IBOutlet NSTextField* resIndex;
@property (retain) IBOutlet NSTextField* pathTextField;
@property (retain) IBOutlet NSTextField* rotationTextFieldInSub;
@property (retain) IBOutlet NSButton* flipHorInSub;
@property (retain) IBOutlet NSButton* flipVerInSub;
@property (retain) IBOutlet NSImageView* previewImage;
@property (retain) IBOutlet NSView* view0;
@property (retain) IBOutlet NSView* view1;

- (IBAction)chooseImage:(id)sender;
- (IBAction)setSubImageData:(id)sender;
- (IBAction)setPublicImageData:(id)sender;

- (void)setDataBySubInfo:(SubInfo*)subInfo;

@end
