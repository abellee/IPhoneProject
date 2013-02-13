//
//  ImageWallViewController.h
//  HanloonViewer
//
//  Created by Abel Lee on 13-2-13.
//  Copyright (c) 2013年 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageWallViewController : UIViewController{
    UITableViewController* tableViewController;
    NSMutableArray* imageList;
    NSString* footTitle;
}

@property (nonatomic, assign) NSString* footTitle;

@end
