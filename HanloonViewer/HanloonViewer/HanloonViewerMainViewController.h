//
//  HanloonViewerMainViewController.h
//  HanloonViewer
//
//  Created by Abel Lee on 13-2-12.
//  Copyright (c) 2013年 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class ImageDownloadData;
@class ImageGroupViewController;
@class ImageWallViewController;
@class LoadingView;
@interface HanloonViewerMainViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UIPopoverControllerDelegate, UINavigationControllerDelegate, NSURLConnectionDelegate>{
//    NSArray* firstLevel;
//    NSArray* photoCate;
//    NSArray* photoChildCate;
//    NSArray* photoCateLabel;
//    NSArray* tpoCateLabel;
//    UITableViewController* thumbList;
    UITableViewController* cateList;
    
//    NSMutableDictionary* tpoCateDict;
    
    NSMutableArray* labelList;
    NSMutableArray* buttonList;
    
    UILabel* firstLevelLabel;
    UIButton* firstLevelBtn;
    
    UILabel* secondLevelLabel;
    UIButton* secondLevelBtn;
    
    UILabel* thirdLevelLabel;
    UIButton* thirdLevelBtn;
    
    UILabel* fourthLevelLabel;
    UIButton* fourthLevelBtn;
    
    UILabel* fifthLevelLabel;
    UIButton* fifthLevelBtn;
    
    UIPopoverController* popOver;
    UIButton* curButton;
    NSArray* curList;
    
    int lastTag;
    int curTag;
    
    UIImageView* imgView;
    ImageGroupViewController* groupViewController;
    ImageWallViewController* wallViewController;
    
    NSMutableDictionary* navigatorDataList;
    NSMutableDictionary* tagByName;
    
    UIView* container;
    UIScrollView* cateScrollView;
    
    NSURLConnection* conn;
    
    int curPage;
    int curCateTag;
    BOOL isLoading;
    
    LoadingView* loadingView;
}

- (void)imageViewInterface:(ImageDownloadData*)data;
- (void)cancelGroupView;
- (void)getNextPage;
- (void)showImageInWall:(ImageDownloadData*)data;

@end
