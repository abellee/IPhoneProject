//
//  Address.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Address : NSObject

@property (nonatomic, copy, getter = address, setter = address:) NSString* address;
@property (nonatomic, copy, getter = telephone, setter = telelphone:) NSString* telephone;
@property (nonatomic, assign, getter = shortNum, setter = shortNum:) int shortNum;
@property (nonatomic, copy, getter = secondTel, setter = secondTel:) NSString* secondTel;
@property (nonatomic, assign, getter = isDefault, setter = isDefault:) BOOL isDefault;

@end
