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

typedef enum STATE_ENUM
{
    SERVER_INFO,
    CHECK_UPDATE,
    DO_UPDATE,
    ENTER_GAME,
    START_DOWNLOAD,
    UNZIP_RESOURCE
}STATE_ENUM;

@interface LaunchLoadingViewController : UIViewController<ASIHTTPRequestDelegate, ASIProgressDelegate>{
    UITextField* tipText;
    NSMutableArray* resList;
    int index;
    int state;
}

@end
