//
//  PPAppDelegate.m
//  InterfaceGenerator
//
//  Created by Lee Abel on 13-4-28.
//  Copyright (c) 2013年 YiZu. All rights reserved.
//

#import "PPAppDelegate.h"
#import "Definitions.h"
#import "Global.h"
#import "CustomImageView.h"
#import "ImageInfo.h"
#import "ImageInfoInCanvas.h"
#import "SavingInfo.h"
#import "NSImage+Extensions.h"
#import "SubSettingPanel.h"
#import "SubInfo.h"

@implementation PPAppDelegate

@synthesize scrollView, widthTextField, heightTextField, enterButton, cancelButton, canvasSettingPanel, libPanel, propertyPanel, libScrollView, imagePathInProperty, zIndexInPorperty, xposInProperty, yposInProperty, isPublicResInProperty, indexInProperty, preSetting, rotationTextField, flipHor, flipVer, subSetting;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [[Global sharedGlobal] app:self];
    [self.window setFrameOrigin:NSMakePoint((SCREEN_WIDTH - APP_WIDTH) / 2, (SCREEN_HEIGHT - APP_HEIGHT) / 2)];
    self.window.delegate = self;
    
    [scrollView.documentView setFrame:NSMakeRect(0, 0, APP_WIDTH, APP_HEIGHT)];
    
    canvasImages = [[NSMutableArray alloc] initWithCapacity:0];
    libImages = [[NSMutableArray alloc] initWithCapacity:0];
    publicImages = [[NSMutableArray alloc] initWithCapacity:0];
    
    settingArray = [NSMutableArray arrayWithCapacity:0];
    NSDictionary* dict0 = [NSDictionary dictionaryWithObjectsAndKeys:@"自定义", @"label", @"", @"width", @"", @"height", nil];
    NSDictionary* dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"iOS", @"label", @"320", @"width", @"480", @"height", nil];
    NSDictionary* dict2 = [NSDictionary dictionaryWithObjectsAndKeys:@"iOS Retina", @"label", @"640", @"width", @"960", @"height", nil];
    NSDictionary* dict3 = [NSDictionary dictionaryWithObjectsAndKeys:@"iOS Retina HD", @"label", @"640", @"width", @"1136", @"height", nil];
    [settingArray addObject:dict0];
    [settingArray addObject:dict1];
    [settingArray addObject:dict2];
    [settingArray addObject:dict3];
    preSetting.dataSource = self;
    preSetting.delegate = self;
    preSetting.tag = 0;
    [preSetting selectItemAtIndex:0];
}

- (NSImage*)getPublicResImageData:(int)index
{
    for (ImageInfo* imageInfo in publicImages) {
        if (imageInfo.isPublicRes && imageInfo.arrayIndex == index) {
            return imageInfo.imageData;
        }
    }
    return nil;
}

- (void)setSubImageInfo:(SubInfo *)subInfo
{
    [(ImageInfoInCanvas*)curCustomImageView.imageInfo subInfo:subInfo];
}

- (IBAction)flipX:(id)sender
{
    ImageInfoInCanvas* imageInfo = (ImageInfoInCanvas*)curCustomImageView.imageInfo;
    [imageInfo isFlipX:flipHor.state ? YES : NO];
    [self flipImageHorizontally:curCustomImageView];
}

- (IBAction)flipY:(id)sender
{
    ImageInfoInCanvas* imageInfo = (ImageInfoInCanvas*)curCustomImageView.imageInfo;
    [imageInfo isFlipY:flipVer.state ? YES : NO];
    [self flipImageVertically:curCustomImageView];
}

- (NSInteger)numberOfItemsInComboBox:(NSComboBox *)aComboBox
{
    return [settingArray count];
}

- (id)comboBox:(NSComboBox *)aComboBox objectValueForItemAtIndex:(NSInteger)index
{
    return [[settingArray objectAtIndex:index] objectForKey:@"label"];
}

- (BOOL)validateMenuItem:(NSMenuItem *)menuItem
{
    if (canvas == nil && [menuItem.menu.title isEqualToString:@"Window"]) {
        return NO;
    }
    return YES;
}

