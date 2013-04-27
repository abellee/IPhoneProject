//
//  ChangeLocationViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-20.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "ChangeLocationViewController.h"
#import "ToggleableUITableViewCell.h"
#import "Utility.h"

@interface ChangeLocationViewController ()

@end

@implementation ChangeLocationViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)init
{
    if (self = [super init]) {
        title = @"更改当前位置";
    }
    return self;
}

- (void)initPickerView
{
    picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 216, [[UIScreen mainScreen] bounds].size.width, 216)];
    picker.delegate = self;
    picker.showsSelectionIndicator = YES;
    
    UIBarButtonItem* closeBtn = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleBordered target:self action:@selector(closePicker:)];
    closeBtn.style = UIBarButtonItemStyleBordered;
    
    UIBarButtonItem* flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    pickerToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 40)];
    [pickerToolBar setItems:[NSArray arrayWithObjects:flexible, closeBtn, nil]];
    [closeBtn release];
    [flexible release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self initPickerView];
    locationText = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, self.view.frame.size.width - 80, 40)];
    [locationText setBorderStyle:UITextBorderStyleRoundedRect];
    locationText.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    locationText.inputView = picker;
    locationText.placeholder = @"选择您所在的位置";
    locationText.delegate = self;
    
    gpsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [gpsButton setTitle:@"定位" forState:UIControlStateNormal];
    [gpsButton setFrame:CGRectMake(locationText.frame.size.width + 15, 15, 60, 30)];
    
    historyViewController = [[UITableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    float tableViewYPos = locationText.frame.origin.y + locationText.frame.size.height + 10;
    [historyViewController.view setFrame:CGRectMake(0, tableViewYPos, self.view.frame.size.width, self.view.frame.size.height - tableViewYPos)];
    historyViewController.tableView.dataSource = self;
    historyViewController.tableView.delegate = self;
    historyViewController.tableView.backgroundView = nil;
    historyViewController.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:historyViewController.view];
    
    [self.view addSubview:locationText];
    [self.view addSubview:gpsButton];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [locationText setText:@"四季青啊啊啊"];
    return YES;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* historyCell = @"historyCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:historyCell];
    if(cell == nil){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:historyCell] autorelease];
    }
    cell.textLabel.text = @"杭州－上城区－四季青";
    [cell.textLabel setFont:[UIFont systemFontOfSize:14.0]];
    return cell;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString* sectionTitle = @"     历史位置";
    CGSize sectionTitleSize = [Utility getCGSizeWithFontSize:16.0 str:sectionTitle isBold:YES];
    UILabel* label = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, sectionTitleSize.width, sectionTitleSize.height)] autorelease];
    label.backgroundColor = [UIColor clearColor];
    [label setText:sectionTitle];
    [label setTextColor:[UIColor grayColor]];
    [label setFont:[UIFont boldSystemFontOfSize:16.0]];
    return label;
}

- (float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO animated:YES];
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return @"杭州";
    }else if(component == 1){
        return @"西湖区";
    }else{
        return @"四季青啊啊啊";
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [locationText setText:@"四季青啊啊啊"];
}

- (float)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == 0) {
        return 70.0;
    }else if(component == 1){
        return 90.0;
    }else{
        return 140.0;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
