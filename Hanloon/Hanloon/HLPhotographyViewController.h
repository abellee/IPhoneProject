//
//  HLPhotographyViewController.h
//  Hanloon
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVCaptureDelegate.h"
#import "DeletableImageDelegate.h"
#import "ASIHTTPRequestDelegate.h"
#import "ASIProgressDelegate.h"

@class AVCaptureCameraViewController;
@class LoadingView;
@class ProgressViewController;
@interface HLPhotographyViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, AVCaptureDelegate, DeletableImageDelegate, ASIHTTPRequestDelegate, UIAlertViewDelegate, ASIProgressDelegate, UITableViewDataSource, UITableViewDelegate, UIPopoverControllerDelegate, NSURLConnectionDelegate>{
    UIImageView* background;
    
    UILabel* photoCateLabel;
    UITextField* cateButton;
    UILabel* orderLabel;
    UIButton* orderChooseButton;
    UITextField* orderTextField;
    
    UIButton* cameraButton;
    UIButton* submitButton;
    UIButton* resetButton;
    UIButton* backwardButton;
    
    UIButton* addButton;
    UIScrollView* imageScrollView;
    
    NSMutableArray* tempArray;
    NSMutableArray* imageArray;
    NSMutableArray* deleteableImages;
    NSArray* parentCateArray;
    NSArray* photoCateArray;
    NSArray* curPhotoCateArray;
    
    UIPopoverController* popOver;
    UIToolbar* pickerToolBar;
    
    UIActionSheet* actionSheet;
    UIAlertView* alert;
//    UIProgressView* progressView;
    NSString* server;
    NSArray* cateArray;
    UIPickerView* picker;
    UITableViewController* cateList;
    
    AVCaptureCameraViewController* camera;
    LoadingView* loadingView;
    ProgressViewController* progressViewController;
    
    NSURLConnection* conn;
    NSMutableData* receviedData;
    
    BOOL isUploading;
    int curCateIndex;
    int curParentIndex;
    int curChildIndex;
}

@property (nonatomic, assign) UIImagePickerController* imagePickr;

@end
