//
//  Utility.h
//  KeYiDian
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

+ (id)sharedInstance;
- (UIImage*)getImageWithPath:(NSString*)path;

@end
