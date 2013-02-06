//
//  RegistLayer.h
//  YiZu
//
//  Created by Abel Lee on 12-6-28.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginDelegate.h"

@class EditableUITableViewController;

@interface RegistLayer : UIViewController{
    EditableUITableViewController* registForm;
    
    id<LoginDelegate> delegate;
}
@property (nonatomic, retain) EditableUITableViewController* registForm;
@property (nonatomic, assign) id<LoginDelegate> delegate;

-(NSString *)getRegistedUsername;
-(NSString *)getRegistedPassword;

@end
