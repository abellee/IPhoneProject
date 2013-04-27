//
//  CommentManagerViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-6.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "CommentManagerViewController.h"
#import "RefreshTableViewController.h"
#import "CommentItemViewController.h"

@interface CommentManagerViewController ()

@end

@implementation CommentManagerViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)initWithCommentData:(NSMutableArray *)array
{
    if (self = [super init]) {
        title = @"评价管理";
        commentDataArray = [array retain];
        
        tableViewController = [[RefreshTableViewController alloc] initWithStyle:UITableViewStylePlain];
        tableViewController.tableView.dataSource = self;
        tableViewController.tableView.delegate = self;
        tableViewController.tableView.backgroundColor = [UIColor clearColor];
        tableViewController.tableView.showsVerticalScrollIndicator = NO;
        tableViewController.refreshDelegate = self;
        [tableViewController.tableView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [self.view addSubview:tableViewController.view];
    }
    return self;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* commentManagerCellStr = @"commentManagerCellStr";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:commentManagerCellStr];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:commentManagerCellStr] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    CommentItemViewController* commentItem = [[CommentItemViewController alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80) withCommentInfo:nil];
    [cell.contentView addSubview:commentItem.view];
    [commentItem release];
    return cell;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    [label setText:@"    汉堡"];
    [label setTextColor:[UIColor darkGrayColor]];
    [label setBackgroundColor:[UIColor colorWithRed:231.0/255.0 green:231.0/255.0 blue:231.0/255.0 alpha:1.0]];
    [label setFont:[UIFont boldSystemFontOfSize:16.0]];
    return [label autorelease];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}

#pragma RefreshTableViewController delegate function
- (void)reloadData
{
    [tableViewController performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:0.3];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [tableViewController scrollViewDidScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [tableViewController scrollViewDidEndDragging];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
