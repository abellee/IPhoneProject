//
//  CommentViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-5.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "CommentViewController.h"
#import "OrderInfo.h"
#import "Utility.h"
#import "UIImage+Extensions.h"
#import "FoodCommentViewController.h"
#import "ShopCommentViewController.h"

@interface CommentViewController ()

@end

@implementation CommentViewController

- (id)initWithOrderInfo:(OrderInfo *)info
{
    if (self = [super init]) {
        orderInfo = info;
        
        title = @"评价";
        
        tableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStyleGrouped];
        tableViewController.tableView.dataSource = self;
        tableViewController.tableView.delegate = self;
        tableViewController.tableView.backgroundColor = [UIColor clearColor];
        tableViewController.tableView.backgroundView = nil;
        [tableViewController.tableView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [self.view addSubview:tableViewController.tableView];
        
        UIImage* pingjiaNormal = [UIImage getImageWithFileName:@"pjanniu0"];
        UIImage* pingjiaHighlighted = [UIImage getImageWithFileName:@"pjanniu1"];
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:pingjiaNormal forState:UIControlStateNormal];
        [btn setBackgroundImage:pingjiaHighlighted forState:UIControlStateHighlighted];
        [btn setFrame:CGRectMake(0, 0, pingjiaNormal.size.width, pingjiaNormal.size.height)];
        
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, pingjiaNormal.size.width, pingjiaNormal.size.height)];
        [view addSubview:btn];
        
        UIBarButtonItem* barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
        self.navigationItem.rightBarButtonItem = barButtonItem;
        [view release];
        [barButtonItem release];
    }
    return self;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* commentCellStr = @"commentCellStr";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:commentCellStr];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:commentCellStr] autorelease];
        //cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIView* selectionBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
        selectionBackground.layer.cornerRadius = 5;
        selectionBackground.backgroundColor = [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:221.0/255.0];
        cell.selectedBackgroundView = selectionBackground;
        [selectionBackground release];
    }
    cell.textLabel.text = @"二两米餐饮";
    [cell.textLabel setFont:[UIFont systemFontOfSize:14.0]];
    [cell.textLabel setTextColor:[UIColor darkGrayColor]];
//    cell.detailTextLabel.text = @"15元/份";
//    [cell.detailTextLabel setFont:[UIFont systemFontOfSize:13.0]];
    
    NSString* pjStr = @"评价";
    UIFont* pjFont = [UIFont systemFontOfSize:14.0];
    CGSize pjStrSize = [Utility getCGSizeWithUIFont:pjFont str:pjStr];
    UILabel* pjLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, pjStrSize.width, pjStrSize.height)];
    [pjLabel setText:pjStr];
    [pjLabel setTextColor:[UIColor lightGrayColor]];
    [pjLabel setBackgroundColor:[UIColor clearColor]];
    [pjLabel setFont:pjFont];
    
    UIImage* arrowNormal = [UIImage getImageWithFileName:@"pjjt"];
    UIImageView* arrowImageView = [[UIImageView alloc] initWithImage:arrowNormal];
    [arrowImageView setFrame:CGRectMake(pjStrSize.width + 5, 2, arrowNormal.size.width, arrowNormal.size.height)];
    
    float height = MAX(pjStrSize.height, arrowNormal.size.height);
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, pjStrSize.width + arrowNormal.size.width + 5, height)];
    [view addSubview:pjLabel];
    [view addSubview:arrowImageView];
    
    cell.accessoryView = view;
    
    [pjLabel release];
    [arrowImageView release];
    [view release];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else{
        return 2;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString* sectionTitle;
    if (section == 0) {
        sectionTitle = @"  店铺评分";
    }
    else{
        sectionTitle = @"  美食评分";
    }
    UIFont* font = [UIFont boldSystemFontOfSize:16.0];
    CGSize sectionTitleSize = [Utility getCGSizeWithUIFont:font str:sectionTitle];
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, sectionTitleSize.width, sectionTitleSize.height)];
    [label setText:sectionTitle];
    [label setTextColor:[UIColor darkGrayColor]];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:font];
    return [label autorelease];
}

- (float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO animated:YES];
    
    if (indexPath.section != 0) {
        FoodCommentViewController* foodCommentViewController = [[FoodCommentViewController alloc] init];
        [foodCommentViewController.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [self.navigationController pushViewController:foodCommentViewController animated:YES];
        [foodCommentViewController release];
    }else{
        ShopCommentViewController* shopCommentViewController = [[ShopCommentViewController alloc] init];
        [shopCommentViewController.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [self.navigationController pushViewController:shopCommentViewController animated:YES];
        [shopCommentViewController release];
    }
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
