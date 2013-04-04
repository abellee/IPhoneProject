//
//  HLPhotoViewerViewController.h
//  Hanloon
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwipeNoticeViewController;
@class ImageWallViewController;
@class LoadingView;
@class ImageGroupViewController;
@class ImageData;
@interface HLPhotoViewerViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, NSURLConnectionDelegate, UITextFieldDelegate>{
    UIImageView* background;
    SwipeNoticeViewController* noticeViewController;
    ImageWallViewController* imageWallViewController;
    ImageGroupViewController* imageGroupViewController;
    
    UILabel* firstCateLabel;
    UIButton* firstCateButton;
    
    UILabel* secondCateLabel;
    UIButton* secondCateButton;
    
    UILabel* thirdCateLabel;
    UIButton* thirdCateButton;
    
    UILabel* forthCateLabel;
    UIButton* forthCateButton;
    
    UILabel* fifthCateLabel;
    UIButton* fifthCateButton;
    
    UIButton* backButton;
    
    NSMutableDictionary* cateDict;
    
    UIPopoverController* popOver;
    UITableViewController* tableViewController;
    
    UIButton* curButton;
    NSArray* curList;
    NSArray* buttonList;
    
    LoadingView* loadingView;
    
    NSURLConnection* conn;
    NSMutableData* recivedData;
    NSNumber* curNumberTag;
    
    int curPage;
    BOOL isLoading;
    BOOL isLoadingCate;
    
    NSMutableArray* imageDataList;
    int totalNum;
    int curTag;
    
    UITextField* orderNumTextField;
    UIButton* enterButton;
}

@property (nonatomic, retain, getter = imageDataList, setter = imageDataList:) NSMutableArray* imageDataList;
@property (nonatomic, assign, getter = totalNum, setter = totalNum:) int totalNum;

- (void)loadNextPage;
- (void)showImageGroup:(ImageData*)imageData;
- (void)removeImageGroup;

@end