- (void)comboBoxSelectionDidChange:(NSNotification *)notification
{
    [widthTextField setStringValue:[[settingArray objectAtIndex:[preSetting indexOfSelectedItem]] objectForKey:@"width"]];
    [heightTextField setStringValue:[[settingArray objectAtIndex:[preSetting indexOfSelectedItem]] objectForKey:@"height"]];
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag
{
    [self.window makeKeyAndOrderFront:self];
    return YES;
}

- (void)windowDidResize:(NSNotification *)notification
{
    [scrollView.documentView setFrame:NSMakeRect(0, 0, self.window.frame.size.width, self.window.frame.size.height)];
    if (canvas) {
        [canvas setFrameOrigin:NSMakePoint((self.window.frame.size.width - [[Global sharedGlobal] canvasWidth]) / 2, (self.window.frame.size.height - [[Global sharedGlobal] canvasHeight]) / 2)];
    }
}

- (IBAction)importPublicResource:(id)sender
{
    NSOpenPanel* openPanel = [NSOpenPanel openPanel];
    [openPanel setCanChooseDirectories:NO];
    [openPanel setCanChooseFiles:YES];
    [openPanel setCanCreateDirectories:NO];
    [openPanel setPrompt:@"确定"];
    [openPanel setAllowedFileTypes:[NSArray arrayWithObject:@"pub"]];
    [openPanel setDirectoryURL:[NSURL fileURLWithPath:NSHomeDirectory()]];
    [openPanel beginWithCompletionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {
            [[Global sharedGlobal] publicResPath:openPanel.URL.path];
            NSMutableData* data = [NSMutableData dataWithContentsOfFile:openPanel.URL.path];
            [[Global sharedGlobal] publicResource:data];
            
            int allNum;
            [data getBytes:&allNum range:NSMakeRange(0, 4)];
            NSLog(@"%d>>>>", allNum);
            int totalDataLen = allNum * 12;
            for(int i = 0; i<allNum; i++){
                int baseLoc = 4 + i * 12;
                
                int subtype;
                int imgDataIndex;
                int imgDataLength;
                [data getBytes:&subtype range:NSMakeRange(baseLoc, 4)];
                [data getBytes:&imgDataIndex range:NSMakeRange(baseLoc + 4, 4)];
                [data getBytes:&imgDataLength range:NSMakeRange(baseLoc + 8, 4)];
                NSLog(@"%d#####", subtype);
                NSData* imgData = [data subdataWithRange:NSMakeRange(totalDataLen + 4 + imgDataIndex, imgDataLength)];
                NSImage* image = [[NSImage alloc] initWithData:imgData];
                BaseImageView* imageView = [[BaseImageView alloc] initWithFrame:NSMakeRect(0, curPosY, libScrollView.frame.size.width, image.size.height)];
                [imageView setImageFrameStyle:NSImageFrameGrayBezel];
                [imageView setImage:image];
                imageView.delegate = self;
                ImageInfo* imageInfo = [[ImageInfo alloc] init];
                [imageInfo isPublicRes:YES];
                [imageInfo arrayIndex:subtype];
                [imageInfo imageData:image];
                [imageView imageInfo:imageInfo];
                curPosY += image.size.height;
                [libScrollView.documentView addSubview:imageView];
                [libImages addObject:imageView];
                [imageView showPublicLabel];
                [publicImages addObject:imageInfo];
            }
            [libScrollView.documentView setFrame:NSMakeRect(0, 0, libScrollView.frame.size.width, curPosY)];
        }
    }];
}

- (void)showSubImageSetting:(id)sender
{
    curCustomImageView = (CustomImageView*)sender;
    if (![subSetting isVisible]) {
        [subSetting makeKeyAndOrderFront:self.window];
    }
    [subSetting setDataBySubInfo:((ImageInfoInCanvas*)curCustomImageView.imageInfo).subInfo];
}

