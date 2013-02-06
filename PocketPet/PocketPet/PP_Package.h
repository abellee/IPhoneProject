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
    LOGIN_STATE = 0x100001,
    LOGIN_SUCCESS_STATE = 0x100002,
    REGIST_STATE = 0x100003,
    BACKGROUND_STATE = 0x100004,
    FOREGROUND_STATE = 0x100005,
    OFFLINE_STATE = 0x100006
}UserState;

/**
 命令类型
 **/
typedef enum PP_Types{
    LOGIN = 0x200001,
    REGIST = 0x200002,
    ACTION_LOG = 0x200003,
    LOGOUT = 0x200004,
    HEART_BEAT = 0x200005,
    LOCATE = 0x200006,
    DATA_ERROR = 0x200007,
    IS_LAST_USER_DATA = 0x200008,
    BACKGROUND = 0x200009,
    FOREGROUND = 0x200010,
    HOME_LOCATE = 0x200011,
    BATTLE = 0x200012,
    BATTLE_ATTACK = 0x200013,
    BATTLE_ATTACK_RESULT = 0x200014,
    IS_LAST_PET_DATA = 0x200015,
    IS_LAST_BAG_DATA = 0x200016,
    PET = 0x200017,
    TAKE_TASK = 0x200018,
    CHAT = 0x200019
}PP_Types;

/**
 怪物变异等级
 **/
typedef enum VariationLevel{
    BLUE = 0x300001,
    YELLOW = 0x300002,
    RED = 0x300003
}VariationLevel;

/**
 登录类型
 **/
typedef enum PP_Login_Mode{
    PP_LOGIN = 0x400001,
    SINA_LOGIN = 0x400002,
    NETEASE_LOGIN = 0x400003,
    RENREN_LOGIN = 0x400004,
    QQ_LOGIN = 0x400005
}PP_Login_Mode;

/**
 错误类型
 **/
typedef enum PP_ErrorType{
    LOGIN_ERROR = 0x500001,
    REGIST_ERROR = 0x500002,
    TASK_ERROR = 0x500003,
    CHAT_ERROR = 0x500004,
}PP_ErrorType;

/**
 错误id
 **/
typedef enum PP_ErrorId{
    INVALID_ACC = 0x600001,
    INVALID_NICK = 0x600002,
    INVALID_NICK_LEN = 0x600003,
    INVALID_PASS_LEN = 0x600004,
    DUP_ACC = 0x600005,
    DUP_NICK = 0x600006,
    INSERT_FAILED = 0x600007,
    LOGIN_FAILED = 0x600008,
    USER_NOT_EXIST = 0x600009,
    TASK_IS_DOING = 0x600010,
    TASK_IS_DONE = 0x600011,
    TASK_IS_OUT_TIME = 0x600012,
    TASK_LEVEL_TO_LOW = 0x600013,
    NO_TASK = 0x600014,
    TASK_IS_NOT_DOING = 0x600015,
    TASK_CAN_NOT_FINISH = 0x600016,
    ACC_IS_BAN = 0x600017,
    ACC_IS_DISABLED = 0x600018,
    USER_IS_NOT_ONLINE = 0x600019,
    USER_ALREADY_ONLINE = 0x600020
}PP_ErrorId;

/**
 战场类型
 **/
typedef enum Battle_Type{
    C_TO_M = 0x700001,
    C_TO_C = 0x700002
}Battle_Type;

/**
 战场子类型
 **/
typedef enum Battle_ChildType{
    NORMAL = 0x800001,
    VS = 0x800002,
    AREA_PROTECT = 0x800003,
    RES_PLUNDER = 0x800004
}Battle_ChildType;

/**
 行为类型
 **/
typedef enum PP_ActionType{
    ACTION = 0x900001,
    ITEM = 0x900002,
    TASK = 0x900003
}PP_ActionType;

/**
 关系类型
 **/
typedef enum PP_RelationshipType{
    FRIEND = 0xd00001,
    BLACKLIST = 0xd00002,
    COUPLE = 0xd00003
}PP_RelationshipType;

/**
 包结构
 **/
//typedef struct PP_Head{
//    int length;
//    int type;
//}PP_Head;
//
//typedef struct PP_Package{
//    PP_Head head;
//    char content[1024];
//}PP_Package;



#endif
