//
//  SocketManager.m
//  YiZu
//
//  Created by Lee Abel on 12-8-25.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "SocketManager.h"
#import "JSONKit.h"
#import "Global.h"
#import "LoginViewController.h"
#import "ServerInfo.h"
#import "HTTPManager.h"
#import "GameLayer.h"
#import "PP_Package.h"
#import "PopUpLayer.h"
#import "PlayerData.h"

#import "PP_Account.pb.h"
#import "PP_LoginPack.pb.h"
#import "PP_CLUser.pb.h"
#import "PP_UserState.pb.h"
#import "PP_RegistPack.pb.h"
#import "PP_Location.pb.h"
#import "PP_AccTime.pb.h"
#import "PP_Error.pb.h"
#import "PP_Pet.pb.h"
#import "PP_BattleInfo.pb.h"
#import "PP_BattlePet.pb.h"
#import "PP_GameControl.pb.h"
#import "PP_AttackResult.pb.h"
#import "PP_Attack.pb.h"
#import "BattlePetSpriteController.h"
#import "BattleFieldLayer.h"

@implementation SocketManager

@synthesize thread;

-(void)connect
{
    if(thread == nil){
        thread = [[NSThread alloc] initWithTarget:self selector:@selector(connectToServer) object:nil];
        [thread setName:@"socket_thread"];
        [thread start];
    }
}

-(void)connectToServer
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    [[Global sharedGlobal] serverInfo:[[HTTPManager sharedHTTPManager] getSocketServerInfo]];
    if((sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1){
        NSLog(@"error");
        exit(1);
    }
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = inet_addr([[[[Global sharedGlobal] serverInfo] ip] UTF8String]);
    addr.sin_port = htons([[[Global sharedGlobal] serverInfo] port]);
    bzero(addr.sin_zero, 8);
    int conn = connect(sockfd, (struct sockaddr *)&addr, sizeof(struct sockaddr));
    if(conn != -1){
        
        char readBuffer[8];
        memset(&readBuffer, 0, sizeof(readBuffer));
        while (1) {
            int br = recv(sockfd, readBuffer, sizeof(readBuffer), 0);
            if(br == 0){
                NSLog(@"server close");
                return;
            }
            if(br <= sizeof(readBuffer)){
                PP_Package* b = (PP_Package*)readBuffer;
                char content[b->head.length];
                memset(&content, 0, sizeof(content));
                recv(sockfd, content, sizeof(content), 0);
                switch (b->head.type) {
                    case REGIST:{
                        [self performSelectorOnMainThread:@selector(registSuccess) withObject:nil waitUntilDone:NO];
                    }break;
                    case IS_LAST_USER_DATA:{
                        [self performSelectorOnMainThread:@selector(loginSuccess:) withObject:@"YES" waitUntilDone:NO];
                    }break;
                    case LOGIN:{
                        NSLog(@"received:%d", b->head.length);
                        PP_CLUser* userData = [PP_CLUser parseFromData:[NSData dataWithBytes:content length:b->head.length]];
                        [[Global sharedGlobal] player:userData];
                        
                        [self performSelectorOnMainThread:@selector(loginSuccess:) withObject:@"NO" waitUntilDone:NO];
                        
                    }break;
                    case HEART_BEAT:{
                        [self performSelectorInBackground:@selector(sendHeartBeat) withObject:nil];
                    }break;
                    case DATA_ERROR:{
                        PP_Error* errorPack = [PP_Error parseFromData:[NSData dataWithBytes:content length:sizeof(content)]];
                        [self performSelectorOnMainThread:@selector(showErrorAlert:) withObject:errorPack waitUntilDone:NO];
                    }break;
                    case BATTLE:{
                        NSLog(@"on battle");
                        PP_BattleInfo* battleInfo = [PP_BattleInfo parseFromData:[NSData dataWithBytes:content length:sizeof(content)]];
                        [self performSelectorOnMainThread:@selector(onBattle:) withObject:battleInfo waitUntilDone:NO];
                    }break;
                    case BATTLE_ATTACK_RESULT:{
                        NSLog(@"battle attack result");
                        PP_AttackResult* attackResult = [PP_AttackResult parseFromData:[NSData dataWithBytes:content length:sizeof(content)]];
                        [self performSelectorOnMainThread:@selector(onAttackResult:) withObject:attackResult waitUntilDone:NO];
                    }break;
                    default:
                        break;
                }
            }
            
        }
    }
    [pool release];
}

/*-(void)test
{
    [self performSelector:@selector(loginTest:) onThread:hbThread withObject:@"aaaa" waitUntilDone:NO];
}

-(void)hbThreadFunc
{
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
    
    NSRunLoop* loop = [NSRunLoop currentRunLoop];
    [loop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
    
    while (1) {
        [loop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
    
    [pool release];
}*/

-(void)onBattle:(PP_BattleInfo*)battleInfo
{
    [[[Global sharedGlobal] gameLayer] onBattleWithBattleInfo:battleInfo];
}

- (void)loginSuccess:(NSString*)isLast
{
    if([isLast isEqualToString:@"YES"]){
        
    }
    if([[[Global sharedGlobal] gameLayer] loginLayer]){
        [[[[Global sharedGlobal] gameLayer] loginLayer] performSelector:@selector(loginSuccess)];
    }
}

-(void)registSuccess
{
    [[[[Global sharedGlobal] gameLayer] loginLayer] performSelector:@selector(registSuccess)];
}