- (IBAction)openResource:(id)sender
{
    NSOpenPanel* openPanel = [NSOpenPanel openPanel];
    [openPanel setCanChooseDirectories:NO];
    [openPanel setCanChooseFiles:YES];
    [openPanel setCanCreateDirectories:NO];
    [openPanel setPrompt:@"确定"];
    [openPanel setAllowedFileTypes:[NSArray arrayWithObject:@"ui"]];
    [openPanel setDirectoryURL:[NSURL fileURLWithPath:NSHomeDirectory()]];
    [openPanel beginWithCompletionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {
            NSString* filePath = [openPanel URL].path;
            NSFileHandle* fileHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
            [fileHandle seekToFileOffset:0];
            
            NSData* allNumData = [fileHandle readDataOfLength:sizeof(int)];
            int allNum;
            [allNumData getBytes:&allNum];
            
            [fileHandle seekToFileOffset:4];
            NSData* configData = [fileHandle readDataOfLength:28 * allNum];
            
            for (int i = 0; i < allNum; i++) {
                ImageInfoInCanvas* imgInfoInCanvas = [[ImageInfoInCanvas alloc] init];
                
                float xpos;
                float ypos;
                int isPublic;
                int arrayIndex;
                int zIndex;
                int startIndex;
                int imgLen;
                int angle;
                int subArrayIndex;
                int flipX;
                int flipY;
                
                [configData getBytes:&xpos range:NSMakeRange(i * 28, 4)];
                [configData getBytes:&ypos range:NSMakeRange(i * 28 + 4, 4)];
                [configData getBytes:&isPublic range:NSMakeRange(i * 28 + 8, 4)];
                [configData getBytes:&arrayIndex range:NSMakeRange(i * 28 + 12, 4)];
                [configData getBytes:&zIndex range:NSMakeRange(i * 28 + 16, 4)];
                [configData getBytes:&startIndex range:NSMakeRange(i * 28 + 20, 4)];
                [configData getBytes:&imgLen range:NSMakeRange(i * 28 + 24, 4)];
                [configData getBytes:&angle range:NSMakeRange(i * 28 + 28, 4)];
                [configData getBytes:&subArrayIndex range:NSMakeRange(i * 28 + 32, 4)];
                [configData getBytes:&flipX range:NSMakeRange(i * 28 + 36, 4)];
                [configData getBytes:&flipY range:NSMakeRange(i * 28 + 40, 4)];
                
                [imgInfoInCanvas pos:NSMakePoint(xpos, ypos)];
                [imgInfoInCanvas isPublicRes:isPublic == 1 ? YES : NO];
                [imgInfoInCanvas arrayIndex: arrayIndex];
                [imgInfoInCanvas zIndex:zIndex];
                [imgInfoInCanvas degree:angle];
                [imgInfoInCanvas subArrayIndex:subArrayIndex];
                [imgInfoInCanvas isFlipX:flipX ? YES : NO];
                [imgInfoInCanvas isFlipY:flipY ? YES : NO];
                [fileHandle seekToFileOffset:startIndex + 44 * allNum + 4];
                NSData* imgData = [fileHandle readDataOfLength:imgLen];
                NSImage* img = [[NSImage alloc] initWithData:imgData];
                [imgInfoInCanvas imageData:[img copy]];
                
                CustomImageView* customImageView = [[CustomImageView alloc] initWithFrame:NSMakeRect(xpos, ypos, img.size.width, img.size.height)];
                [customImageView imageInfo:imgInfoInCanvas];
                [customImageView setImage:img];
                customImageView.delegate = self;
                [canvasImages addObject:customImageView];
                if (flipX) {
                    [self flipImageHorizontally:customImageView];
                }
                if (flipY) {
                    [self flipImageVertically:customImageView];
                }
            }
            while ([[canvas subviews] count] < [canvasImages count]) {
                for (CustomImageView* civ in canvasImages) {
                    if (((ImageInfoInCanvas*)civ.imageInfo).zIndex == [[canvas subviews] count]) {
                        [canvas addSubview:civ];
                    }
                }
            }
        }
    }];
}

- (void)removeFromCanvas:(id)sender
{
    CustomImageView* imageView = (CustomImageView*)sender;
    [imageView removeFromSuperview];
    if ([canvasImages containsObject:imageView]) {
        [canvasImages removeObject:imageView];
    }
    curCustomImageView = nil;
}

- (void)upLayerInCanvas:(id)sender
{
    CustomImageView* imageView = (CustomImageView*)sender;
    ImageInfoInCanvas* imgInfo = (ImageInfoInCanvas*)imageView.imageInfo;
    int index = (int)[[canvas subviews] indexOfObject:imageView];
    if (index + 1 < [[canvas subviews] count]) {
        CustomImageView* nextView = [[canvas subviews] objectAtIndex:index + 1];
        ImageInfoInCanvas* nextImgInfo = (ImageInfoInCanvas*)nextView.imageInfo;
        if (nextView) {
            NSArray* arr = [canvas subviews];
            NSMutableArray* tempArr = [NSMutableArray arrayWithArray:arr];
            [tempArr exchangeObjectAtIndex:index withObjectAtIndex:index + 1];
            [canvas setSubviews:tempArr];
            [imgInfo zIndex:index + 1];
            [nextImgInfo zIndex:index];
        }
    }
}

