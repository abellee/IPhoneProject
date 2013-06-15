//
//  PPAppDelegate.h
//  InterfaceGenerator
//
//  Created by Lee Abel on 13-4-28.
//  Copyright (c) 2013年 YiZu. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>

@class CustomImageView;
@class SubSettingPanel;
@class SubInfo;
@interface PPAppDelegate : NSObject <NSApplicationDelegate, NSWindowDelegate, NSMenuDelegate, NSComboBoxDelegate, NSComboBoxDataSource>
{
    NSInteger code;
    NSView* canvas;
    NSMutableArray* libImages;
    NSMutableArray* canvasImages;
    NSMutableArray* publicImages;
    float curPosY;
    CustomImageView* curCustomImageView;
    
    NSMutableArray* saveingArray;
    NSMutableArray* subSavingArray;
    
    NSMutableArray* settingArray;
}

@property (assign) IBOutlet NSWindow *window;
@property (retain) IBOutlet NSScrollView* scrollView;
@property (retain) IBOutlet NSTextField* widthTextField;
@property (retain) IBOutlet NSTextField* heightTextField;
@property (retain) IBOutlet NSButton* enterButton;
@property (retain) IBOutlet NSButton* cancelButton;
@property (retain) IBOutlet NSPanel* canvasSettingPanel;
@property (retain) IBOutlet NSPanel* libPanel;
@property (retain) IBOutlet NSPanel* propertyPanel;
@property (retain) IBOutlet NSScrollView* libScrollView;
@property (retain) IBOutlet NSTextField* imagePathInProperty;
@property (retain) IBOutlet NSTextField* zIndexInPorperty;
@property (retain) IBOutlet NSTextField* xposInProperty;
@property (retain) IBOutlet NSTextField* yposInProperty;
@property (retain) IBOutlet NSButton* isPublicResInProperty;
@property (retain) IBOutlet NSTextField* indexInProperty;
@property (retain) IBOutlet NSComboBox* preSetting;
@property (retain) IBOutlet NSTextField* rotationTextField;
@property (retain) IBOutlet NSButton* flipHor;
@property (retain) IBOutlet NSButton* flipVer;

@property (retain) IBOutlet SubSettingPanel* subSetting;

- (IBAction)importPublicResource:(id)sender;
- (IBAction)createResource:(id)sender;
- (IBAction)openResource:(id)sender;
- (IBAction)cancelCanvasSettingPanel:(id)sender;
- (IBAction)enterCanvasSettingPanel:(id)sender;
- (IBAction)chooseLibDir:(id)sender;
- (IBAction)addResToLib:(id)sender;
- (IBAction)showLibPanel:(id)sender;
- (IBAction)resetPosInCanvas:(id)sender;
- (IBAction)exportInterface:(id)sender;
- (IBAction)flipX:(id)sender;
- (IBAction)flipY:(id)sender;

- (NSImage*)getPublicResImageData:(int)index;
- (void)setSubImageInfo:(SubInfo*)subInfo;

@end
