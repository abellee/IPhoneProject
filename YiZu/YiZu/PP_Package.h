//
//  PP_Package.h
//  YiZu
//
//  Created by Lee Abel on 12-8-16.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#ifndef YiZu_PP_Package_h
#define YiZu_PP_Package_h

/**
 用户状态
 **/
typedef enum UserState{
    LOGIN_STATE = 100001,
    LOGIN_SUCCESS_STATE = 100002,
    REGIST_STATE = 100003,
    BACKGROUND_STATE = 100004,
    FOREGROUND_STATE = 100005,
    BATTLE_READY = 100006,
    BATTLE_STATE = 100007,
    BATTLE_FINISH = 100008,
    BATTLE_VS_STATE = 100009
}UserState;

/**
 命令类型
 **/
typedef enum PP_Types{
    LOGIN = 100001,
    REGIST = 100002,
    ACTION_LOG = 100003,
    LOGOUT = 100004,
    HEART_BEAT = 100005,
    LOCATE = 100006,
    DATA_ERROR = 100007,
    IS_LAST_USER_DATA = 100008,
    BACKGROUND = 100009,
    FOREGROUND = 100010,
    HOME_LOCATE = 100011
}PP_Types;

/**
 登录类型
 **/
typedef enum PP_Login_Mode{
    PP_LOGIN = 200001,
    SINA_LOGIN = 200002,
    NETEASE_LOGIN = 200003,
    RENREN_LOGIN = 200004,
    QQ_LOGIN = 200005
}PP_Login_Mode;

/**
 错误类型
 **/
typedef enum PP_ErrorType{
    LOGIN_ERROR = 300001,
    REGIST_ERROR = 300002
}PP_ErrorType;

/**
 错误id
 **/
typedef enum PP_ErrorId{
    INVALID_ACC = 400001,
    INVALID_NICK = 400002,
    INVALID_NICK_LEN = 400003,
    INVALID_PASS_LEN = 400004,
    DUP_ACC = 400005,
    DUP_NICK = 400006,
    INSERT_FAILED = 400007,
    LOGIN_FAILED = 400008,
    USER_NOT_EXIST = 400009
}PP_ErrorId;

/**
 包结构
 **/
typedef struct PP_Head{
    int length;
    int type;
}PP_Head;

typedef struct PP_Package{
    PP_Head head;
    char content[10240];
}PP_Package;

/**
 错误包结构
 **/
typedef struct PP_Error{
    int errorType;
    int errorId;
}PP_Error;

/**
 定位数据包结构
 **/
typedef struct PP_Location{
    double latitude;
    double longitude;
}PP_Location;

/**
 帐号数据结构
 **/
typedef struct PP_Account{
    char username[24];
    char password[40];
}PP_Account;

/**
 最后登录时间跟创建时间
 **/
typedef struct PP_AccTime{
    int create_time;
    int last_login;
}PP_AccTime;

/**
 登录包结构
 **/
typedef struct PP_LoginPack{
    PP_Account account;
    int login_mode;
    int version;
}PP_LoginPack;

/**
 注册包结构
 **/
typedef struct PP_RegistPack{
    PP_Account account;
    char nickname[20];
    char avatar_img[40];
}PP_RegistPack;

/**
 客户端用户数据包结构
 **/
typedef struct PP_CLUser{
    int uid;
    int version;
    char nickname[20];
    char avatar_img[40];
    char signature[280];
    char hobby[140];
    char job[20];
    int sex;
    int age;
    int constellation;
    int birthday;
    int blood_type;
    int nation;
    int province;
    int city;
    char telephone[11];
    int coin;
    int token;
    int level;
    int country;
    int resource_num;
    int pet_num;
    int bag_num;
    char pets[1000];
    PP_AccTime acc_time;
    PP_Location home_location;
    PP_Location location;
}PP_CLUser;

/**
 用户切换状态
 **/
typedef struct PP_UserState{
    int uid;
    int state;
}PP_UserState;

#endif