-(void)doRegist:(NSString *)avatarURL nickname:(NSString *)nickname username:(NSString *)username password:(NSString *)password
{
    PP_Package package;
    PP_RegistPack* registPack;
    PP_RegistPack_Builder* registPackBuilder = [PP_RegistPack builder];
    [registPackBuilder setAccount:[[[[[registPackBuilder account] builder] setUsername:username] setPassword:password] build]];
    [registPackBuilder setNickname:nickname];
    if(avatarURL) [registPackBuilder setAvatarImg:avatarURL];
    registPack = [registPackBuilder build];
    package.head.type = REGIST;
    package.head.length = registPack.serializedSize;
    NSLog(@"注册发出数据量:%d", registPack.serializedSize);
    memcpy(package.content, &registPack, package.head.length);
    send(sockfd, &package, package.head.length + sizeof(package.head), 0);
}

-(void)sendHeartBeat
{
    PP_Package package;
    PP_UserState* hb = [[[[PP_UserState builder] setUid:1] setState:FOREGROUND] build];
    
    package.head.type = HEART_BEAT;
    package.head.length = hb.serializedSize;
    NSLog(@"心跳包发出数据量:%d", hb.serializedSize);
    memcpy(package.content, hb.data.bytes, package.head.length);
    send(sockfd, &package, sizeof(package.head) + package.head.length, 0);
}

-(void)doLogin:(NSString *)username pass:(NSString *)password
{
    PP_Package package;
    PP_Account* acc = [[[[PP_Account builder] setUsername:username] setPassword:[Global md5:password]] build];
    PP_LoginPack* loginPack = [[[[[PP_LoginPack builder] setAccount:acc] setLoginMode:PP_LOGIN] setVersion:100] build];
    package.head.type = LOGIN;
    package.head.length = loginPack.serializedSize;
    NSLog(@"登录发出数据量:%d", loginPack.serializedSize);
    
    memcpy(package.content, [[loginPack data] bytes], package.head.length);
    send(sockfd, &package, package.head.length + sizeof(package.head), 0);
}

-(void)enterBackground
{
    PP_Package package;
    PP_UserState* userState = [[[[PP_UserState builder] setUid:1] setState:BACKGROUND_STATE] build];
    
    package.head.type = BACKGROUND;
    package.head.length = userState.serializedSize;
    memcpy(package.content, &userState, package.head.length);
    send(sockfd, &package, package.head.length + sizeof(package.head), 0);
}

-(void)enterForeground
{
    PP_Package package;
    PP_UserState* userState = [[[[PP_UserState builder] setUid:1] setState:FOREGROUND_STATE] build];
    
    package.head.type = FOREGROUND;
    package.head.length = userState.serializedSize;
    memcpy(package.content, &userState, package.head.length);
    send(sockfd, &package, package.head.length + sizeof(package.head), 0);
    [[userState builder] clear];
}

-(void)attackStartWithNSArray:(NSArray *)array
{
    PP_Package package;
    PP_Attack_Builder* attackBuilder = [PP_Attack builder];
    for (BattlePetSpriteController* battlePetController in array) {
        PP_Pet* pet = (PP_Pet*)[battlePetController data];
        PP_BattlePet* battlePet = (PP_BattlePet*)[battlePetController targetData];
        PP_GameControl* gameControl = [[[[[PP_GameControl builder] setPetId:[pet petId]] setSkillId:1] setTargetId:[battlePet mid]] build];
        [attackBuilder addGameControl:gameControl];
    }
    PP_Attack* attack = [attackBuilder build];
    package.head.type = BATTLE_ATTACK;
    package.head.length = attack.serializedSize;
    NSLog(@"攻击包数据:%d", attack.serializedSize);
    memcpy(package.content, [[attack data] bytes], package.head.length);
    send(sockfd, &package, package.head.length + sizeof(package.head), 0);
    //[[attack builder] clearGameControl];
    //[[attack builder] clear];
}

-(void)onAttackResult:(PP_AttackResult*)attackResult
{
    [[[Global sharedGlobal] battleField] attackResultWithPPAttackResult:attackResult];
}

-(void)callMain:(NSString *)str
{
    NSLog(@"%@", str);
}

-(void)showErrorAlert:(PP_Error*)errorPack
{
    switch ([errorPack errorType]) {
        case LOGIN_ERROR:{
            NSString* alertStr;
            switch ([errorPack errorId]) {
                case LOGIN_FAILED:
                    alertStr = @"帐号或密码不正确！";
                    break;
                case USER_NOT_EXIST:
                    alertStr = @"用户不存在！";
                    break;
                default:
                    break;
            }
            [[[Global sharedGlobal] popUpLayer] showErrorAlertWithTitle:@"登录失败!" info:alertStr];
        }break;
        case REGIST_ERROR:{
            NSString* alertStr;
            switch ([errorPack errorId]) {
                case INVALID_ACC:{
                    alertStr = @"帐号不符合要求！";
                }break;
                case INVALID_NICK:{
                    alertStr = @"昵称不符合要求！";
                }break;
                case INVALID_NICK_LEN:{
                    alertStr = @"昵称长度不正确!";
                }break;
                case INVALID_PASS_LEN:{
                    alertStr = @"密码长度不正确!";
                }break;
                case DUP_ACC:{
                    alertStr = @"该帐号已经存在!";
                }break;
                case DUP_NICK:{
                    alertStr = @"该昵称已经存在!";
                }break;
                case INSERT_FAILED:{
                    alertStr = [NSString stringWithFormat:@"注册失败！错误:%d", INSERT_FAILED];
                }break;
                default:
                    break;
            }
            [[[Global sharedGlobal] popUpLayer] showErrorAlertWithTitle:@"注册失败!" info:alertStr];
        }break;
        default:
            break;
    }
}

@end
