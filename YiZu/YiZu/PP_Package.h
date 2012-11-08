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
    HOME_LOCATE = 100011,
    BATTLE = 100012,
    BATTLE_ATTACK = 100013,
    BATTLE_ATTACK_RESULT = 100014
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
    char content[1024];
}PP_Package;



#endif
