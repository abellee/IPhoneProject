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
#import "Utils.h"

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
#import "PP_Message.pb.h"
#import "PP_Package.pb.h"

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
        int bufferSize = 1024;
        char readBuffer[bufferSize];
        memset(&readBuffer, 0, bufferSize);
        while (recv(sockfd, readBuffer, sizeof(readBuffer), 0)) {
            PP_Package* b = [PP_Package parseFromData:[NSData dataWithBytes:readBuffer length:bufferSize]];
            //char content[b->head.length];
            //memset(&content, 0, sizeof(content));
            //recv(sockfd, content, sizeof(content), 0);
            switch ([b type]) {
                case REGIST:{
                    [self performSelectorOnMainThread:@selector(registSuccess) withObject:nil waitUntilDone:NO];
                }break;
                case IS_LAST_USER_DATA:{
                    [self performSelectorOnMainThread:@selector(loginSuccess:) withObject:@"YES" waitUntilDone:NO];
                }break;
                case LOGIN:{
                    PP_CLUser* userData = [PP_CLUser parseFromData:[b content]];
                    [[Global sharedGlobal] player:userData];
                    
                    [self performSelectorOnMainThread:@selector(loginSuccess:) withObject:@"NO" waitUntilDone:NO];
                    
                }break;
                
                default:
                    break;
            }
        }
        NSLog(@"server close");
    }else{
       [[[Global sharedGlobal] popUpLayer] showErrorAlertWithTitle:@"连接失败!" info:@"连接服务器失败!"];
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
//    if([[[Global sharedGlobal] gameLayer] loginLayer]){
//        [[[[Global sharedGlobal] gameLayer] loginLayer] performSelector:@selector(loginSuccess)];
//        
//        PP_Package package;
//        PP_Message* message;
//        PP_Message_Builder* messageBuilder = [PP_Message builder];
//        [messageBuilder setUid:[[[Global sharedGlobal] player] uid]];
//        if([[[Global sharedGlobal] player] uid] == 10001){
//            [messageBuilder setUid:10001];
//            [messageBuilder setTargetUid:10002];
//        }else{
//            [messageBuilder setUid:10002];
//            [messageBuilder setTargetUid:10001];
//        }
//        [messageBuilder setContent:@"你好大白痴！"];
//        message = [messageBuilder build];
//        package.head.type = CHAT;
//        package.head.length = message.serializedSize;
//        strcpy(package.content, message.data.bytes);
//        send(sockfd, &package, package.head.length + sizeof(package.head), 0);
//        NSLog(@"chat message sent");
//    }
}

-(void)registSuccess
{
    [[[[Global sharedGlobal] gameLayer] loginLayer] performSelector:@selector(registSuccess)];
}

-(void)doRegist:(NSString *)avatarURL nickname:(NSString *)nickname username:(NSString *)username password:(NSString *)password
{
//    PP_Package package;
//    PP_RegistPack* registPack;
//    PP_RegistPack_Builder* registPackBuilder = [PP_RegistPack builder];
//    [registPackBuilder setAccount:[[[[[registPackBuilder account] builder] setUsername:username] setPassword:[Global md5:password]] build]];
//    [registPackBuilder setNickname:nickname];
//    [registPackBuilder setDuid:[Utils genUDID]];
//    if(avatarURL) [registPackBuilder setAvatarImg:avatarURL];
//    registPack = [registPackBuilder build];
//    package.head.type = REGIST;
//    package.head.length = registPack.serializedSize;
//    NSLog(@"注册发出数据量:%d", registPack.serializedSize);
//    memcpy(package.content, registPack.data.bytes, package.head.length);
//    send(sockfd, &package, package.head.length + sizeof(package.head), 0);
}

-(void)sendHeartBeat
{
//    PP_Package package;
//    PP_UserState* hb = [[[[PP_UserState builder] setUid:[[[Global sharedGlobal] player] uid]] setState:FOREGROUND] build];
//    
//    package.head.type = HEART_BEAT;
//    package.head.length = hb.serializedSize;
//    NSLog(@"心跳包发出数据量:%d", hb.serializedSize);
//    memcpy(package.content, hb.data.bytes, package.head.length);
//    send(sockfd, &package, sizeof(package.head) + package.head.length, 0);
}

-(void)doLogin:(NSString *)username pass:(NSString *)password
{
    PP_Package* package;
    PP_Package_Builder* packageBuilder = [[[[PP_Package builder] setType:100890] setLength:100001] setMore:1];
    PP_Account* acc = [[[[PP_Account builder] setUsername:username] setPassword:[Global md5:password]] build];
    PP_LoginPack* loginPack = [[[[[[PP_LoginPack builder] setAccount:acc] setLoginMode:PP_LOGIN] setVersion:1] setDuid:[Utils genUDID]] build];
//    package.head.type = LOGIN;
//    package.head.length = loginPack.serializedSize;
    NSString* str = [NSString stringWithCString:[[loginPack data] bytes] encoding:[NSString defaultCStringEncoding]];
    NSLog(@"%@", str);
    [packageBuilder setContent:[loginPack data]];
    package = [packageBuilder build];
    NSLog(@"登录发出数据量:%d", package.serializedSize);
    NSLog(@"loginMode:%d", [loginPack loginMode]);
    NSLog(@"%s", [[loginPack data] bytes]);
    
    //memcpy(package.content, [[loginPack data] bytes], package.head.length);
    ssize_t t = send(sockfd, [[package data] bytes], package.serializedSize, 0);
    NSLog(@"%zd", t);
}

-(void)enterBackground
{
//    PP_Package package;
//    PP_UserState* userState = [[[[PP_UserState builder] setUid:1] setState:BACKGROUND_STATE] build];
//    
//    package.head.type = BACKGROUND;
//    package.head.length = userState.serializedSize;
//    memcpy(package.content, &userState, package.head.length);
//    send(sockfd, &package, package.head.length + sizeof(package.head), 0);
}

-(void)enterForeground
{
//    PP_Package package;
//    PP_UserState* userState = [[[[PP_UserState builder] setUid:1] setState:FOREGROUND_STATE] build];
//    
//    package.head.type = FOREGROUND;
//    package.head.length = userState.serializedSize;
//    memcpy(package.content, &userState, package.head.length);
//    send(sockfd, &package, package.head.length + sizeof(package.head), 0);
//    [[userState builder] clear];
}

-(void)attackStartWithNSArray:(NSArray *)array
{
//    PP_Package package;
//    PP_Attack_Builder* attackBuilder = [PP_Attack builder];
//    for (BattlePetSpriteController* battlePetController in array) {
//        PP_Pet* pet = (PP_Pet*)[battlePetController data];
//        PP_BattlePet* battlePet = (PP_BattlePet*)[battlePetController targetData];
//        PP_GameControl* gameControl = [[[[[PP_GameControl builder] setPetId:[pet petId]] setSkillId:1] setTargetId:[battlePet mid]] build];
//        [attackBuilder addGameControl:gameControl];
//    }
//    PP_Attack* attack = [attackBuilder build];
//    package.head.type = BATTLE_ATTACK;
//    package.head.length = attack.serializedSize;
//    NSLog(@"攻击包数据:%d", attack.serializedSize);
//    memcpy(package.content, [[attack data] bytes], package.head.length);
//    send(sockfd, &package, package.head.length + sizeof(package.head), 0);
    //[[attack builder] clearGameControl];
    //[[attack builder] clear];
}

-(void)chatWithUserId:(int)uid content:(NSString *)content
{
    
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
