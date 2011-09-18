//
//  EditableUITableView.m
//  MovingTribal
//
//  Created by Lee Abel on 9/18/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "EditableUITableView.h"
#import "EditableUITableCellData.h"

@implementation EditableUITableView

@synthesize data;
@synthesize identifier;
@synthesize cellStyle;
@synthesize tableView;

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
    [super dealloc];
}

- (EditableUITableViewData *)data
{
    return data;
}

- (void)data:(EditableUITableViewData *)value
{
    if(data != value){
        EditableUITableViewData* tempData = data;
        data = [value retain];
        [tempData release];
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

- (UITableViewCellStyle)cellStyle
{
    return cellStyle;
}

- (void)cellStyle:(UITableViewCellStyle)value
{
    if(cellStyle != value) cellStyle = value;
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
    UITableViewCell* cell = [tb dequeueReusableCellWithIdentifier:identifier];
    EditableUITableCellData* cellData = [data getDataBySectionAndRow:indexPath.section row:indexPath.row];
    if(cell == nil){
        cell = [[[UITableViewCell alloc] initWithStyle:cellStyle reuseIdentifier:identifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake(cellData.x, cellData.y, cellData.width, cellData.height)];
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
        [cell addSubview:textField];
        [textField release];
    }
    cell.textLabel.text = cellData.label;
    return cell;
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