- (void)downLayerInCanvas:(id)sender
{
    CustomImageView* imageView = (CustomImageView*)sender;
    ImageInfoInCanvas* imgInfo = (ImageInfoInCanvas*)imageView.imageInfo;
    int index = (int)[[canvas subviews] indexOfObject:imageView];
    if (index - 1 >= 0) {
        CustomImageView* nextView = [[canvas subviews] objectAtIndex:index - 1];
        ImageInfoInCanvas* nextImgInfo = (ImageInfoInCanvas*)nextView.imageInfo;
        if (nextView) {
            NSArray* arr = [canvas subviews];
            NSMutableArray* tempArr = [NSMutableArray arrayWithArray:arr];
            [tempArr exchangeObjectAtIndex:index withObjectAtIndex:index - 1];
            [canvas setSubviews:tempArr];
            [imgInfo zIndex:index - 1];
            [nextImgInfo zIndex:index];
        }
    }
}

- (IBAction)createResource:(id)sender
{
    [self showCanvasSettingPanel];
}

- (IBAction)showLibPanel:(id)sender
{
    [libPanel makeKeyAndOrderFront:self.window];
}

- (IBAction)chooseLibDir:(id)sender
{
    [self addResToLib:nil];
}

- (void)relistImageInLibScrollView
{
    curPosY = 0;
    NSArray* array = [libScrollView.documentView subviews];
    for (NSView* view in array) {
        [view setFrameOrigin:NSMakePoint(0, curPosY)];
        curPosY += view.frame.size.height;
    }
    [libScrollView.documentView setFrame:NSMakeRect(0, 0, libScrollView.frame.size.width, curPosY)];
}

- (void)imageClicked:(id)sender
{
    BaseImageView* imgView = (BaseImageView*)sender;
    [self showPropertyPanelByImageView:(CustomImageView *)imgView];
}

- (void)imageDoubleClicked:(id)sender
{
    BaseImageView* imgView = (BaseImageView*)sender;
    if ([imgView isKindOfClass:[CustomImageView class]]) {
        return;
    }
    ImageInfo* imgInfo = [imgView imageInfo];
    
    NSImage* image = imgView.image;
    CustomImageView* imageView = [[CustomImageView alloc] initWithFrame:NSMakeRect(0, 0, image.size.width, image.size.height)];
    [imageView setImage:image];
    imageView.delegate = self;
    ImageInfoInCanvas* imageInfo = [[ImageInfoInCanvas alloc] init];
    [imageInfo imagePath:imgInfo.imagePath];
    [imageInfo isPublicRes:imgInfo.isPublicRes];
    [imageInfo arrayIndex:imgInfo.arrayIndex];
    [imageInfo zIndex:(int)[[canvas subviews] count]];
    [imageInfo imageData:[image copy]];
    if ([[imgInfo.imagePath pathExtension] isEqualToString:@"jpg"]) {
        [imageInfo isJPG:YES];
    }
    else if([[imgInfo.imagePath pathExtension] isEqualToString:@"png"]){
        [imageInfo isJPG:NO];
    }
    [imageView imageInfo:imageInfo];
    [canvas addSubview:imageView];
    [canvasImages addObject:imageView];
}

- (void)flipImageHorizontally:(NSImageView*)imageView
{
    NSAffineTransform *flipper = [NSAffineTransform transform];
    NSSize dimensions = [imageView frame].size;
    
    NSImage *aFrame = [imageView.image copy];
    
    [aFrame lockFocus];
    [flipper scaleXBy:-1.0 yBy:1.0];
    [flipper set];
    
    [aFrame drawAtPoint:NSMakePoint(-dimensions.width,0)
               fromRect:NSMakeRect(0,0, dimensions.width, dimensions.height)
              operation:NSCompositeCopy fraction:1.0];
    
    [aFrame unlockFocus];
    
    [imageView setImage:aFrame];
}

- (void)flipImageVertically:(NSImageView*)imageView
{
    NSAffineTransform *flipper = [NSAffineTransform transform];
    NSSize dimensions = [imageView frame].size;
    
    NSImage *aFrame = [imageView.image copy];
    
    [aFrame lockFocus];
    [flipper scaleXBy:1.0 yBy:-1.0];
    [flipper set];
    
    [aFrame drawAtPoint:NSMakePoint(0,-dimensions.height)
               fromRect:NSMakeRect(0,0, dimensions.width, dimensions.height)
              operation:NSCompositeCopy fraction:1.0];
    
    [aFrame unlockFocus];
    
    [imageView setImage:aFrame];
}

