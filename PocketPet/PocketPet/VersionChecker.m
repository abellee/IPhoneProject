//
//  VersionChecker.m
//  PocketPet
//
//  Created by Lee Abel on 13-1-17.
//
//

#import "VersionChecker.h"
#import "JSONKit.h"
#import "SystemConfig.h"
#import "Global.h"
#import "Utils.h"

@implementation VersionChecker

- (void)versionCheck{
    if (([Utils secTimeSince1970] - [[Global sharedGlobal] getLastVersionCheck]) / 3600 < UPDATE_CHECK_DALEY) {
        return;
    }
    NSString* appId = [[Global sharedGlobal] getAppId];
    if (appId) {
        [[Global sharedGlobal] setLastVersionCheck:[Utils secTimeSince1970]];
        NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", ITUNES_URL, appId]];
        [self performSelectorInBackground:@selector(checkSoftwareVersion:) withObject:url];
    }
}

- (void)checkSoftwareVersion:(NSURL*)url
{
    NSString* curVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleVersionKey];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSURLResponse* response;
    NSData* returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSString* returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    NSDictionary* dict = [returnString objectFromJSONString];
    NSString* newVersion = [[[dict valueForKey:@"results"] objectAtIndex:0] valueForKey:@"version"];
    if (![curVersion isEqualToString:newVersion]) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"有新版本啦！" message:@"亲!有新版本啦,更新一下呗^_^" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert setDelegate:self];
        [alert show];
        [alert release];
        alert = nil;
    }
    [returnString release];
    returnString = nil;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/sandman/id%@?mt=8&uo=4", [[Global sharedGlobal] getAppId]]]];
    }
    [[Global sharedGlobal] checkVersionFinish];
}

@end
