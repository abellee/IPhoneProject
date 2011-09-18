//
//  UserData.h
//  MovingTribal
//
//  Created by Lee Abel on 9/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserData : NSObject{
    int uid;
    NSString* weiboId;
    NSString* username;
}

@property (nonatomic, assign, getter = uid, setter = uid:) int uid;
@property (nonatomic, assign, getter = weiboId, setter = weiboId:) NSString* weiboId;
@property (nonatomic, assign, getter = username, setter = username:) NSString* username;

@end
