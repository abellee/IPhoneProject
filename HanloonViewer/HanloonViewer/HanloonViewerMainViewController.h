//
//  HanloonViewerMainViewController.h
//  HanloonViewer
//
//  Created by Abel Lee on 13-2-12.
//  Copyright (c) 2013年 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define BASE_URL @"http://localhost/test.php"

@interface HanloonViewerMainViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UIPopoverControllerDelegate>{
    NSArray* firstLevel;
    NSArray* photoCate;
    NSArray* photoChildCate;
    NSArray* photoCateLabel;
    NSArray* tpoCateLabel;
    UITableViewController* thumbList;
    UITableViewController* cateList;
    
    NSMutableDictionary* tpoCateDict;
    
    NSMutableArray* labelList;
    NSMutableArray* buttonList;
    
    UILabel* firstLevelLabel;
    UIButton* firstLevelBtn;
    
    UIPopoverController* popOver;
    UIButton* curButton;
    NSArray* curList;
    
    int lastTag;
    int curTag;
    
    UIImageView* imgView;
}

@end
