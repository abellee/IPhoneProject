//
//  RightSideViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-1.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RightSideViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>{
    NSArray* functions;
    
    UITableViewController* functionList;
    
    UISearchBar* searchBar;
}

@end
