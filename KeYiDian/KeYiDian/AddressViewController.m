//
//  AddressViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-19.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "AddressViewController.h"
#import "UIImage+Extensions.h"
#import "EditableUITableViewCellData.h"
#import "EditableUITableViewCellDefinition.h"
#import "EditableUITableViewController.h"
#import "EditableUITableViewData.h"
#import "Utility.h"

@interface AddressViewController ()

@end

@implementation AddressViewController

- (id)init
{
    if (self = [super init]) {
        title = @"送餐地址管理";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIButton* saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage* saveBtnNormalSkin = [UIImage getImageWithFileName:@"baocun0"];
    UIImage* saveBtnHighlightedSkin = [UIImage getImageWithFileName:@"baocun1"];
    [saveButton setImage:saveBtnNormalSkin forState:UIControlStateNormal];
    [saveButton setImage:saveBtnHighlightedSkin forState:UIControlStateHighlighted];
    [saveButton setFrame:CGRectMake(0, 0, saveBtnNormalSkin.size.width, saveBtnNormalSkin.size.height)];
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, saveButton.frame.size.width, saveButton.frame.size.height)];
    [view addSubview:saveButton];
    
    UIBarButtonItem* rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    [view release];
    [rightBarButtonItem release];
    
    EditableUITableViewCellData* cellData0 = [[EditableUITableViewCellData alloc] init];//
    cellData0.placeholder = @"必填";
    cellData0.cellType = kTextField;
    cellData0.label = @"送餐地址";
    cellData0.width = 200;
    cellData0.height = 30;
    cellData0.autocapitalizationType = UITextAutocapitalizationTypeNone;
    cellData0.autocorrectionType = UITextAutocorrectionTypeNo;
    cellData0.returnKeyType = UIReturnKeyNext;
    
    EditableUITableViewCellData* cellData1 = [[EditableUITableViewCellData alloc] init];//
    cellData1.placeholder = @"必填";
    cellData1.cellType = kTextField;
    cellData1.label = @"联系电话";
    cellData1.width = 200;
    cellData1.height = 30;
    cellData1.autocapitalizationType = UITextAutocapitalizationTypeNone;
    cellData1.autocorrectionType = UITextAutocorrectionTypeNo;
    cellData1.returnKeyType = UIReturnKeyNext;
    
    EditableUITableViewCellData* cellData2 = [[EditableUITableViewCellData alloc] init];
    cellData2.placeholder = @"选填";
    cellData2.cellType = kTextField;
    cellData2.label = @"短       号";
    cellData2.width = 200;
    cellData2.height = 30;
    cellData2.autocapitalizationType = UITextAutocapitalizationTypeNone;
    cellData2.autocorrectionType = UITextAutocorrectionTypeNo;
    cellData2.returnKeyType = UIReturnKeyNext;
    
    EditableUITableViewCellData* cellData3 = [[EditableUITableViewCellData alloc] init];
    cellData3.placeholder = @"选填";
    cellData3.cellType = kTextField;
    cellData3.label = @"备用电话";
    cellData3.width = 200;
    cellData3.height = 30;
    cellData3.autocapitalizationType = UITextAutocapitalizationTypeNone;
    cellData3.autocorrectionType = UITextAutocorrectionTypeNo;
    cellData3.returnKeyType = UIReturnKeyDone;
    
    NSMutableDictionary* mutableDict = [[NSMutableDictionary alloc] init];
    [mutableDict setObject:@"" forKey:kSectionTitle];
    [mutableDict setObject:[NSArray arrayWithObjects:cellData0, cellData1, cellData2, cellData3, nil] forKey:kSectionData];
    EditableUITableViewData* tableViewData = [[EditableUITableViewData alloc] init];
    [tableViewData setData:[NSArray arrayWithObjects:mutableDict, nil]];
    
    addressListViewController = [[EditableUITableViewController alloc] initTableViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) widthData:tableViewData scrollEnabled:YES style:UITableViewStylePlain];
    
    [self.view addSubview:addressListViewController.view];
    
    [cellData0 release];
    [cellData1 release];
    [cellData2 release];
    [cellData3 release];
    [mutableDict release];
    [tableViewData release];
}

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [addressListViewController release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
