//
//  LeftSideViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-1.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "LeftSideViewController.h"
#import "UIImage+Extensions.h"
#import "Global.h"
#import "KYDUser.h"
#import "Definitions.h"
#import "SimpleButton.h"
#import "Utility.h"

@interface LeftSideViewController ()

@end

@implementation LeftSideViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    functions = [[NSArray alloc] initWithObjects:@"处理中订单", @"一个月内订单", @"送餐地址管理", @"我的收藏", @"评论管理", @"催单回复", nil];
    
    UIImage* backgroundImage = [UIImage getImageWithFileName:@"gddi1"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
    avatarBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [avatarBtn setFrame:CGRectMake(5, 5, 60, 60)];
    [self.view addSubview:avatarBtn];
    
    float usernameFontSize = 18.0;
    NSString* usernameStr = [[[Global sharedInstance] kydUser] username];
    if (usernameStr == nil) {
        usernameStr = @"未登录";
    }
    CGSize usernameSize = [usernameStr sizeWithFont:[UIFont boldSystemFontOfSize:usernameFontSize]];
    usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 15, usernameSize.width, usernameSize.height)];
    [usernameLabel setText:usernameStr];
    [usernameLabel setBackgroundColor:[UIColor clearColor]];
    [usernameLabel setFont:[UIFont boldSystemFontOfSize:usernameFontSize]];
    [usernameLabel setTextColor:[UIColor grayColor]];
    [self.view addSubview:usernameLabel];
    
    float messageNumFontSize = 14.0;
    NSString* messageNumStr = [NSString stringWithFormat:@"(消息%d)", [[Global sharedInstance] messageNum]];
    CGSize messageNumSize = [messageNumStr sizeWithFont:[UIFont boldSystemFontOfSize:messageNumFontSize]];
    messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 40, messageNumSize.width, messageNumSize.height)];
    [messageLabel setText:messageNumStr];
    [messageLabel setBackgroundColor:[UIColor clearColor]];
    [messageLabel setFont:[UIFont boldSystemFontOfSize:messageNumFontSize]];
    [messageLabel setTextColor:[UIColor grayColor]];
    [self.view addSubview:messageLabel];
    
    float logoffFontSize = 16.0;
    NSString* logoffStr = @"注销";
    CGSize logoffSize = [logoffStr sizeWithFont:[UIFont boldSystemFontOfSize:logoffFontSize]];
    logoffBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [logoffBtn setTitle:logoffStr forState:UIControlStateNormal];
    [[logoffBtn titleLabel] setFont:[UIFont boldSystemFontOfSize:logoffFontSize]];
    [logoffBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [logoffBtn setFrame:CGRectMake(240 - logoffSize.width - 10, 35, logoffSize.width, logoffSize.height)];
    [self.view addSubview:logoffBtn];
    
    functionList = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    functionList.tableView.dataSource = self;
    functionList.tableView.delegate = self;
    functionList.tableView.backgroundColor = [UIColor clearColor];
    [functionList.tableView setSeparatorColor:[UIColor darkGrayColor]];
    functionList.tableView.tableHeaderView.backgroundColor = [UIColor clearColor];
    functionList.tableView.scrollEnabled = NO;
    [functionList.tableView setFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height - 100)];
    [self.view addSubview:functionList.tableView];
    
    hurryButton = [[SimpleButton alloc] initWithStateImage:@"cuidan0" hilighted:@"cuidan1" selected:nil];
    hurryButton.center = CGPointMake(120, self.view.frame.size.height - 30);
    [hurryButton addTarget:self action:@selector(hurryUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hurryButton];
}

- (void)hurryUp:(id)sender
{
    NSLog(@"hurry up");
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* functionCell = @"functionCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:functionCell];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:functionCell] autorelease];
    }
    
    [[cell textLabel] setText:[functions objectAtIndex:indexPath.row]];
    [[cell textLabel] setTextColor:[UIColor lightGrayColor]];
    [[cell textLabel] setFont:[UIFont systemFontOfSize:18.0]];
    cell.imageView.image = [UIImage getImageWithFileName:[NSString stringWithFormat:@"icon0%d", indexPath.row + 1]];
    cell.selectedBackgroundView = [[[UIView alloc] initWithFrame:cell.frame] autorelease];
    cell.selectedBackgroundView.backgroundColor = [UIColor darkGrayColor];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [functions count];
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* headerView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 30)] autorelease];
    headerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage getImageWithFileName:@"grzx_dh02"]];
    
    CGSize headerTextSize = [Utility getCGSizeWithFontSize:14.0 str:@"常用" isBold:YES];
    UILabel* headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 3, headerTextSize.width, headerTextSize.height)];
    headerLabel.backgroundColor = [UIColor clearColor];
    [headerLabel setFont:[UIFont boldSystemFontOfSize:14.0]];
    [headerLabel setTextColor:[UIColor grayColor]];
    [headerLabel setText:@"常用"];
    [headerView addSubview:headerLabel];
    [headerLabel release];
    
    return headerView;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
