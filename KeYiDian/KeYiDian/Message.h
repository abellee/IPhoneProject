//
//  Message.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-19.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject{
    int messageId;
    int status;
    NSString* content;
    NSString* title;
}

@property (nonatomic, assign, getter = messageId, setter = messageId:) int messageId;
@property (nonatomic, assign, getter = status, setter = status:) int status;
@property (nonatomic, copy, getter = content, setter = content:) NSString* content;
@property (nonatomic, copy, getter = title, setter = title:) NSString* title;

@end
