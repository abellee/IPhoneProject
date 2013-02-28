//
//  StarViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-2-22.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarViewController : UIViewController{
    UIImageView* emptyStars;
    UIImageView* fullStars;
    
    CGSize singleStarSize;
    int curStarNum;
}

- (void)setStar:(int)starNum;

@end
