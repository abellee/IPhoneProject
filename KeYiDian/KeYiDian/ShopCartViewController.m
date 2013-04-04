//
//  ShopCartViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "ShopCartViewController.h"
#import "ShopInfo.h"
#import "FoodInfo.h"
#import "Global.h"
#import "RadioGroup.h"
#import "UIRadioButton.h"
#import "Utility.h"
#import "UIImage+Extensions.h"
#import "CartFoodCell.h"

@interface ShopCartViewController ()

@end

@implementation ShopCartViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)initWithShopInfo:(ShopInfo *)info andFoodList:(NSMutableArray *)listData
{
    if (self = [super init]) {
        title = @"美食篮子";
        shopInfo = [info retain];
        foodList = [listData retain];
        radioGroup = [[RadioGroup alloc] init];
        radioGroup.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    CALayer* whiteLayer0 = [CALayer layer];
    [whiteLayer0 setFrame:CGRectMake(0, 0, self.view.frame.size.width, 135)];
    [whiteLayer0 setBackgroundColor:[UIColor whiteColor].CGColor];
    whiteLayer0.shadowColor = [UIColor blackColor].CGColor;
    whiteLayer0.shadowOffset = CGSizeMake(0, 0);
    whiteLayer0.shadowOpacity = 0.2;
    whiteLayer0.shadowRadius = 2;
    whiteLayer0.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, whiteLayer0.frame.size.width, whiteLayer0.frame.size.height) cornerRadius:0.0].CGPath;
    [self.view.layer addSublayer:whiteLayer0];
    
    CALayer* whiteLayer1 = [CALayer layer];
    [whiteLayer1 setFrame:CGRectMake(0, self.view.frame.size.height - 142, self.view.frame.size.width, 142)];
    [whiteLayer1 setBackgroundColor:[UIColor whiteColor].CGColor];
    whiteLayer1.shadowColor = [UIColor blackColor].CGColor;
    whiteLayer1.shadowOffset = CGSizeMake(0, 0);
    whiteLayer1.shadowOpacity = 0.2;
    whiteLayer1.shadowRadius = 2;
    whiteLayer1.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, whiteLayer0.frame.size.width, whiteLayer0.frame.size.height) cornerRadius:0.0].CGPath;
    [self.view.layer addSublayer:whiteLayer1];
    
    CALayer* grayLayer = [CALayer layer];
    [grayLayer setFrame:CGRectMake(0, whiteLayer1.frame.origin.y, whiteLayer1.frame.size.width, 30)];
    grayLayer.backgroundColor = [UIColor colorWithRed:234.0/255.0 green:234.0/255.0 blue:234.0/255.0 alpha:1.0].CGColor;
    [self.view.layer addSublayer:grayLayer];
    
    NSString* shopName = shopInfo.shopName;
    int deliveryCost = shopInfo.deliveryCost;
    NSString* tipStr = [NSString stringWithFormat:@"  \"%@\"起送价为: %d元", shopName, deliveryCost];
    deliveryTip = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    [deliveryTip setText:tipStr];
    [deliveryTip setTextColor:[UIColor whiteColor]];
    [deliveryTip setBackgroundColor:[UIColor colorWithRed:138.0/255.0 green:208.0/255.0 blue:68.0/255.0 alpha:1.0]];
    [deliveryTip setFont:[UIFont boldSystemFontOfSize:14.0]];
    [self.view addSubview:deliveryTip];
    
    UIImage* radioButtonNormal = [UIImage getImageWithFileName:@"lvdian0"];
    UIImage* radioButtonSelected = [UIImage getImageWithFileName:@"lvdian1"];
    UIRadioButton* radioButton0 = [[UIRadioButton alloc] initWithFrame:CGRectMake(20, deliveryTip.frame.origin.y + deliveryTip.frame.size.height + 20, 100, 30)];
    [radioButton0 setBackgroundImage:radioButtonNormal forState:UIControlStateNormal];
    [radioButton0 setBackgroundImage:radioButtonSelected forState:UIControlStateSelected];
    [radioButton0 setTitle:@"送餐" forState:UIControlStateNormal];
    [radioButton0 setTitle:@"送餐" forState:UIControlStateSelected];
    [radioButton0 setFont:[UIFont boldSystemFontOfSize:16.0]];
    [radioButton0 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [radioButton0 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateSelected];
    radioButton0.tag = 0;
    [self.view addSubview:radioButton0];
    [radioButton0 setNeedsDisplay];
    [radioButton0 isSelected:YES];
    
    UIRadioButton* radioButton1 = [[UIRadioButton alloc] initWithFrame:CGRectMake(100, deliveryTip.frame.origin.y + deliveryTip.frame.size.height + 20, 100, 30)];
    [radioButton1 setBackgroundImage:radioButtonNormal forState:UIControlStateNormal];
    [radioButton1 setBackgroundImage:radioButtonSelected forState:UIControlStateSelected];
    [radioButton1 setTitle:@"自取" forState:UIControlStateNormal];
    [radioButton1 setTitle:@"自取" forState:UIControlStateSelected];
    [radioButton1 setFont:[UIFont boldSystemFontOfSize:16.0]];
    [radioButton1 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [radioButton1 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateSelected];
    radioButton1.tag = 1;
    [self.view addSubview:radioButton1];
    [radioButton1 setNeedsDisplay];
    
    [radioGroup addRadioButton:radioButton0];
    [radioGroup addRadioButton:radioButton1];
    [radioButton0 release];
    [radioButton1 release];
    
    UIImage* asSoonNormal = [UIImage getImageWithFileName:@"xiala0"];
    UIImage* asSoonHighlighted = [UIImage getImageWithFileName:@"xiala1"];
    
    asSoon = [UIButton buttonWithType:UIButtonTypeCustom];
    [asSoon setBackgroundImage:asSoonNormal forState:UIControlStateNormal];
    [asSoon setBackgroundImage:asSoonHighlighted forState:UIControlStateHighlighted];
    [asSoon setFrame:CGRectMake(self.view.frame.size.width - asSoonNormal.size.width - 20, deliveryTip.frame.origin.y + deliveryTip.frame.size.height + 17, asSoonNormal.size.width, asSoonNormal.size.height)];
    [asSoon setTitle:@"尽快送出" forState:UIControlStateNormal];
    [asSoon setTitle:@"尽快送出" forState:UIControlStateHighlighted];
    [asSoon setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [asSoon setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [asSoon setContentEdgeInsets:UIEdgeInsetsMake(2, -20, 0, 0)];
    [asSoon.titleLabel setFont:[UIFont boldSystemFontOfSize:16.0]];
    [self.view addSubview:asSoon];
    [asSoon addTarget:self action:@selector(asSoonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage* addNormal = [UIImage getImageWithFileName:@"tianjia0"];
    UIImage* addHighlighted = [UIImage getImageWithFileName:@"tianjia1"];
    curAddress = [UIButton buttonWithType:UIButtonTypeCustom];
    [curAddress setBackgroundColor:[UIColor colorWithRed:249.0/255.0 green:249.0/255.0 blue:249.0/255.0 alpha:1.0]];
    [curAddress setFrame:CGRectMake(20, asSoon.frame.origin.y + asSoon.frame.size.height + 10, self.view.frame.size.width - 20 * 2, 40)];
    [curAddress setTitle:@" 添加送餐地址" forState:UIControlStateNormal];
    [curAddress setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [curAddress setImage:addNormal forState:UIControlStateNormal];
    [curAddress setImage:addHighlighted forState:UIControlStateHighlighted];
    [curAddress setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    curAddress.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    curAddress.layer.shadowColor = [UIColor blackColor].CGColor;
    curAddress.layer.shadowOffset = CGSizeMake(0, 0);
    curAddress.layer.shadowOpacity = 0.2;
    curAddress.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, curAddress.frame.size.width, curAddress.frame.size.height) cornerRadius:5.0].CGPath;
    curAddress.layer.cornerRadius = 5.0;
    curAddress.layer.shadowRadius = 2.0;
    [self.view addSubview:curAddress];
    [curAddress addTarget:self action:@selector(curAddressPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    tableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    tableViewController.tableView.dataSource = self;
    tableViewController.tableView.delegate = self;
    [tableViewController.tableView setFrame:CGRectMake(0, whiteLayer0.frame.origin.y + whiteLayer0.frame.size.height + 2, self.view.frame.size.width, self.view.frame.size.height - 100 - (whiteLayer0.frame.origin.y + whiteLayer0.frame.size.height))];
    tableViewController.tableView.backgroundColor = [UIColor clearColor];
    tableViewController.tableView.backgroundView = nil;
    tableViewController.tableView.showsVerticalScrollIndicator = NO;
    tableViewController.tableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:tableViewController.view];
    
    NSString* deliveryStr = @"配送费:10元";
    UIFont* deliveryStrFont = [UIFont systemFontOfSize:12.0];
    CGSize deliveryStrSize = [Utility getCGSizeWithUIFont:deliveryStrFont str:deliveryStr];
    deliveryCostLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, grayLayer.frame.origin.y + (grayLayer.frame.size.height - deliveryStrSize.height) / 2, 90, deliveryStrSize.height)];
    deliveryCostLabel.backgroundColor = [UIColor clearColor];
    [deliveryCostLabel setText:deliveryStr];
    [deliveryCostLabel setTextColor:[UIColor darkGrayColor]];
    [deliveryCostLabel setFont:deliveryStrFont];
    [self.view addSubview:deliveryCostLabel];
    
    NSString* saveStr = @"优惠:10元";
    CGSize saveStrSize = [Utility getCGSizeWithUIFont:deliveryStrFont str:saveStr];
    saveMoneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(deliveryCostLabel.frame.origin.x + deliveryCostLabel.frame.size.width + 10, deliveryCostLabel.frame.origin.y, 80, saveStrSize.height)];
    saveMoneyLabel.backgroundColor = [UIColor clearColor];
    [saveMoneyLabel setText:saveStr];
    [saveMoneyLabel setTextColor:[UIColor darkGrayColor]];
    [saveMoneyLabel setFont:deliveryStrFont];
    [self.view addSubview:saveMoneyLabel];
    
    NSString* concurrencyStr = @"合计:10份 999元";
    CGSize concurrencyStrSize = [Utility getCGSizeWithUIFont:deliveryStrFont str:concurrencyStr];
    concurrencyLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 120, deliveryCostLabel.frame.origin.y, 110, concurrencyStrSize.height)];
    concurrencyLabel.textAlignment = NSTextAlignmentRight;
    concurrencyLabel.backgroundColor = [UIColor clearColor];
    [concurrencyLabel setText:concurrencyStr];
    [concurrencyLabel setTextColor:[UIColor darkGrayColor]];
    [concurrencyLabel setFont:deliveryStrFont];
    [self.view addSubview:concurrencyLabel];
    
    UIImage* jsNormal = [UIImage getImageWithFileName:@"js0"];
    UIImage* jsHighlighted = [UIImage getImageWithFileName:@"js1"];
    doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [doneButton setBackgroundImage:jsNormal forState:UIControlStateNormal];
    [doneButton setBackgroundImage:jsHighlighted forState:UIControlStateHighlighted];
    [doneButton setFrame:CGRectMake((self.view.frame.size.width - jsNormal.size.width) / 2, self.view.frame.size.height - jsNormal.size.height - 55, jsNormal.size.width, jsNormal.size.height)];
    [self.view addSubview:doneButton];
    [doneButton addTarget:self action:@selector(doneButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cartCell = @"cartCell";
    CartFoodCell* cell = [tableView dequeueReusableCellWithIdentifier:cartCell];
    if (cell == nil) {
        cell = [[[CartFoodCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cartCell andFoodInfo:nil] autorelease];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)doneButtonPressed:(id)sender
{
    NSLog(@"done");
}

- (void)curAddressPressed:(id)sender
{
    NSLog(@"address pressed");
}

- (void)asSoonPressed:(id)sender
{
    NSLog(@"as soon");
}

- (void)radioGroupDidChanged:(UIRadioButton*)radioButton
{
    if (radioButton.tag == 0) {
        if (asSoon.alpha < 1) {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.2];
            asSoon.alpha = 1;
            [UIView commitAnimations];
        }
    }
    else if(radioButton.tag == 1){
        if (asSoon.alpha > 0) {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.2];
            asSoon.alpha = 0;
            [UIView commitAnimations];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
