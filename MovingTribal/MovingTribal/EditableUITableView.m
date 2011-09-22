//
//  EditableUITableView.m
//  MovingTribal
//
//  Created by Lee Abel on 9/18/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "EditableUITableView.h"
#import "EditableUITableCellData.h"
#import "ToggleableUITableViewCell.h"

@implementation EditableUITableView

@synthesize data;
@synthesize tableView;
@synthesize identifier;
@synthesize sectionHeader;

- (id)init
{
    self = [super init];
    if(self){
        NSLog(@"editable uitable view init");
        [self performSelector:@selector(initInterface)];
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"******| EditableUITableView |****** receive dealloc message!");
    [data release];
    [identifier release];
	[sectionHeader release];
    [super dealloc];
}

- (EditableUITableViewData *)data
{
    return data;
}

- (void)data:(EditableUITableViewData *)value
{
    if(data != value){
        [data release];
        data = [value retain];
    }
}

- (NSString *)identifier
{
    return identifier;
}

- (void)identifier:(NSString *)str
{
    if(identifier != str){
        NSString* tempStr = identifier;
        identifier = [str copy];
        [str release];
        [tempStr release];
    }
}

- (void)sectionHeader:(NSString *)str
{
	if(str != sectionHeader){
		[sectionHeader release];
		sectionHeader = [str retain];
	}
}

- (NSString * )sectionHeader
{
	return sectionHeader;
}

- (void)initInterface
{
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(20, 20, 280, 300) style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tb cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ToggleableUITableViewCell* cell = [tb dequeueReusableCellWithIdentifier:identifier];
    EditableUITableCellData* cellData = [data getDataBySectionAndRow:indexPath.section row:indexPath.row];
    if(cell == nil){
        cell = [[[ToggleableUITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
		if(cellData.cellType == kTextField){
			UITextField* textField = [[self performSelector:@selector(getTextField:) withObject:cellData] retain];
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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return sectionHeader == nil ? @"" : sectionHeader;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITextField *)getTextField:(EditableUITableCellData *)cellData
{
	UIFont* font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
	CGSize size = [cellData.placeholder sizeWithFont:font];
	UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, cellData.width, size.height + 4)];
	textField.placeholder = cellData.placeholder;
	textField.clearButtonMode = UITextFieldViewModeWhileEditing;
	textField.autocorrectionType = UITextAutocorrectionTypeNo;
	textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
	textField.secureTextEntry = cellData.isSecureTextEntry;
	textField.text = cellData.value;
	textField.delegate = self;
	textField.keyboardType = cellData.keyboardType;
	textField.keyboardAppearance = cellData.keyboardAppearance;
	textField.returnKeyType = cellData.returnKeyType;
	return [textField autorelease];
}

- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	EditableUITableCellData* cellData = [data getDataBySectionAndRow:indexPath.section row:indexPath.row];
	UITableViewCell* cell = [tv cellForRowAtIndexPath:indexPath];
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

- (UISwitch *)getSwitch:(EditableUITableCellData *)cellData
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
	NSIndexPath* indexPath = [self.tableView indexPathForCell:cell];
	EditableUITableCellData* cellData = [data getDataBySectionAndRow:indexPath.section row:indexPath.row];
	cellData.value = switcher.on ? @"YES" : @"NO";
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
	ToggleableUITableViewCell* cell = (ToggleableUITableViewCell *)[textField superview];
	NSIndexPath* indexPath = [self.tableView indexPathForCell:cell];
	EditableUITableCellData* cellData = [data getDataBySectionAndRow:indexPath.section row:indexPath.row];
	cellData.value = textField.text;
}

/*----------------------------------------------------------------------------*/

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
