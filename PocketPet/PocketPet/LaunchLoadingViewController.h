//
//  LaunchLoadingViewController.h
//  PocketPet
//
//  Created by Lee Abel on 13-1-17.
//
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequestDelegate.h"
#import "ASIProgressDelegate.h"

@interface LaunchLoadingViewController : UIViewController<ASIHTTPRequestDelegate, ASIProgressDelegate>{
    UITextField* tipText;
    NSMutableArray* resList;
    int index;
}

@end
