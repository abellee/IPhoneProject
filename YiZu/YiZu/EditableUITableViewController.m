//
//  EditableUITableViewController.m
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "EditableUITableViewController.h"


@implementation EditableUITableViewController

@synthesize data;

- (id)initTableViewWithFrame:(CGRect)frame scrollEnabled:(BOOL)scrollEnabled
{
    self = [super init];
	if(self){
		[self.view setFrame:frame];
		tableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStyleGrouped];
		[tableViewController.tableView setFrame:frame];
		tableViewController.tableView.dataSource = self;
		tableViewController.tableView.delegate = self;
		tableViewController.tableView.scrollEnabled = scrollEnabled;
		[self.view addSubview:tableViewController.view];
	}
	return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AvatarCell* avatarCell = [[AvatarCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kEditableUITableViewCell];
    return avatarCell;
    ToggleableUITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kEditableUITableViewCell];
    EditableUITableViewCellData* cellData = [data getDataByIndexPath:indexPath];
    if(cell == nil){
        cell = [[[ToggleableUITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kEditableUITableViewCell] autorelease];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
		if(cellData.cellType == kTextField){
			UITextField* textField = [[self performSelector:@selector(getTextField:) withObject:cellData] retain];
			if(textFieldArray == nil)
				textFieldArray = [[NSMutableArray arrayWithCapacity:0] retain];
			textField.tag = [textFieldArray count];
			[textFieldArray addObject:textField];
			cell.accessoryView = textField;
			[textField release];
		}else if(cellData.cellType == kSwitch){
			UISwitch* switcher = [[self performSelector:@selector(getSwitch:) withObject:cellData] retain];
			cell.accessoryView = switcher;
			[switcher release];
		}else if(cellData.cellType == kNormal){
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
			cell.selectionStyle = UITableViewCellSelectionStyleBlue;
		}else if(cellData.cellType == kCheck && cellData.value == @"YES"){
			cell.accessoryType = UITableViewCellAccessoryCheckmark;
			cell.selectionStyle = UITableViewCellSelectionStyleBlue;
		}
    }
    cell.textLabel.text = cellData.label;
    return cell;
}

- (UITextField *)getTextField:(EditableUITableViewCellData *)cellData
{
	UIFont* font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
	CGSize size = [cellData.placeholder sizeWithFont:font];
	UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, cellData.width, size.height + 4)];
	textField.placeholder = cellData.placeholder;
	textField.clearButtonMode = UITextFieldViewModeWhileEditing;
	textField.autocorrectionType = UITextAutocorrectionTypeNo;
	textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
	textField.secureTextEntry = cellData.secureTextEntry;
	textField.text = cellData.value;
	textField.delegate = self;
	textField.keyboardType = cellData.keyboardType;
	textField.keyboardAppearance = cellData.keyboardAppearance;
	textField.returnKeyType = cellData.returnKeyType;
	return [textField autorelease];
}

- (UISwitch *)getSwitch:(EditableUITableViewCellData *)cellData
{
	UISwitch* switcher = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, cellData.width, cellData.height)];
	[switcher setOn:cellData.value == @"YES" ? YES : NO];
	[switcher addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
	return [switcher autorelease];
}

- (void)switchChanged:(id)sender
{
	UISwitch* switcher = (UISwitch *)sender;
	ToggleableUITableViewCell* cell = (ToggleableUITableViewCell *)[switcher superview];
	NSIndexPath* indexPath = [tableViewController.tableView indexPathForCell:cell];
	EditableUITableViewCellData* cellData = [data getDataByIndexPath:indexPath];
	cellData.value = switcher.on ? @"YES" : @"NO";
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
	ToggleableUITableViewCell* cell = (ToggleableUITableViewCell *)[textField superview];
	NSIndexPath* indexPath = [tableViewController.tableView indexPathForCell:cell];
	EditableUITableViewCellData* cellData = [data getDataByIndexPath:indexPath];
	cellData.value = textField.text;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
	UIView *view = [data viewForFooterInSection:section];
	if (view)
		return view;
	return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
	UIView *view = [data viewForFooterInSection:section];
	if (view)
		return view.frame.size.height;
	return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return [data getSectionTitleBySection:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data numberOfRowInSection:section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	EditableUITableViewCellData *cellData = [data getDataByIndexPath:indexPath];
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	if(cellData.cellType == kNormal){
		if(cellData.secondView){
			// 显示二级视图
		}
	}else if(cellData.cellType == kCheck){
		if(cell.accessoryType == UITableViewCellAccessoryDisclosureIndicator){
			cell.accessoryType = UITableViewCellAccessoryNone;
			cellData.value = @"NO";
		}else if(cell.accessoryType == UITableViewCellAccessoryNone){
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
			cellData.value = @"YES";
		}
	}
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	NSInteger index = textField.tag;
	if (index < [textFieldArray count] - 1) {
		UITextField *tf = [textFieldArray objectAtIndex:++index];
		[tf becomeFirstResponder];
		return NO;
	}else{
		return YES;
	}
	return YES;
}

- (void)dealloc
{
    NSLog(@"******| EditableUITableViewController |****** receive dealloc message!");
    [data release];
	[tableViewController release];
	data = nil;
	tableViewController = nil;
    
    if(textFieldArray){
		[textFieldArray removeAllObjects];
		[textFieldArray release];
		textFieldArray = nil;
	}
	
    [super dealloc];
}

/*----------------------------------------------------------------------------*/

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
