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
#import "PP_Body.pb.h"

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
        [[Global sharedGlobal] isConnected:NO];
        [self performSelectorOnMainThread:@selector(showConnectErrorTip:) withObject:@"创建连接失败!" waitUntilDone:YES];
        return;
    }
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = inet_addr([[[[Global sharedGlobal] serverInfo] ip] UTF8String]);
    addr.sin_port = htons([[[Global sharedGlobal] serverInfo] port]);
    bzero(addr.sin_zero, 8);
    int conn = connect(sockfd, (struct sockaddr *)&addr, sizeof(struct sockaddr));
    if(conn != -1){
        [[Global sharedGlobal] isConnected:YES];
        int bufferSize = 7;
        char readBuffer[bufferSize];
        memset(&readBuffer, 0, bufferSize);
        while (1) {
            int bytes = recv(sockfd, readBuffer, bufferSize, 0);
            if (bytes == 0) {
                [[Global sharedGlobal] isConnected:NO];
                [self performSelectorOnMainThread:@selector(showConnectErrorTip:) withObject:@"服务器已经关闭！" waitUntilDone:YES];
                break;
            }else{
                @try {
                    PP_Package* b = [PP_Package parseFromData:[NSData dataWithBytes:readBuffer length:bufferSize]];
                    int contentSize = [b length];
                    char content[contentSize];
                    recv(sockfd, content, contentSize, 0);
                    
                    [self increaseDataUse: bufferSize + contentSize];
                    
                    PP_Body* body = [PP_Body parseFromData:[NSData dataWithBytes:content length:contentSize]];
                    switch ([body type]) {
                        case REGIST:{
                            PP_CLUser* userData = [PP_CLUser parseFromData:[body content]];
                            [[Global sharedGlobal] player:userData];
                            [self performSelectorOnMainThread:@selector(registSuccess) withObject:nil waitUntilDone:YES];
                        }break;
                        case IS_LAST_USER_DATA:{
                            [self performSelectorOnMainThread:@selector(loginSuccess:) withObject:@"YES" waitUntilDone:YES];
                        }break;
                        case LOGIN:{
                            PP_CLUser* userData = [PP_CLUser parseFromData:[body content]];
                            [[Global sharedGlobal] player:userData];
                            [self performSelectorOnMainThread:@selector(loginSuccess:) withObject:@"NO" waitUntilDone:YES];
                        }break;
                        case CHAT:{
                            PP_Message* message = [PP_Message parseFromData:[body content]];
                            NSLog(@"%@", [message content]);
                        }break;
                        case DATA_ERROR:{
                            PP_Error* error = [PP_Error parseFromData:[body content]];
                            [self performSelectorOnMainThread:@selector(showErrorAlert:) withObject:error waitUntilDone:YES];
                        }break;
                            
                        default:
                            break;
                    }
                }
                @catch (NSException *exception) {
                    NSLog(@"data is error");
                }
                @finally {
                    
                }
            }
        }
    }else{
        [self performSelectorOnMainThread:@selector(showConnectErrorTip:) withObject:@"连接服务失败!" waitUntilDone:YES];
        [[Global sharedGlobal] isConnected:NO];
    }
    NSLog(@"pool release");
    [pool release];
    
    [thread cancel];
    [thread release];
    thread = nil;
}

-(void)showConnectErrorTip:(NSString*)info
{
    [[[Global sharedGlobal] popUpLayer] showErrorAlertWithTitle:@"连接失败!" info:info];
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
        
//        PP_Package* package;
//        PP_Package_Builder* packageBuilder = [PP_Package builder];
//        PP_Body* body;
//        PP_Body_Builder* bodyBuilder = [PP_Body builder];
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
//        [bodyBuilder setType:CHAT];
//        [bodyBuilder setContent:[message data]];
//        body = [bodyBuilder build];
//        [packageBuilder setLength:[body serializedSize]];
//        [packageBuilder setBody:body];
//        package = [packageBuilder build];
//        
//        [self sendData:package];
//        NSLog(@"chat message sent");
    }
}

-(void)registSuccess
{
    [[[[Global sharedGlobal] gameLayer] loginLayer] performSelector:@selector(registSuccess)];
}

-(void)doRegist:(NSString *)avatarURL nickname:(NSString *)nickname username:(NSString *)username password:(NSString *)password
{
    PP_Package* package;
    PP_Package_Builder* packageBuilder = [PP_Package builder];
    PP_Body* body;
    PP_Body_Builder* bodyBuider = [PP_Body builder];
    
    PP_RegistPack* registPack;
    PP_RegistPack_Builder* registPackBuilder = [PP_RegistPack builder];
    [registPackBuilder setAccount:[[[[[registPackBuilder account] builder] setUsername:username] setPassword:[Global md5:password]] build]];
    [registPackBuilder setNickname:nickname];
    [registPackBuilder setDuid:[Utils genUDID]];
    if(avatarURL) [registPackBuilder setAvatarImg:avatarURL];
    registPack = [registPackBuilder build];
    
    [bodyBuider setType:REGIST];
    [bodyBuider setContent:[registPack data]];
    body = [bodyBuider build];
    
    [packageBuilder setLength:[body serializedSize]];
    [packageBuilder setBody:body];
    package = [packageBuilder build];
    
    [self sendData:package];
    
    [bodyBuider clear];
    [registPackBuilder clear];
    [packageBuilder clear];
}

