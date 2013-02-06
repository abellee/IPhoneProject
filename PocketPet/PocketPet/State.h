//
//  State.h
//  YiZu
//
//  Created by Lee Abel on 12-11-7.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#ifndef YiZu_State_h
#define YiZu_State_h

typedef enum UserState{
    LOGIN_STATE = 100001,
    LOGIN_SUCCESS_STATE = 100002,
    REGIST_STATE = 100003,
    BACKGROUND_STATE = 100004,
    FOREGROUND_STATE = 100005
}UserState;

typedef enum GameState{
    GameState_NORMAL = 100001,
    GameState_BATTLE = 100002,
    GameState_DEAD = 100003
}GameState;

typedef enum BattleState{
    BATTLE_READY = 100001,
    BATTLE_STATE = 100002,
    BATTLE_FINISH = 100003
}BattleState;

typedef enum PetState{
    REST = 1,
    FIGHT = 2
}PetState;

#endif
