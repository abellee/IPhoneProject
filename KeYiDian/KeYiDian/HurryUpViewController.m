//
//  HurryUpViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-6.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "HurryUpViewController.h"
#import "HurryUpHeadView.h"
#import "RefreshTableViewController.h"
#import "OrderFoodCell.h"
#import "OrderAdditionHeadCell.h"

@interface HurryUpViewController ()

@end

@implementation HurryUpViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)initWithOrderInfoList:(NSMutableArray *)array
{
    if (self = [super init]) {
        title = @"我要催单";
        
        headViewList = [[NSMutableArray alloc] initWithCapacity:0];
        
        noticeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
        [noticeLabel setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:87.0/255.0 blue:0.0/255.0 alpha:1.0]];
        [noticeLabel setText:@"订单提交成功30分钟后方可催单！"];
        [noticeLabel setTextColor:[UIColor whiteColor]];
        [noticeLabel setTextAlignment:NSTextAlignmentCenter];
        [noticeLabel setFont:[UIFont systemFontOfSize:14.0]];
        [self.view addSubview:noticeLabel];
        
        tableViewController = [[RefreshTableViewController alloc] initWithStyle:UITableViewStylePlain];
        tableViewController.tableView.dataSource = self;
        tableViewController.tableView.delegate = self;
        tableViewController.tableView.backgroundColor = [UIColor clearColor];
        tableViewController.tableView.showsVerticalScrollIndicator = NO;
        tableViewController.refreshDelegate = self;
        [tableViewController.tableView setFrame:CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height)];
        [self.view addSubview:tableViewController.view];
    }
    return self;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        static NSString* orderAddCellStr = @"orderAdditionHeadCell";
        OrderAdditionHeadCell* headCell = [tableView dequeueReusableCellWithIdentifier:orderAddCellStr];
        if (headCell == nil) {
            headCell = [[[OrderAdditionHeadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderAddCellStr andOrderInfo:nil] autorelease];
            headCell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return headCell;
    }
    static NSString* cellStr = @"hurryUpCell";
    OrderFoodCell* cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (cell == nil) {
        cell = [[[OrderFoodCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr andFoodInfo:nil] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section < [headViewList count] && [headViewList objectAtIndex:section] && [[headViewList objectAtIndex:section] isOpened]) {
        return 10;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section < [headViewList count] && [headViewList objectAtIndex:section]) {
        return [headViewList objectAtIndex:section];
    }
    HurryUpHeadView* headView = [[HurryUpHeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 70) andOrderInfo:nil];
    headView.backgroundColor = [UIColor colorWithRed:246.0/255.0 green:246.0/255.0 blue:246.0/255.0 alpha:1.0];
    headView.layer.shadowColor = [UIColor blackColor].CGColor;
    headView.layer.shadowOffset = CGSizeMake(0, 0);
    headView.layer.shadowOpacity = 0.2;
    headView.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, headView.frame.size.width, headView.frame.size.height) cornerRadius:0.0].CGPath;
    headView.layer.shadowRadius = 2.0;
    [headViewList addObject:headView];
    headView.tag = section;
    [headView addTarget:self action:@selector(headViewPressed:) forControlEvents:UIControlEventTouchUpInside];
    return [headView autorelease];
}

- (float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 70;
}

- (void)headViewPressed:(id)sender
{
    HurryUpHeadView* headView = (HurryUpHeadView*)sender;
    if (headView) {
        [headView isOpened:!headView.isOpened];
        [tableViewController.tableView reloadSections:[NSIndexSet indexSetWithIndex:headView.tag] withRowAnimation:UITableViewRowAnimationNone];
    }
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
