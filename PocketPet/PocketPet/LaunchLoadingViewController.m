//
//  LaunchLoadingViewController.m
//  PocketPet
//
//  Created by Lee Abel on 13-1-17.
//
//

#import "LaunchLoadingViewController.h"
#import "SystemConfig.h"
#import "JSONKit.h"
#import "Global.h"
#import "ASIHTTPRequest.h"
#import "ZipArchive.h"
#import "HTTPManager.h"
#import "GameLayer.h"
#import "ServerInfo.h"
#import "PopUpLayer.h"

@implementation LaunchLoadingViewController

- (id)init
{
    if (self = [super init]) {
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[Global sharedGlobal] totalWidth], [[Global sharedGlobal] totalHeight])];
        view.backgroundColor = [UIColor whiteColor];
        [self setView:view];
        [view release];
        view = nil;
        
        index = 0;
        tipText = [[UITextField alloc] initWithFrame:CGRectMake(([[Global sharedGlobal] totalWidth] - 400) / 2, [[Global sharedGlobal] totalHeight] - 100, 400, 40)];
        tipText.textAlignment = UITextAlignmentCenter;
        tipText.text = @"获取服务器信息...";
        [self.view addSubview:tipText];
        if (![[HTTPManager sharedHTTPManager] getSocketServerInfo]) {
            [[[Global sharedGlobal] popUpLayer] showErrorAlertWithTitle:@"提示" info:@"获取服务器信息失败!"];
        }else{
            [self performSelectorInBackground:@selector(getServerInfo) withObject:nil];
        }
    }
    return self;
}

- (void)getServerInfo
{
    [self updateTipText:@"正在检测更新..."];
    [self startCheck];
}

- (void)startCheck
{
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@", BASE_URL, DIR_NAME, UPDATE_CHECK]];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSURLResponse* response;
    NSData* returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSString* returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    NSDictionary* dict = [returnString objectFromJSONString];
    NSString* appId = [dict objectForKey:@"appId"];
    if (![appId isEqualToString:@""]) {
        if ([[Global sharedGlobal] getAppId]) {
            if(![appId isEqualToString:[[Global sharedGlobal] getAppId]]){
                [[Global sharedGlobal] setAppId:appId];
            }
        }else{
            [[Global sharedGlobal] setAppId:appId];
        }
    }
    
    int res_version = [[dict objectForKey:@"res_version"] intValue];
    if (res_version == 1) {
        [self updateTipText:@"检测到更新内容..."];
        [self fetchResList];
    }else{
        [self updateTipText:@"正在进入游戏..."];
        [[[Global sharedGlobal] gameLayer] performSelectorOnMainThread:@selector(enterGame) withObject:nil waitUntilDone:YES];
    }
    
    [returnString release];
    returnString = nil;
}

- (void)updateTipText:(NSString*)content
{
    [self performSelectorOnMainThread:@selector(chageTipText:) withObject:content waitUntilDone:YES];
}

- (void)chageTipText:(NSString*)content
{
    tipText.text = content;
}

- (void)fetchResList
{
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@?v=%d", BASE_URL, DIR_NAME, GET_RES_LIST, 1]];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSURLResponse* response;
    NSData* returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSString* returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    NSDictionary* dict = [returnString objectFromJSONString];
    resList = [[NSMutableArray arrayWithArray:[dict objectForKey:@"res"]] retain];
    [returnString release];
    returnString = nil;
    if ([resList count] > 0) {
        [self startDownloadNewResource];
    }else{
        [resList release];
        resList = nil;
    }
}

- (void)startDownloadNewResource
{
    [self updateTipText:@"开始下载更新内容..."];
    NSString* path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSLog(@"%@", path);
    NSURL* url = [NSURL URLWithString:[resList objectAtIndex:index]];
    NSString* fileName = [url lastPathComponent];
    ASIHTTPRequest* request = [ASIHTTPRequest requestWithURL:url];
    [request setDownloadDestinationPath:[path stringByAppendingPathComponent:fileName]];
    [request setDownloadProgressDelegate:self];
    [request setDelegate:self];
    [request startAsynchronous];
}

- (void)setProgress:(float)newProgress
{
    [self updateTipText:[NSString stringWithFormat:@"%f", newProgress]];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    index++;
    if (index >= [resList count]) {
        index = 0;
        [self updateTipText:@"正在解压资源..."];
        [self startUnZip];
        return;
    }
    [self startDownloadNewResource];
}

- (void)startUnZip
{
    [self updateTipText:[NSString stringWithFormat:@"正在解压资源...%d/%d", index + 1, [resList count]]];
    ZipArchive* unzip = [[ZipArchive alloc] init];
    NSString* path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString* fileName = [[resList objectAtIndex:index] lastPathComponent];
    if ([unzip UnzipOpenFile:[path stringByAppendingPathComponent:fileName] Password:UNZIP_PASSWORD]) {
        if ([unzip UnzipFileTo:path overWrite:YES]) {
            index++;
            [unzip UnzipCloseFile];
            [unzip release];
            unzip = nil;
            if (index >= [resList count]) {
                [self updateTipText:@"正在进入游戏..."];
                [[[Global sharedGlobal] gameLayer] performSelectorOnMainThread:@selector(enterGame) withObject:nil waitUntilDone:YES];
                return;
            }
            [self startUnZip];
        }
    }
}

- (void)dealloc
{
    NSLog(@"**************| LaunchLoadingViewController dealloc! |**************");
    [tipText release];
    [resList removeAllObjects];
    [resList release];
    
    tipText = nil;
    resList = nil;
    
    [super dealloc];
}

@end
