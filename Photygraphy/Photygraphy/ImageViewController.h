//
//  ImageViewController.h
//  Photygraphy
//
//  Created by Lee Abel on 12-12-26.
//  Copyright (c) 2012年 Lee Abel. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AbelViewController;
@interface ImageViewController : UIViewController<UIAlertViewDelegate>{
    UIButton* deleteButton;
    UIImage* originalImage;
    AbelViewController* parentController;
}

-(void)addPicture:(UIImage*)image parent:(AbelViewController*)parent;

@end
