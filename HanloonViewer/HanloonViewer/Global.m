//
//  Global.m
//  HanloonViewer
//
//  Created by Lee Abel on 13-2-16.
//  Copyright (c) 2013年 Abel Lee. All rights reserved.
//

#import "Global.h"
#import "ImageDownloadData.h"

@implementation Global

@synthesize imageList;
@synthesize app;
@synthesize curData;
@synthesize totalNum;

static Global* instance;

+ (id)sharedGlobal
{
    if (instance == nil) {
        instance = [[self alloc] init];
    }
    return instance;
}

- (void)addImageList:(NSMutableArray *)data indexPath:(NSIndexPath *)indexPath
{
    if (imageList == nil) {
        imageList = [[NSMutableArray alloc] initWithCapacity:1];
    }
    [imageList setObject:data atIndexedSubscript:indexPath.row];
}

- (NSMutableArray*)imageList
{
    return imageList;
}

- (void)cacheImage:(ImageDownloadData *)data row:(int)rowNum
{
    if (imageList && [imageList count] > 0) {
        if (rowNum < [imageList count] && [imageList objectAtIndex:rowNum]) {
            NSMutableArray* array = [imageList objectAtIndex:rowNum];
            if (array) {
                if (data.tag > [array count] || [array objectAtIndex:data.tag] == nil) {
                    [[imageList objectAtIndex:rowNum] addObject:data];
                }
            }
        }else{
            NSMutableArray* arr = [NSMutableArray arrayWithCapacity:1];
            [arr addObject:data];
            [imageList addObject:arr];
        }
    }else{
        imageList = [[NSMutableArray alloc] initWithCapacity:1];
        NSMutableArray* arr = [NSMutableArray arrayWithCapacity:1];
        [arr addObject:data];
        [imageList addObject:arr];
    }
}

- (NSMutableArray*)getImageByIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < [imageList count]) {
        return [imageList objectAtIndex:indexPath.row];
    }
    return NULL;
}

- (void)clearCache
{
    if (imageList) {
        [imageList removeAllObjects];
    }
}
@end
