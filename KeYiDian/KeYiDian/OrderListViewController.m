//
//  OrderListViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-3.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "OrderListViewController.h"
#import "OrderFormView.h"
#import "OrderAdditionHeadCell.h"
#import "OrderFoodCell.h"

@interface OrderListViewController ()

@end

@implementation OrderListViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)initWithData:(NSMutableArray *)data andTitle:(NSString *)titleStr
{
    if (self = [super init]) {
        title = titleStr;
        listData = data;
        
        sectionViews = [[NSMutableArray alloc] initWithCapacity:0];
        
        tableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
        tableViewController.tableView.dataSource = self;
        tableViewController.tableView.delegate = self;
        tableViewController.tableView.backgroundColor = [UIColor clearColor];
        tableViewController.tableView.showsVerticalScrollIndicator = NO;
        tableViewController.tableView.showsHorizontalScrollIndicator = NO;
        tableViewController.tableView.backgroundView = nil;
        [tableViewController.tableView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
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
    static NSString* orderFoodCellStr = @"orderFoodCell";
    OrderFoodCell* cell = [tableView dequeueReusableCellWithIdentifier:orderFoodCellStr];
    if (cell == nil) {
        cell = [[[OrderFoodCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderFoodCellStr andFoodInfo:nil] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([sectionViews count] > section && [[sectionViews objectAtIndex:section] isOpen]) {
        return 10;
    }
    return 0;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if ([sectionViews count] > section && [sectionViews objectAtIndex:section]) {
        return [sectionViews objectAtIndex:section];
    }
    OrderFormView* sectionView = [[OrderFormView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 120) andOrderInfo:nil];
    sectionView.tag = section;
    [sectionView addTarget:self action:@selector(headerViewTapped:) forControlEvents:UIControlEventTouchUpInside];
    [sectionViews addObject:sectionView];
    return [sectionView autorelease];
}

- (void)headerViewTapped:(id)sender
{
    OrderFormView* sectionView = (OrderFormView*)sender;
    if (sectionView) {
        [sectionView isOpen:!sectionView.isOpen];
        [tableViewController.tableView reloadSections:[NSIndexSet indexSetWithIndex:sectionView.tag] withRowAnimation:UITableViewRowAnimationNone];
    }
}

- (float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 120;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
