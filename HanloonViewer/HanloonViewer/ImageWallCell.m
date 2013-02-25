//
//  ImageWallCell.m
//  HanloonViewer
//
//  Created by Lee Abel on 13-2-16.
//  Copyright (c) 2013年 Abel Lee. All rights reserved.
//

#import "ImageWallCell.h"
#import "ImageDownloadData.h"
#import "ShadowViewController.h"
#import "Loader.h"
#import "Global.h"

@implementation ImageWallCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        imageList = [[NSMutableArray arrayWithCapacity:1] retain];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)initImageWithImageDownloadData:(NSMutableArray *)downloadData maxNum:(int)maxNum indexPath:(NSIndexPath *)indexPath
{
    curIndexPath = [indexPath retain];
    [[Global sharedGlobal] addImageList:downloadData indexPath:indexPath];
    imageNum = [downloadData count];
    maxImageNum = maxNum;
    if (imageNum > maxNum) {
        [NSException raise:@"Error" format:@"downloadData size can not big than maxNum!"];
    }
    if (imageList && [imageList count] > 0) {
        [self removeAll];
    }
    [self loadAllImage];
}

- (void)removeAll
{
    for (ShadowViewController* shadowViewController in imageList) {
        [shadowViewController.view removeFromSuperview];
        [shadowViewController release];
    }
    [imageList removeAllObjects];
}

- (void)loadAllImage
{
    for (int i = 0; i < imageNum; i++) {
        float cellWidth = 185;
        float cellHeight = 150;
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(i * (cellWidth + 20) + 10, 10, cellWidth, cellHeight)];
        view.backgroundColor = [UIColor whiteColor];
        ShadowViewController* shadowView = [[ShadowViewController alloc] init];
        [shadowView setView:view];
        [view release];
        shadowView.contentsGravity = kCAGravityCenter;
        shadowView.shadowColor = [UIColor blackColor];
        shadowView.shadowOpacity = 0.8;
        shadowView.shadowOffset = CGSizeMake(1, 1);
        shadowView.shadowRadius = 1.0;
        [self addSubview:shadowView.view];
        ImageDownloadData* imageDownloadData = (ImageDownloadData *)[[[[Global sharedGlobal] imageList] objectAtIndex:curIndexPath.row] objectAtIndex:i];
        imageDownloadData.tag = i;
        [shadowView imageData:imageDownloadData];
        if (imageDownloadData.image == nil) {
            [[Loader sharedLoader] addImage:imageDownloadData];
            [[Loader sharedLoader] startLoad];
        }else{
            NSLog(@"you le");
            [self downloadComplete:imageDownloadData];
        }
        [imageList addObject:shadowView];
    }
}

- (BOOL)canAddImage
{
    return imageNum < maxImageNum;
}

- (void)downloadComplete:(ImageDownloadData *)data
{
    [[Global sharedGlobal] cacheImage:data row:curIndexPath.row];
    ShadowViewController* shadowView = (ShadowViewController*)[imageList objectAtIndex:data.tag];
    shadowView.contents = (id)data.image.CGImage;
}

- (void)dealloc
{
    NSLog(@"cell dealloc");
    [imageList removeAllObjects];
    [imageList release];
    [curIndexPath release];
    
    [super dealloc];
}

@end
