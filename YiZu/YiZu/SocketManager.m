//
//  SocketManager.m
//  YiZu
//
//  Created by Lee Abel on 12-8-25.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "SocketManager.h"
#import "Global.h"
#import "LoginViewController.h"
#import "ServerInfo.h"
#import "HTTPManager.h"
#import "GameLayer.h"
#import "PP_Package.h"
#import "PopUpLayer.h"
#import "PlayerData.h"

@implementation SocketManager

@synthesize thread;
//@synthesize hbThread;

-(void)connect
{
    if(thread == nil){
        thread = [[NSThread alloc] initWithTarget:self selector:@selector(connectToServer) object:nil];
        [thread setName:@"socket_thread"];
        [thread start];
    }
    /*if(hbThread == nil){
        hbThread = [[NSThread alloc] initWithTarget:self selector:@selector(hbThreadFunc) object:nil];
        [hbThread setName:@"heart_beat_thread"];
        [hbThread start];
    }*/
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
        /*PP_Package package;
        PP_LoginPack loginPack;
        strcpy(loginPack.account.username, "abellee87@gmail.com");
        strcpy(loginPack.account.password, "lijinbei");
        loginPack.login_mode = PP_LOGIN;
        loginPack.version = 0;
        package.head.type = LOGIN;
        memcpy(package.content, &loginPack, sizeof(loginPack));
        package.head.length = sizeof(loginPack);
        send(sockfd, &package, sizeof(loginPack) + sizeof(package.head), 0);
        [self performSelectorOnMainThread:@selector(callMain:) withObject:@"hello main" waitUntilDone:NO];*/
        
        char readBuffer[8];
        memset(&readBuffer, 0, sizeof(readBuffer));
        //int br = 0;
//        while ((br = recv(sockfd, readBuffer, sizeof(readBuffer), 0)) < sizeof(readBuffer)) {
//            PP_Package* b = (PP_Package*)readBuffer;
//            NSLog(@"from server:%d", b->head.length);
//            //[readData appendBytes:readBuffer length:br];
//            //NSLog(@"from server:%@", [[NSString alloc] initWithData:readData encoding:NSUTF8StringEncoding]);
//        }
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
                        PP_CLUser* userData = (PP_CLUser*)content;
                        NSString* avatarImg = [Global gbencodingWithChar:userData->avatar_img];
                        NSString* nickname = [Global gbencodingWithChar:userData->nickname];
                        NSString* signature = [Global gbencodingWithChar:userData->signature];
                        NSString* hobby = [Global gbencodingWithChar:userData->hobby];
                        NSString* job = [Global gbencodingWithChar:userData->job];
                        NSString* telephone = [Global gbencodingWithChar:userData->telephone];
                        PlayerData* playerData = [[PlayerData alloc] init];
                        playerData.nickname = nickname;
                        playerData.avatar_img = avatarImg;
                        playerData.signature = signature;
                        playerData.hobby = hobby;
                        playerData.job = job;
                        playerData.telephone = telephone;
                        
                        playerData.uid = userData->uid;
                        playerData.sex = userData->sex;
                        playerData.age = userData->age;
                        playerData.constellation = userData->constellation;
                        playerData.birthday = userData->birthday;
                        playerData.blood_type = userData->blood_type;
                        playerData.nation = userData->nation;
                        playerData.province = userData->province;
                        playerData.city = userData->city;
                        playerData.coin = userData->coin;
                        playerData.token = userData->token;
                        playerData.level = userData->level;
                        playerData.country = userData->country;
                        playerData.resource_num = userData->resource_num;
                        playerData.pet_num = userData->pet_num;
                        playerData.bag_num = userData->bag_num;
                        playerData.create_time = userData->acc_time.create_time;
                        playerData.last_login = userData->acc_time.last_login;
                        playerData.home_latitude = userData->home_location.latitude;
                        playerData.home_longitude = userData->home_location.longitude;
                        
                        [[Global sharedGlobal] player:playerData];
                        
                        [self performSelectorOnMainThread:@selector(loginSuccess:) withObject:@"NO" waitUntilDone:NO];
                        
                    }break;
                    case HEART_BEAT:{
                        //[self performSelector:@selector(sendHeartBeat) onThread:hbThread withObject:nil waitUntilDone:NO];
                        [self performSelectorInBackground:@selector(sendHeartBeat) withObject:nil];
                    }break;
                    case DATA_ERROR:{
                        PP_Error* errorPack = (PP_Error*)content;
                        switch (errorPack->errorType) {
                            case LOGIN_ERROR:{
                                NSString* alertStr;
                                switch (errorPack->errorId) {
                                    case LOGIN_FAILED:
                                        alertStr = @"帐号或密码不正确！";
                                        break;
                                    case USER_NOT_EXIST:
                                        alertStr = @"用户不存在！";
                                        break;
                                    default:
                                        break;
                                }
                                NSArray* args = [NSArray arrayWithObjects:[NSNumber numberWithInt:LOGIN_ERROR], [NSNumber numberWithInt:errorPack->errorId], alertStr, nil];
                                [self performSelectorOnMainThread:@selector(showErrorAlert:) withObject:args waitUntilDone:NO];
                                }break;
                            case REGIST_ERROR:{
                                NSString* alertStr;
                                switch (errorPack->errorId) {
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
                                NSArray* args = [NSArray arrayWithObjects:[NSNumber numberWithInt:REGIST_ERROR], [NSNumber numberWithInt:errorPack->errorId], alertStr, nil];
                                [self performSelectorOnMainThread:@selector(showErrorAlert:) withObject:args waitUntilDone:NO];
                            }break;
                            default:
                                break;
                        }
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
    PP_RegistPack registPack;
    if(avatarURL) strcpy(registPack.avatar_img, [avatarURL UTF8String]);
    strcpy(registPack.nickname, [nickname UTF8String]);
    strcpy(registPack.account.username, [username UTF8String]);
    strcpy(registPack.account.password, [[Global md5:password] UTF8String]);
    package.head.type = REGIST;
    package.head.length = sizeof(registPack);
    memcpy(package.content, &registPack, sizeof(registPack));
    send(sockfd, &package, sizeof(registPack) + sizeof(package.head), 0);
}

-(void)sendHeartBeat
{
    PP_Package package;
    PP_UserState hb;
    hb.uid = 1;
    hb.state = FOREGROUND;
    
    package.head.type = HEART_BEAT;
    package.head.length = sizeof(hb);
    memcpy(package.content, &hb, sizeof(hb));
    send(sockfd, &package, sizeof(package.head) + sizeof(hb), 0);
}

-(void)doLogin:(NSString *)username pass:(NSString *)password
{
    PP_Package package;
    PP_LoginPack loginPack;
    strcpy(loginPack.account.username, [username UTF8String]);
    strcpy(loginPack.account.password, [[Global md5:password] UTF8String]);
    loginPack.login_mode = PP_LOGIN;
    //loginPack.version = [[Global sharedGlobal] userDataVersion];
    loginPack.version = 100;
    package.head.type = LOGIN;
    memcpy(package.content, &loginPack, sizeof(loginPack));
    package.head.length = sizeof(loginPack);
    send(sockfd, &package, sizeof(loginPack) + sizeof(package.head), 0);
}

-(void)enterBackground
{
    PP_Package package;
    PP_UserState userState;
    userState.uid = 1;
    userState.state = BACKGROUND_STATE;
    
    package.head.type = BACKGROUND;
    package.head.length = sizeof(userState);
    memcpy(package.content, &userState, sizeof(userState));
    send(sockfd, &package, sizeof(userState) + sizeof(package.head), 0);
}

-(void)enterForeground
{
    PP_Package package;
    PP_UserState userState;
    userState.uid = 1;
    userState.state = FOREGROUND_STATE;
    
    package.head.type = FOREGROUND;
    package.head.length = sizeof(userState);
    memcpy(package.content, &userState, sizeof(userState));
    send(sockfd, &package, sizeof(userState) + sizeof(package.head), 0);
}

-(void)callMain:(NSString *)str
{
    NSLog(@"%@", str);
}

-(void)showErrorAlert:(NSArray *)args
{
    switch ([[args objectAtIndex:0] integerValue]) {
        case LOGIN_ERROR:{
            [[[Global sharedGlobal] popUpLayer] showErrorAlertWithTitle:@"登录失败!" info:[args objectAtIndex: 2]];
        }break;
        case REGIST_ERROR:{
            [[[Global sharedGlobal] popUpLayer] showErrorAlertWithTitle:@"注册失败!" info:[args objectAtIndex: 2]];
        }break;
        default:
            break;
    }
}

@end