- (IBAction)resetPosInCanvas:(id)sender
{
    ImageInfoInCanvas* imageInfo = (ImageInfoInCanvas*)curCustomImageView.imageInfo;
    [imageInfo pos:NSMakePoint([xposInProperty.stringValue floatValue], [yposInProperty.stringValue floatValue])];
    [curCustomImageView setFrameOrigin:imageInfo.pos];
    
    int angle = [rotationTextField.stringValue intValue];
    if(angle == 360){
        angle = 0;
    }
    if (angle != 0) {
        [imageInfo degree: imageInfo.degree + angle == 360 ? 0 : imageInfo.degree + angle];
        NSImage* tmpImage = [curCustomImageView.image copy];
        [curCustomImageView setImage:[tmpImage imageRotatedByDegrees:angle]];
    }
}

- (void)showPropertyPanelByImageView:(CustomImageView*)imageView
{
    curCustomImageView = imageView;
    ImageInfoInCanvas* imageInfo = (ImageInfoInCanvas*)imageView.imageInfo;
    [imagePathInProperty setStringValue:imageInfo.imagePath == nil ? @"" : imageInfo.imagePath];
    [isPublicResInProperty setState:[[NSNumber numberWithBool:imageInfo.isPublicRes] intValue]];
    if (imageInfo.isPublicRes)
    {
        [indexInProperty setStringValue:[NSString stringWithFormat:@"%d", imageInfo.arrayIndex]];
    }
    [xposInProperty setStringValue:[NSString stringWithFormat:@"%f", curCustomImageView.frame.origin.x]];
    [yposInProperty setStringValue:[NSString stringWithFormat:@"%f", curCustomImageView.frame.origin.y]];
    [zIndexInPorperty setStringValue:[NSString stringWithFormat:@"%d", imageInfo.zIndex]];
    [rotationTextField setStringValue:[NSString stringWithFormat:@"%d", imageInfo.degree]];
    [flipHor setState:[[NSNumber numberWithBool:imageInfo.isFlipX] intValue]];
    [flipVer setState:[[NSNumber numberWithBool:imageInfo.isFlipY] intValue]];
    if (![propertyPanel isVisible]) {
        [propertyPanel makeKeyAndOrderFront:self.window];
    }
}

