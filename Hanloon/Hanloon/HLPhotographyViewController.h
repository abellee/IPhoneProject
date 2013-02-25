//
//  HLPhotographyViewController.h
//  Hanloon
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLPhotographyViewController : UIViewController{
    UIImageView* background;
    
    UILabel* photoCateLabel;
    UIButton* cateButton;
    UILabel* orderLabel;
    UIButton* orderChooseButton;
    UIButton* orderButton;
    
    UIButton* cameraButton;
    UIButton* submitButton;
    UIButton* resetButton;
}

@end
