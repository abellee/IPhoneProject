//
//  RightSideViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-1.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "RightSideViewController.h"
#import "Utility.h"
#import "UIImage+Extensions.h"

@interface RightSideViewController ()

@end

@implementation RightSideViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    functions = [[NSArray alloc] initWithObjects:@"更改当前位置", @"关于可以点", @"反馈意见", nil];
    
    UIImage* backgroundImage = [UIImage getImageWithFileName:@"gddi1"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 230, 2, 220, 45)];
    searchBar.backgroundColor = [UIColor clearColor];
    searchBar.placeholder = @"搜索";
    [[searchBar.subviews objectAtIndex:0] removeFromSuperview];
    
    [self.view addSubview:searchBar];
    
    functionList = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    functionList.tableView.dataSource = self;
    functionList.tableView.delegate = self;
    functionList.tableView.backgroundColor = [UIColor clearColor];
    [functionList.tableView setSeparatorColor:[UIColor darkGrayColor]];
    functionList.tableView.tableHeaderView.backgroundColor = [UIColor clearColor];
    functionList.tableView.scrollEnabled = NO;
    [functionList.tableView setFrame:CGRectMake(self.view.frame.size.width - 240, 50, 240, self.view.frame.size.height - 250)];
    [self.view addSubview:functionList.tableView];
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
    UIImage* cellImage = [UIImage getImageWithFileName:@"gdjt"];
    cell.imageView.image = cellImage;
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