- (IBAction)exportInterface:(id)sender
{
    if (saveingArray == nil) {
        saveingArray = [NSMutableArray arrayWithCapacity:0];
    }
    if (subSavingArray == nil) {
        subSavingArray = [NSMutableArray arrayWithCapacity:0];
    }
    [saveingArray removeAllObjects];
    [subSavingArray removeAllObjects];
    
    NSMutableArray* subArray = [NSMutableArray arrayWithCapacity:0];
    
    NSSavePanel* savePanel = [NSSavePanel savePanel];
    [savePanel setCanCreateDirectories:NO];
    [savePanel beginWithCompletionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {
            NSString* savePath = [savePanel.URL.path stringByAppendingPathExtension:@"ui"];
            
            NSMutableData* imageData = [NSMutableData dataWithCapacity:0];
            NSMutableData* allData = [NSMutableData dataWithCapacity:0];
            
            NSMutableData* allSubData = [NSMutableData dataWithCapacity:0];
            NSMutableData* subImageData = [NSMutableData dataWithCapacity:0];
            
            int allNum = (int)[canvasImages count];
            NSData* allNumData = [NSData dataWithBytes:&allNum length:sizeof(int)];
            [allData appendData:allNumData];
            
            for (CustomImageView* imgView in canvasImages) {
                ImageInfoInCanvas* imgInfo = (ImageInfoInCanvas*)imgView.imageInfo;
                
                float xpos = imgInfo.pos.x;
                float ypos = imgInfo.pos.y;
                int isPublic = [[NSNumber numberWithBool:imgInfo.isPublicRes] intValue];
                int arrayIndex = imgInfo.arrayIndex;
                int zIndex = imgInfo.zIndex;
                int startIndex = 0;
                int imgLen = 0;
                int angle = imgInfo.degree;
                int hasSub = 0;
                int subArrayIndex = 0;
                if (imgInfo.subInfo && imgInfo.subInfo.imageData) {
                    hasSub = 1;
                    subArrayIndex = (int)subArray.count;
                    
                    int subIsPublic = imgInfo.subInfo.isPublicRes ? 1 : 0;
                    int subIndex = imgInfo.subInfo.arrayIndex;
                    int subAngle = imgInfo.subInfo.degree;
                    int subIsFlipX = imgInfo.subInfo.isFlipX ? 1 : 0;
                    int subIsFlipY = imgInfo.subInfo.isFlipY ? 1 : 0;
                    SavingInfo* subSavingInfo = [self getSubSavingInfoByPath:imgInfo.imageData];
                    if (subSavingInfo == nil) {
                        startIndex = (int)subImageData.length;
                        NSData* subImgData;
                    }
                }
                int flipX = imgInfo.isFlipX ? 1 : 0;
                int flipY = imgInfo.isFlipY ? 1 : 0;
                
                NSData* xposData = [NSData dataWithBytes:&xpos length:sizeof(float)];
                NSData* yposData = [NSData dataWithBytes:&ypos length:sizeof(float)];
                NSData* isPublicData = [NSData dataWithBytes:&isPublic length:sizeof(int)];
                NSData* arrayIndexData = [NSData dataWithBytes:&arrayIndex length:sizeof(int)];
                NSData* zIndexData = [NSData dataWithBytes:&zIndex length:sizeof(int)];
                if (!imgInfo.isPublicRes) {
                    SavingInfo* savingInfo = [self getSavingInfoByPath:imgInfo.imageData];
                    if (savingInfo == nil) {
                        startIndex = (int)imageData.length;
                        NSData* imgData;
                        if (imgInfo.isJPG) {
                            imgData = [self JPGRepresentationOfImage:imgInfo.imageData];
                        }else{
                            imgData = [self PNGRepresentationOfImage:imgInfo.imageData];
                        }
                        imgLen = (int)imgData.length;
                        [imageData appendData:imgData];
                        SavingInfo* si = [[SavingInfo alloc] init];
                        [si imageData:imgInfo.imageData];
                        [si startIndex:startIndex];
                        [si imageLen:imgLen];
                        [saveingArray addObject:si];
                    }else{
                        startIndex = savingInfo.startIndex;
                        imgLen = savingInfo.imageLen;
                    }
                }
                NSData* startIndexData = [NSData dataWithBytes:&startIndex length:sizeof(int)];
                NSData* imgLenData = [NSData dataWithBytes:&imgLen length:sizeof(int)];
                NSData* angleData = [NSData dataWithBytes:&angle length:sizeof(int)];
                NSData* flipXData = [NSData dataWithBytes:&flipX length:sizeof(int)];
                NSData* flipYData = [NSData dataWithBytes:&flipY length:sizeof(int)];
                NSData* hasSubData = [NSData dataWithBytes:&hasSub length:sizeof(int)];
                NSData* subArrayIndexData = [NSData dataWithBytes:&subArrayIndexData length:sizeof(int)];
                
                [allData appendData:xposData];
                [allData appendData:yposData];
                [allData appendData:isPublicData];
                [allData appendData:arrayIndexData];
                [allData appendData:zIndexData];
                [allData appendData:startIndexData];
                [allData appendData:imgLenData];
                [allData appendData:angleData];
                [allData appendData:flipXData];
                [allData appendData:flipYData];
                [allData appendData:hasSubData];
                [allData appendData:subArrayIndexData];
            }
            [allData appendData:imageData];
            
            [allData writeToFile:savePath atomically:YES];
            NSAlert* alert = [NSAlert alertWithMessageText:@"" defaultButton:@"确定" alternateButton:nil otherButton:nil
                                 informativeTextWithFormat:@"导出完毕!"];
            [alert beginSheetModalForWindow:self.window modalDelegate:nil didEndSelector:nil contextInfo:nil];
        }
    }];
}

- (SavingInfo*)getSavingInfoByPath:(NSImage*)data
{
    NSArray* dataArray = [self getRGBAsFromImage:data atX:0 andY:0 count:data.size.width * data.size.height];
    for (SavingInfo* savingInfo in saveingArray) {
        NSArray* savingArray = [self getRGBAsFromImage:savingInfo.imageData atX:0 andY:0 count:savingInfo.imageData.size.width * savingInfo.imageData.size.height];
        if (dataArray.count == savingArray.count) {
            for (int i = 0; i < savingArray.count; i++) {
                if (![[savingArray objectAtIndex:i] isEqualTo:[dataArray objectAtIndex:i]]) {
                    return nil;
                }
            }
            return savingInfo;
        }
    }
    return nil;
}

