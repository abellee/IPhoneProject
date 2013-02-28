//
//  KilometerView.h
//  KeYiDian
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KilometerView : UIView{
    UIImageView* background;
    UIImageView* point;
    
    UIButton* fiveHundred;
    UIButton* oneKilometer;
    UIButton* twoKilometer;
    UIButton* fiveKilometer;
    UIButton* allDis;
    
    UILabel* fiveHundredLabel;
    UILabel* oneKilometerLabel;
    UILabel* twoKilometerLabel;
    UILabel* fiveKilometerLabel;
    UILabel* allDisLabel;
    
    int curIndex;
}

@property (nonatomic, assign, getter = curIndex, setter = curIndex:) int curIndex;

@end
