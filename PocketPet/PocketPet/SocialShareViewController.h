//
//  SocialShareViewController.h
//  PocketPet
//
//  Created by Lee Abel on 13-1-17.
//
//

#import <UIKit/UIKit.h>

@interface SocialShareViewController : UIViewController{
    UIView* alphaBackground;
    UIImageView* backgroundImage;
    UITextView* shareText;
    UIButton* enterButton;
    UIButton* cancelButton;
    NSString* shareContent;
    
    UIView* container;
}

- (id)initWithBackgroundImage:(UIImage*)image text:(NSString*)content;

@end
