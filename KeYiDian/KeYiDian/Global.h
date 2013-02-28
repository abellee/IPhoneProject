//
//  Global.h
//  KeYiDian
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UILoadingView;
@class ASINetworkQueue;
@interface Global : NSObject{
}

@property (nonatomic, retain, getter = loadingView, setter = loadingView:) UILoadingView* loadingView;

@property (nonatomic, retain, getter = networkQueue, setter = networkQueue:) ASINetworkQueue* networkQueue;

+(id)sharedInstance;

@end
