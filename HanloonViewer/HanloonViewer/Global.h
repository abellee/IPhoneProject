//
//  Global.h
//  HanloonViewer
//
//  Created by Lee Abel on 13-2-16.
//  Copyright (c) 2013年 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ImageDownloadData;
@class HanloonViewerMainViewController;
@interface Global : NSObject{
    NSMutableArray* imageList;
    HanloonViewerMainViewController* app;
    
    NSMutableArray* curData;
    int totalNum;
}

@property (nonatomic, retain) NSMutableArray* imageList;
@property (nonatomic, retain) HanloonViewerMainViewController* app;
@property (nonatomic, retain) NSMutableArray* curData;
@property (nonatomic, assign) int totalNum;

+ (id)sharedGlobal;
- (void)cacheImage:(ImageDownloadData*)data row:(int)rowNum;
- (NSMutableArray*)getImageByIndexPath:(NSIndexPath*)indexPath;
- (void)clearCache;
- (void)addImageList:(NSMutableArray *)imageList indexPath:(NSIndexPath*)indexPath;

@end
