//
//  RegistLayer.m
//  YiZu
//
//  Created by Abel Lee on 12-6-28.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "RegistLayer.h"

@implementation RegistLayer

@synthesize nickname;
@synthesize password;
@synthesize repassword;
@synthesize email;
@synthesize head;
@synthesize registForm;
@synthesize delegate;

-(id)init
{
    if(self = [super init]){
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, TOTLE_WIDTH, HEIGHT_IN_NAVIGATION)];
        view.backgroundColor = [UIColor whiteColor];
        [self setView:view];
        [view release];
        view = nil;
        
        EditableUITableViewCellData* cell0 = [[EditableUITableViewCellData alloc] init];
        [cell0 setLabel: @"昵称"];
        [cell0 setPlaceholder: @"请输入昵称"];
        [cell0 setValue:@"abellee"];
        [cell0 setKeyboardType: UIKeyboardTypeDefault];
        [cell0 setKeyboardAppearance: UIKeyboardAppearanceDefault];
        [cell0 setReturnKeyType: UIReturnKeyDone];
        [cell0 setSecureTextEntry: NO];
        [cell0 setKey: @"username"];
        [cell0 setCellType: kTextField];
        [cell0 setWidth: 150];
        [cell0 setHeight: 1000];
        
        EditableUITableViewCellData* cell1 = [[EditableUITableViewCellData alloc] init];
        [cell1 setLabel: @"昵称2"];
        [cell1 setPlaceholder: @"请输入昵称2"];
        [cell1 setValue:@"lijinbei"];
        [cell1 setKeyboardType: UIKeyboardTypeDefault];
        [cell1 setKeyboardAppearance: UIKeyboardAppearanceDefault];
        [cell1 setReturnKeyType: UIReturnKeyDone];
        [cell1 setSecureTextEntry: NO];
        [cell1 setKey: @"nickname"];
        [cell1 setCellType: kSwitch];
        [cell1 setWidth: 150];
        [cell1 setHeight: 1000];
        
        NSArray* tempArr = [[NSArray alloc] initWithObjects:cell0, cell1, nil];
        NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:@"", kSectionTitle, tempArr, kSectionData, nil];
        NSArray* arrData = [[NSArray alloc] initWithObjects:dict, nil];
        EditableUITableViewData* tableViewData = [[EditableUITableViewData alloc] init];
        [tableViewData setData: arrData];
        registForm = [[EditableUITableViewController alloc] initTableViewWithFrame:CGRectMake(0, 0, TOTLE_WIDTH, HEIGHT_IN_NAVIGATION) scrollEnabled:YES];
        [registForm setData:tableViewData];
        [self.view addSubview:registForm.view];
        
        [cell0 release];
        cell0 = nil;
        [cell1 release];
        cell1 = nil;
        
        [tempArr release];
        tempArr = nil;
        [arrData release];
        arrData = nil;
        
        [tableViewData release];
        tableViewData = nil;
    }
    return self;
}

-(void)registDone
{
    if(delegate && [delegate conformsToProtocol:@protocol(LoginDelegate)]){
        [delegate doLogin:[email text] pass:[password text]];
    }
}

-(void)dealloc
{
    NSLog(@"***********| RegistLayer dealloc! |***********");
    [nickname release];
    [password release];
    [repassword release];
    [email release];
    [head release];
    [takePhoto release];
    [album release];
    [registForm release];
    
    nickname = nil;
    password = nil;
    repassword = nil;
    email = nil;
    head = nil;
    takePhoto = nil;
    album = nil;
    registForm = nil;
    delegate = nil;
    
    [super dealloc];
}

@end
