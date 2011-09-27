//
//  UserData.h
//  MovingTribal
//
//  Created by Lee Abel on 9/18/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//
//  用户数据缓存
//  当登录过一次服务器后，将服务端数据同步至本地
//  一旦有修改，将以保存设置时的当前时间戳为版本号
//  当再次登录时，与服务端的版本进行对比
//  如果本地缓存新于服务端，将新的字段的数据提交至服务端，并更新服务端以及服务端版本号
//  如果服务端数据新于本地缓存，将接收服务端数据，更新本地缓存以及本地版本号
//  如果本地与服务端版本号相同，则服务器不作任何用户信息返回，只通知本地，版本相同，采用本地缓存数据

#import <Foundation/Foundation.h>
#import "GDataXMLNode.h"

@interface UserData : NSObject{
    // 微博帐号存于本地 
    NSString* realName;          // 真实姓名
    NSString* nickname;
	NSString* weiboId;           // 微博用户id
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
	NSString* did;               // 设备id
    
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
}

@property (nonatomic, assign, getter = uid, setter = uid:) int uid;
@property (nonatomic, assign, getter = weiboId, setter = weiboId:) NSString* weiboId;
@property (nonatomic, assign, getter = realName, setter = realName:) NSString* realName;
@property (nonatomic, assign, getter = nickname, setter = nickname:) NSString* nickname;
@property (nonatomic, assign, getter = avatarURL, setter = avatarURL:) NSString* avatarURL;
@property (nonatomic, assign, getter = blogURL, setter = blogURL:) NSString* blogURL;
@property (nonatomic, assign, getter = idNumber, setter = idNumber:) NSString* idNumber;
@property (nonatomic, assign, getter = msn, setter = msn:) NSString* msn;
@property (nonatomic, assign, getter = hobby, setter = hobby:) NSString* hobby;
@property (nonatomic, assign, getter = department, setter = department:) NSString* department;
@property (nonatomic, assign, getter = profession, setter = profession:) NSString* profession;
@property (nonatomic, assign, getter = profile, setter = profile:) NSString* profile;
@property (nonatomic, assign, getter = signature, setter = signature:) NSString* signature;
@property (nonatomic, assign, getter = account, setter = account:) NSString* account;
@property (nonatomic, assign, getter = longtitude, setter = longtitude:) CGFloat longtitude;
@property (nonatomic, assign, getter = latitude, setter = latitude:) CGFloat latitude;
@property (nonatomic, assign, getter = did, setter = did:) NSString* did;
@property (nonatomic, assign, getter = phoneNumber, setter = phoneNumber:) int phoneNumber;
@property (nonatomic, assign, getter = sex, setter = sex:) int sex;
@property (nonatomic, assign, getter = age, setter = age:) int age;
@property (nonatomic, assign, getter = school, setter = school:) int school;
@property (nonatomic, assign, getter = birthdayYear, setter = birthdayYear:) int birthdayYear;
@property (nonatomic, assign, getter = birthdayMonth, setter = birthdayMonth:) int birthdayMonth;
@property (nonatomic, assign, getter = birthdayDate, setter = birthdayDate:) int birthdayDate;
@property (nonatomic, assign, getter = qq, setter = qq:) int qq;
@property (nonatomic, assign, getter = province, setter = province:) int province;
@property (nonatomic, assign, getter = city, setter = city:) int city;
@property (nonatomic, assign, getter = companyProvince, setter = companyProvince:) int companyProvince;
@property (nonatomic, assign, getter = companyCity, setter = companyCity:) int companyCity;
@property (nonatomic, assign, getter = constellation, setter = constellation:) int constellation;
@property (nonatomic, assign, getter = symbol, setter = symbol:) int symbol;
@property (nonatomic, assign, getter = bloodType, setter = bloodType:) int bloodType;
@property (nonatomic, assign, getter = marriage, setter = marriage:) int marriage;
@property (nonatomic, assign, getter = version, setter = version:) int version;
@property (nonatomic, assign, getter = active, setter = active:) int active;
@property (nonatomic, assign, getter = bound, setter = bound:) int bound;

- (UserData *)parse:(NSData *)xmlData;

@end