-(void)sendHeartBeat
{
    PP_Package* package;
    PP_Package_Builder* packageBuilder = [PP_Package builder];
    PP_Body* body;
    PP_Body_Builder* bodyBuilder = [PP_Body builder];
    
    PP_UserState* hb = [[[[PP_UserState builder] setUid:[[[Global sharedGlobal] player] uid]] setState:FOREGROUND] build];
    
    [bodyBuilder setType:HEART_BEAT];
    [bodyBuilder setContent:[hb data]];
    body = [bodyBuilder build];
    
    [packageBuilder setLength:[body serializedSize]];
    [packageBuilder setBody:body];
    package = [packageBuilder build];
    
    [self sendData:package];
    
    [bodyBuilder clear];
    [[hb builder] clear];
    [packageBuilder clear];
}

-(void)doLogin:(NSString *)username pass:(NSString *)password
{
    PP_Body* body;
    PP_Body_Builder* bodyBuilder = [[PP_Body builder] setType:LOGIN];
    PP_Package* package;
    PP_Package_Builder* packageBuilder = [PP_Package builder];
    PP_Account* acc = [[[[PP_Account builder] setUsername:username] setPassword:[Global md5:password]] build];
    PP_LoginPack* loginPack = [[[[[[PP_LoginPack builder] setAccount:acc] setLoginMode:PP_LOGIN] setVersion:0] setDuid:[[Global sharedGlobal] duid]] build];
    [bodyBuilder setContent:[loginPack data]];
    body = [bodyBuilder build];
    [packageBuilder setLength:body.serializedSize];
    [packageBuilder setBody:body];
    package = [packageBuilder build];
    
    [self sendData:package];
    
    [bodyBuilder clear];
    [[acc builder] clear];
    [[loginPack builder] clear];
    [packageBuilder clear];
}

- (void)sendData:(PP_Package*)package
{
    if ([[Global sharedGlobal] isConnected]) {
        ssize_t t = send(sockfd, [[package data] bytes], package.serializedSize, 0);
        [self increaseDataUse:t];
    }
}

- (void)increaseDataUse:(int)num
{
    int nowSize = [[Global sharedGlobal] totalDataUse];
    [[Global sharedGlobal] totalDataUse:nowSize + num];
}

-(void)enterBackground
{
    PP_Package* package;
    PP_Package_Builder* packageBuilder = [PP_Package builder];
    PP_Body* body;
    PP_Body_Builder* bodyBuilder = [PP_Body builder];
    PP_UserState* userState = [[[[PP_UserState builder] setUid:1] setState:BACKGROUND_STATE] build];
    
    [bodyBuilder setType:BACKGROUND];
    [bodyBuilder setContent:[userState data]];
    body = [bodyBuilder build];
    
    [packageBuilder setLength:[body serializedSize]];
    [packageBuilder setBody:body];
    package = [packageBuilder build];
    
    [self sendData:package];
    [bodyBuilder clear];
    [[userState builder] clear];
    [packageBuilder clear];
}

-(void)enterForeground
{
    PP_Package* package;
    PP_Body* body;
    PP_Package_Builder* packageBuilder = [PP_Package builder];
    PP_Body_Builder* bodyBuilder = [PP_Body builder];
    PP_UserState* userState = [[[[PP_UserState builder] setUid:10001] setState:FOREGROUND_STATE] build];
    
    [bodyBuilder setType:FOREGROUND];
    [bodyBuilder setContent:[userState data]];
    body = [bodyBuilder build];
    [packageBuilder setLength:[body serializedSize]];
    package = [packageBuilder build];
    
    [self sendData:package];
    [[userState builder] clear];
    [bodyBuilder clear];
    [packageBuilder clear];
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
                    alertStr = @"该帐号不存在！";
                    break;
                case USER_ALREADY_ONLINE:
                    alertStr = @"玩家已经在线！";
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
        case CHAT_ERROR:{
            NSString* alertStr;
            switch ([errorPack errorId]) {
                case USER_NOT_EXIST:
                    alertStr = @"不存在该玩家!";
                    break;
                case USER_IS_NOT_ONLINE:
                    alertStr = @"该玩家当前不在线!";
                    break;
                    
                default:
                    break;
            }
            [[[Global sharedGlobal] popUpLayer] showErrorAlertWithTitle:@"消息发送失败!" info:alertStr];
        }break;
        default:
            break;
    }
}

@end
