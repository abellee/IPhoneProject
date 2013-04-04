//
//  NumericViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-3.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumericViewController : UIViewController
{
    int maxNum;
    int minNum;
    int curNum;
    
    BOOL isAnimation;
    
    NSMutableArray* labelsArray;
}

- (id)initWithFrame:(CGRect)rect andMinNum:(int)min andCurrentNum:(int)current andMaxNum:(int)max;
- (void)setFont:(UIFont*)font withColor:(UIColor*)color;
- (void)sub;
- (void)add;
- (void)setNum:(int)num;
- (void)setBackground:(UIColor*)color;

@end
