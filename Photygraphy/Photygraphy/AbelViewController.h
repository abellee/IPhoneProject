//
//  AbelViewController.h
//  Photography
//
//  Created by Lee Abel on 12-12-14.
//  Copyright (c) 2012年 Lee Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "ASIHTTPRequestDelegate.h"
#import "ASIProgressDelegate.h"

@interface AbelViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ASIHTTPRequestDelegate, UIAlertViewDelegate, ASIProgressDelegate, UITableViewDataSource, UITableViewDelegate, UIPopoverControllerDelegate, NSURLConnectionDelegate>{
    UIPickerView* picker;
    UIToolbar* pickerToolBar;
    UITextField* orderNumber;
    UIImageView* image;
    UIButton* btn;
    
    UIScrollView* scrollView;
    UILabel* cateLabel;
    UILabel* photoCateLabel;
    UILabel* orderLabel;
    UITextField* parentCateTextField;
    UITextField* photoCateTextField;
    UITextField* orderTextField;
    
    UIActionSheet* actionSheet;
    
    UIButton* submit;
    NSString* server;
    
    UIAlertView* alert;
    UITextField* serverURLTextField;
    UIButton* serverURLCommit;
    BOOL isUploading;
    NSArray* parentCateArray;
    NSArray* photoCateArray;
    NSArray* curPhotoCateArray;
    UIProgressView* progressView;
    
    NSMutableArray* imageList;
    NSMutableArray* failedImageList;
    NSMutableArray* imageControllerList;
    
    UIToolbar* toolbar;
    CGRect rect;
    UIImagePickerController* camera;
    UIScrollView* imageView;
    UIPopoverController* popOver;
    
    NSMutableArray* tempImageList;
    
    NSMutableString* strCache;
    UIButton* ressetButton;
    
    ALAssetsLibrary* assetsLib;
    
    UITableViewController* cateList;
    UIButton* cateButton;
    NSArray* cateArray;
    NSURLConnection* conn;
    int curCateIndex;
}

- (void)setImageList:(NSMutableArray*)images;
- (void)deleteImage:(UIImage*)image;

@end
