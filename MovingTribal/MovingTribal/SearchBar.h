//
//  SearchBar.h
//  MovingTribal
//
//  Created by Lee Abel on 9/18/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchBar : UIViewController<UISearchBarDelegate>{
    UISearchBar* searchBar;
}

@property (nonatomic, retain) UISearchBar* searchBar;

@end
