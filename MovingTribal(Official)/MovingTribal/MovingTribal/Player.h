//
//  Player.h
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject{
	/*
	NSString *realName;          // 真实姓名
    NSString *nickname;
	NSString *weiboId;           // 微博用户id
    NSString *avatarURL;
    NSString *blogURL;           // 博客地址
    NSString *idNumber;          // 身份证号
    NSString *msn;
    NSString *hobby;             // 爱好
    NSString *department;        // 所在部门
    NSString *profession;        // 大学专业
    NSString *profile;           // 简介
    NSString *signature;         // 签名
    NSString *account;           // 帐号，也是email地址
	NSString *password;          // 密码
	NSString *did;               // 设备id
    
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
	int version;                 // 缓存版本 以保存时的时间戳为版本号
	int active;                  // 是否在线 0:离线 1:在线
	int bound;                   // 要显示的范围
	 */
}

@property (nonatomic, assign) int uid;
@property (nonatomic, retain) NSString *weiboId;
@property (nonatomic, retain) NSString *realName;
@property (nonatomic, retain) NSString *nickname;
@property (nonatomic, retain) NSString *avatarURL;
@property (nonatomic, retain) NSString *blogURL;
@property (nonatomic, retain) NSString *idNumber;
@property (nonatomic, retain) NSString *msn;
@property (nonatomic, retain) NSString *hobby;
@property (nonatomic, retain) NSString *department;
@property (nonatomic, retain) NSString *profession;
@property (nonatomic, retain) NSString *profile;
@property (nonatomic, retain) NSString *signature;
@property (nonatomic, retain) NSString *account;
@property (nonatomic, retain) NSString *password;
@property (nonatomic, assign) CGFloat longitude;
@property (nonatomic, assign) CGFloat latitude;
@property (nonatomic, retain) NSString *did;
@property (nonatomic, assign) int phoneNumber;
@property (nonatomic, assign) int sex;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) int school;
@property (nonatomic, assign) int birthdayYear;
@property (nonatomic, assign) int birthdayMonth;
@property (nonatomic, assign) int birthdayDate;
@property (nonatomic, assign) int qq;
@property (nonatomic, assign) int province;
@property (nonatomic, assign) int city;
@property (nonatomic, assign) int companyProvince;
@property (nonatomic, assign) int companyCity;
@property (nonatomic, assign) int constellation;
@property (nonatomic, assign) int symbol;
@property (nonatomic, assign) int bloodType;
@property (nonatomic, assign) int marriage;
@property (nonatomic, assign) int version;
@property (nonatomic, assign) int active;
@property (nonatomic, assign) int bound;

@end
