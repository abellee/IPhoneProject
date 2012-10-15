//
//  HelloWorldLayer.h
//  YiZu
//
//  Created by Abel Lee on 12-6-14.
//  Copyright Abel 2012年. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    UIView *loginView;
    UITextField *username;
    UITextField *password;
    UILabel *findPassword;
    UIButton *sinaWeibo;
    UIButton *qqWeibo;
    UIButton *neteaseWeibo;
    UIButton *renren;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