- (SavingInfo*)getSubSavingInfoByPath:(NSImage*)data
{
    NSArray* dataArray = [self getRGBAsFromImage:data atX:0 andY:0 count:data.size.width * data.size.height];
    for (SavingInfo* savingInfo in subSavingArray) {
        NSArray* savingArray = [self getRGBAsFromImage:savingInfo.imageData atX:0 andY:0 count:savingInfo.imageData.size.width * savingInfo.imageData.size.height];
        if (dataArray.count == savingArray.count) {
            for (int i = 0; i < savingArray.count; i++) {
                if (![[savingArray objectAtIndex:i] isEqualTo:[dataArray objectAtIndex:i]]) {
                    return nil;
                }
            }
            return savingInfo;
        }
    }
    return nil;
}

- (NSArray*)getRGBAsFromImage:(NSImage*)image atX:(int)xx andY:(int)yy count:(int)count
{
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    
    // First get the image into your data buffer
    CGImageRef imageRef = [image CGImageForProposedRect:NULL context:NULL hints:NULL];
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char *rawData = (unsigned char*) calloc(height * width * 4, sizeof(unsigned char));
    NSUInteger bytesPerPixel = 4;
    NSUInteger bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;
    CGContextRef context = CGBitmapContextCreate(rawData, width, height,
                                                 bitsPerComponent, bytesPerRow, colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
    CGContextRelease(context);
    
    // Now your rawData contains the image data in the RGBA8888 pixel format.
    int byteIndex = (int)((bytesPerRow * yy) + xx * bytesPerPixel);
    for (int ii = 0 ; ii < count ; ++ii)
    {
        CGFloat red   = (rawData[byteIndex]     * 1.0) / 255.0;
        CGFloat green = (rawData[byteIndex + 1] * 1.0) / 255.0;
        CGFloat blue  = (rawData[byteIndex + 2] * 1.0) / 255.0;
        CGFloat alpha = (rawData[byteIndex + 3] * 1.0) / 255.0;
        byteIndex += 4;
        
        NSColor *acolor = [NSColor colorWithDeviceRed:red green:green blue:blue alpha:alpha];
        [result addObject:acolor];
    }
    
    free(rawData);
    
    return result;
}

- (void)removeFromLib:(id)sender
{
    BaseImageView* imgView = (BaseImageView*)sender;
    [imgView removeFromSuperview];
    [libImages removeObject:imgView];
    [self relistImageInLibScrollView];
}

- (BOOL)isFile:(NSString*)path
{
    if ([[path pathExtension] isEqualTo:@"jpg"] || [[path pathExtension] isEqualTo:@"png"]) {
        return YES;
    }
    return NO;
}

- (void)imageDragged:(id)sender
{
    [xposInProperty setStringValue:[NSString stringWithFormat:@"%f", curCustomImageView.frame.origin.x]];
    [yposInProperty setStringValue:[NSString stringWithFormat:@"%f", curCustomImageView.frame.origin.y]];
    ImageInfoInCanvas* imageInfo = (ImageInfoInCanvas*)curCustomImageView.imageInfo;
    [imageInfo pos:NSMakePoint(curCustomImageView.frame.origin.x, curCustomImageView.frame.origin.y)];
    [curCustomImageView setFrameOrigin:imageInfo.pos];
}

- (NSData *) PNGRepresentationOfImage:(NSImage *) image {
    NSData *temp = [image TIFFRepresentation];
    NSBitmapImageRep *bitmap = [NSBitmapImageRep imageRepWithData:temp];
    NSData *imgData = [bitmap representationUsingType:NSPNGFileType properties:nil];
    return imgData;
}

- (NSData *) JPGRepresentationOfImage:(NSImage *) image {
    NSData *temp = [image TIFFRepresentation];
    NSBitmapImageRep *bitmap = [NSBitmapImageRep imageRepWithData:temp];
    NSData *imgData = [bitmap representationUsingType:NSJPEGFileType properties:nil];
    return imgData;
}

- (IBAction)addResToLib:(id)sender
{
    NSOpenPanel* openPanel = [NSOpenPanel openPanel];
    [openPanel setCanChooseDirectories:YES];
    [openPanel setCanChooseFiles:YES];
    [openPanel setCanCreateDirectories:NO];
    [openPanel setAllowsMultipleSelection:YES];
    [openPanel setPrompt:@"确定"];
    [openPanel setAllowedFileTypes:[NSArray arrayWithObjects:@"jpg", @"png", nil]];
    [openPanel setDirectoryURL:[NSURL fileURLWithPath:NSHomeDirectory()]];
    [openPanel beginWithCompletionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {
            if (sender == nil) {
                if ([libImages count] > 0) {
                    curPosY = 0;
                    [libImages removeAllObjects];
                    while ([[libScrollView.documentView subviews] count] > 0) {
                        [[[libScrollView.documentView subviews] objectAtIndex:0] removeFromSuperview];
                    }
                    [libScrollView.documentView setFrameSize:libScrollView.frame.size];
                }
            }
            NSArray* urls = openPanel.URLs;
            for (NSURL* url in urls) {
                NSString* path = url.path;
                if ([self isFile:path]) {
                    NSImage* image = [[NSImage alloc] initWithContentsOfFile:path];
                    BaseImageView* imageView = [[BaseImageView alloc] initWithFrame:NSMakeRect(0, curPosY, libScrollView.frame.size.width, image.size.height)];
                    [imageView setImageFrameStyle:NSImageFrameGrayBezel];
                    [imageView setImage:image];
                    imageView.delegate = self;
                    ImageInfo* imageInfo = [[ImageInfo alloc] init];
                    [imageInfo imagePath:path];
                    [imageInfo isPublicRes:NO];
                    [imageView imageInfo:imageInfo];
                    curPosY += image.size.height;
                    [libScrollView.documentView addSubview:imageView];
                    [libImages addObject:imageView];
                }else{
                    NSFileManager* fileManager = [NSFileManager defaultManager];
                    NSArray* files = [fileManager subpathsAtPath:path];
                    for (NSString* fileName in files) {
                        if ([self isFile:fileName]) {
                            NSString* imagePath = [path stringByAppendingPathComponent:fileName];
                            NSImage* image = [[NSImage alloc] initWithContentsOfFile:imagePath];
                            BaseImageView* imageView = [[BaseImageView alloc] initWithFrame:NSMakeRect(0, curPosY, libScrollView.frame.size.width, image.size.height)];
                            [imageView setImageFrameStyle:NSImageFrameGrayBezel];
                            [imageView setImage:image];
                            ImageInfo* imageInfo = [[ImageInfo alloc] init];
                            [imageInfo imagePath:imagePath];
                            [imageInfo isPublicRes:NO];
                            imageView.delegate = self;
                            [imageView imageInfo:imageInfo];
                            curPosY += image.size.height;
                            [libScrollView.documentView addSubview:imageView];
                            [libImages addObject:imageView];
                        }
                    }
                }
            }
            [libScrollView.documentView setFrame:NSMakeRect(0, 0, libScrollView.frame.size.width, curPosY)];
        }
    }];
}

