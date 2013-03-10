//
//  NSString+Extensions.h
//  KeYiDian
//
//  Created by Lee Abel on 13-2-28.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extensions)

+ (NSString *)md5:(NSString *)str;
+ (BOOL)isEmail:(NSString *)str;

@end
