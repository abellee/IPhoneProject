//
//  AvatarCell.h
//  YiZu
//
//  Created by Lee Abel on 12-10-15.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AvatarCell : UITableViewCell{
    UIButton* head;
    UIButton* takePhoto;
    UIButton* album;
}

@property (nonatomic, retain) UIButton* head;
@property (nonatomic, retain) UIButton* takePhoto;
@property (nonatomic, retain) UIButton* album;

@end