- (void)showCanvasSettingPanel
{
    [widthTextField setStringValue:@""];
    [heightTextField setStringValue:@""];
    code = [[NSApplication sharedApplication] runModalForWindow:canvasSettingPanel];
}

- (IBAction)cancelCanvasSettingPanel:(id)sender
{
    [canvasSettingPanel close];
    [[NSApplication sharedApplication] stopModalWithCode:code];
}

- (IBAction)enterCanvasSettingPanel:(id)sender
{
    [[Global sharedGlobal] canvasWidth:[[widthTextField stringValue] intValue]];
    [[Global sharedGlobal] canvasHeight:[[heightTextField stringValue] intValue]];
    [self cancelCanvasSettingPanel:nil];
    [self showCanvas];
    [self showLibPanel:nil];
}

- (void)showCanvas
{
    if (canvas) {
        [canvas removeFromSuperview];
        canvas = nil;
    }
    canvas = [[NSView alloc] initWithFrame:NSMakeRect((self.window.frame.size.width - [[Global sharedGlobal] canvasWidth]) / 2, (self.window.frame.size.height - [[Global sharedGlobal] canvasHeight]) / 2, [[Global sharedGlobal] canvasWidth], [[Global sharedGlobal] canvasHeight])];
    CALayer* layer = [CALayer layer];
    layer.backgroundColor = [NSColor lightGrayColor].CGColor;
    [canvas setWantsLayer:YES];
    [canvas setLayer:layer];
    [scrollView.documentView addSubview:canvas];
}

@end
