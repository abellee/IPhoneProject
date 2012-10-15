//
//  LoginDelegate.h
//  YiZu
//
//  Created by Lee Abel on 12-10-15.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LoginDelegate <NSObject>

-(void)doLogin:(NSString*)username pass:(NSString*)password;

@end
