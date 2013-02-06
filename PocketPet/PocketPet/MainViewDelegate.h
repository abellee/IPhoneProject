//
//  MainViewDelegate.h
//  YiZu
//
//  Created by Lee Abel on 12-10-27.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MainViewDelegate <NSObject>

@optional
-(void)shopButtonClicked;
-(void)resourceButtonClicked;
-(void)storehouseButtonClicked;
-(void)pethouseButtonClicked;
-(void)mapButtonClicked;
-(void)bagButtonClicked;

@end
