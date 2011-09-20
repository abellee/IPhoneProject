//
//  UserData.h
//  MovingTribal
//
//  Created by Lee Abel on 9/18/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserData : NSObject{
    // 微博帐号存于本地 
    NSString* username;
    NSString* nickname;
    NSString* avatarURL;
    NSString* blogURL;           // 博客地址
    NSString* idNumber;          // 身份证号
    NSString* msn;
    NSString* hobby;             // 爱好
    NSString* department;        // 所在部门
    NSString* profession;        // 大学专业
    NSString* profile;           // 简介
    NSString* signature;         // 签名
    NSString* account;           // 帐号，也是email地址
    
    CGFloat longitude;           // 经度
    CGFloat latitude;            // 纬度
    
    int uid;                     // 用户id
    int phoneNumber;             // 电话号码 本地取
    int sex;
    int age;
    int school;                  // 学校
    int birthdayYear;
    int birthdayMonth;
    int birthdayDate;
    int qq;
    int province;                // 所在省
    int city;                    // 所在市
    int companyProvince;         // 公司所在省
    int companyCity;             // 公司所在市
    int constellation;           // 星座 0:白羊座 1:金牛座 2:双子座 3:巨蟹座 4:狮子座 5:处女座 6:天秤座 7:天蝎座 8:射手座 9:摩羯座 10:水瓶座 11:双鱼座
    int symbol;                  // 生肖 0:鼠 1:牛 2:虎 3:兔 4:龙 5:蛇 6:马 7:羊 8:猴 9:鸡 10:狗 11:猪
    int bloodType;               // 血型 0:A 1:B 2:O 3:AB
    int marriage;                // 婚姻状态 0:单身 1:恋爱 2:已婚
}

@property (nonatomic, assign, getter = uid, setter = uid:) int uid;
@property (nonatomic, assign, getter = weiboId, setter = weiboId:) NSString* weiboId;
@property (nonatomic, assign, getter = username, setter = username:) NSString* username;

@end
