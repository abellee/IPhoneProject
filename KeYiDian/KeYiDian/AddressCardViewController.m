//
//  AddressCardViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "AddressCardViewController.h"
#import "Utility.h"
#import "AddressCell.h"
#import "TouchableUILabel.h"
#import "UIImage+Extensions.h"

@interface AddressCardViewController ()

@end

@implementation AddressCardViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)rect withAddressInfo:(Address *)info parentController:(AddressManageViewController *)controller
{
    if (self = [super init]) {
        addressManager = controller;
        [self.view setFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height + 60)];
        addressInfo = info;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    float cardWidth = self.view.frame.size.width - 40;
    float cardHeight = self.view.frame.size.height - 200;
    container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cardWidth, cardHeight + 60)];
    container.backgroundColor = [UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:243.0/255.0 alpha:1.0];
    container.layer.borderColor = [UIColor colorWithRed:138.0/255.0 green:208.0/255.0 blue:68.0/255.0 alpha:1.0].CGColor;
    container.layer.borderWidth = 6.0;
    container.layer.cornerRadius = 5.0;
    container.layer.shadowColor = [UIColor blackColor].CGColor;
    container.layer.shadowOffset = CGSizeMake(0, 0);
    container.layer.shadowOpacity = 0.3;
    container.layer.shadowRadius = 4.0;
    container.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:container.frame cornerRadius:5.0].CGPath;
    
    addressTableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    addressTableViewController.tableView.backgroundColor = [UIColor whiteColor];
    addressTableViewController.tableView.backgroundView = nil;
    addressTableViewController.tableView.delegate = self;
    addressTableViewController.tableView.dataSource = self;
    addressTableViewController.tableView.scrollEnabled = NO;
    [addressTableViewController.tableView setFrame:CGRectMake(4, 4, cardWidth - 8, cardHeight - 8)];
    
    NSString* labelStr = @"默认地址";
    CGSize labelStrSize = [Utility getCGSizeWithFontSize:18.0 str:labelStr isBold:NO];
    defaultAddress = [[TouchableUILabel alloc] initWithFrame:CGRectMake(20, cardHeight + (60 - labelStrSize.height) / 2 - 4, labelStrSize.width, labelStrSize.height)];
    [defaultAddress setText:labelStr];
    [defaultAddress setTextColor:[UIColor darkGrayColor]];
    defaultAddress.backgroundColor = [UIColor clearColor];
    [defaultAddress setFont:[UIFont systemFontOfSize:18.0]];
    defaultAddress.delegate = self;
    
    UIImage* deleteNormal = [UIImage getImageWithFileName:@"ljx0"];
    UIImage* deleteHighlighted = [UIImage getImageWithFileName:@"ljx1"];
    deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [deleteButton setBackgroundImage:deleteNormal forState:UIControlStateNormal];
    [deleteButton setBackgroundImage:deleteHighlighted forState:UIControlStateHighlighted];
    [deleteButton setFrame:CGRectMake(cardWidth - 18 - deleteNormal.size.width, defaultAddress.frame.origin.y + (defaultAddress.frame.size.height - deleteNormal.size.height) / 2, deleteNormal.size.width, deleteNormal.size.height)];
    [deleteButton addTarget:self action:@selector(deleteButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:container];
    [container addSubview:addressTableViewController.view];
    [container addSubview:defaultAddress];
    [container addSubview:deleteButton];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
}

- (void)labelPressed:(id)sender
{
    NSLog(@"fasdfdsf");
}

- (void)deleteButtonPressed:(id)sender
{
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"确认删除该送餐地址吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
    [alertView release];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* normalCell = @"normalAddressCell";
    AddressCell* cell = [tableView dequeueReusableCellWithIdentifier:normalCell];
    NSString* str = @"杭州杭州杭";
    if (indexPath.row == 0) {
        str = @"杭州杭州杭杭州杭州杭杭州杭州杭杭州";
    }
    if (cell == nil) {
        cell = [[[AddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:normalCell withText:@"送餐地址:" withValue:str andParentController:addressManager] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* str = @"杭州杭州杭";
    if (indexPath.row == 0) {
        str = @"杭州杭州杭杭州杭州杭杭州杭州杭杭州";
    }
    CGFloat height = [Utility getTextHeightWithString:str constrainedToSize:CGSizeMake(170, 10000.0) fontSize:16.0 withMinHeight:20.0];
    return height + 30;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
