//
//  MessageListViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-19.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "MessageListViewController.h"
#import "RefreshTableViewController.h"
#import "Global.h"
#import "Message.h"
#import "UIImage+Extensions.h"
#import "MessageDetailViewController.h"

@interface MessageListViewController ()

@end

@implementation MessageListViewController

- (id)init
{
    if (self = [super init]) {
        title = @"消息";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    Message* message0 = [[Message alloc] init];
    message0.content = @"消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01消息01adfasfd";
    message0.title = @"消息01";
    
    Message* message1 = [[Message alloc] init];
    message1.content = @"消息02消息02消息02消息02消息02消息02消息02消息02消息02消息02消息02消息02消息02消息02";
    message1.title = @"消息02";
    
    [[Global sharedInstance] addMessageToList:message0];
    [[Global sharedInstance] addMessageToList:message1];
    
    messageList = [[RefreshTableViewController alloc] initWithStyle:UITableViewStylePlain];
    messageList.view.backgroundColor = [UIColor clearColor];
    messageList.tableView.backgroundView = nil;
    messageList.tableView.dataSource = self;
    messageList.tableView.delegate = self;
    messageList.refreshDelegate = self;
    [messageList.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    [self.view addSubview:messageList.view];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* messageListCell = @"MessageListCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:messageListCell];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:messageListCell] autorelease];
    }
    
    Message* msg = [[[Global sharedInstance] messageList] objectAtIndex:indexPath.row];
    if (msg) {
        [cell.textLabel setText:msg.title];
        [cell.textLabel setTextColor:[UIColor grayColor]];
        [cell.textLabel setFont:[UIFont systemFontOfSize:18.0]];
        UIImage* arrowImage = [UIImage getImageWithFileName:@"y2jian"];
        UIImageView* arrowImageView = [[UIImageView alloc] initWithImage:arrowImage];
        cell.accessoryView = arrowImageView;
        [arrowImageView release];
    }
    
    return cell;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[Global sharedInstance] messageList] count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO animated:YES];
    Message* msg = [[[Global sharedInstance] messageList] objectAtIndex:indexPath.row];
    if (detailViewController == nil) {
        detailViewController = [[MessageDetailViewController alloc] initWithMessage:msg];
    }else{
        [detailViewController resetMessage:msg];
    }
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [messageList release];
    if (detailViewController) {
        [detailViewController release];
    }
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma RefreshTableViewController delegate function
- (void)reloadData
{
    [messageList performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:0.3];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [messageList scrollViewDidScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [messageList scrollViewDidEndDragging];
}



@end
