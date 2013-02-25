//
//  AbelViewController.h
//  Hanloon
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class HLPhotographyViewController;
@class HLPhotoViewerViewController;
@interface AbelViewController : UIViewController{
    UIImageView* background;
    UIImageView* logoImage;
    UIButton* viewButton;
    UIButton* photoButton;
    
    UIScrollView* funcScrollView;
    
    HLPhotographyViewController* photographyViewController;
    HLPhotoViewerViewController* photoViewerViewController;
}

- (void)backToMain;

@end
