//
//  KYDUser.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-8.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KYDUser : NSObject{
    NSString* username;
    NSString* password;
}

@property (nonatomic, copy, getter = username, setter = username:) NSString* username;
@property (nonatomic, copy, getter = password, setter = password:) NSString* password;

@end
