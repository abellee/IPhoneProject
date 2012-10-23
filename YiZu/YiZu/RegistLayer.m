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
        
        EditableUITableViewCellData* avatarCellData = [[EditableUITableViewCellData alloc] init];
        [avatarCellData setCellType:kCustom];
        [avatarCellData setHeight:90];
        AvatarCell* avatarCell = [[AvatarCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kEditableUITableViewCell];
        [avatarCellData setCustomCell:avatarCell];
        [avatarCellData setKey:@"avatar"];
        [avatarCell release];
        avatarCell = nil;
        
        EditableUITableViewCellData* cell0 = [[EditableUITableViewCellData alloc] init];
        [cell0 setLabel: @"邮箱地址"];
        [cell0 setPlaceholder: @"请输入邮箱地址"];
        [cell0 setValue:@""];
        [cell0 setKeyboardType: UIKeyboardTypeDefault];
        [cell0 setKeyboardAppearance: UIKeyboardAppearanceDefault];
        [cell0 setReturnKeyType: UIReturnKeyNext];
        [cell0 setSecureTextEntry: NO];
        [cell0 setKey: @"username"];
        [cell0 setCellType: kTextField];
        [cell0 setWidth: 200];
        [cell0 setHeight: 50];
        
        EditableUITableViewCellData* cell1 = [[EditableUITableViewCellData alloc] init];
        [cell1 setLabel: @"昵称"];
        [cell1 setPlaceholder: @"请输入昵称"];
        [cell1 setValue:@""];
        [cell1 setKeyboardType: UIKeyboardTypeDefault];
        [cell1 setKeyboardAppearance: UIKeyboardAppearanceDefault];
        [cell1 setReturnKeyType: UIReturnKeyNext];
        [cell1 setSecureTextEntry: NO];
        [cell1 setKey: @"nickname"];
        [cell1 setCellType: kTextField];
        [cell1 setWidth: 200];
        [cell1 setHeight: 50];
        
        EditableUITableViewCellData* cell2 = [[EditableUITableViewCellData alloc] init];
        [cell2 setLabel: @"密码"];
        [cell2 setPlaceholder: @"请输入密码"];
        [cell2 setValue:@""];
        [cell2 setKeyboardType: UIKeyboardTypeDefault];
        [cell2 setKeyboardAppearance: UIKeyboardAppearanceDefault];
        [cell2 setReturnKeyType: UIReturnKeyNext];
        [cell2 setSecureTextEntry: YES];
        [cell2 setKey: @"password"];
        [cell2 setCellType: kTextField];
        [cell2 setWidth: 200];
        [cell2 setHeight: 50];
        
        EditableUITableViewCellData* cell3 = [[EditableUITableViewCellData alloc] init];
        [cell3 setLabel: @"确认密码"];
        [cell3 setPlaceholder: @"请输入确认密码"];
        [cell3 setValue:@""];
        [cell3 setKeyboardType: UIKeyboardTypeDefault];
        [cell3 setKeyboardAppearance: UIKeyboardAppearanceDefault];
        [cell3 setReturnKeyType: UIReturnKeyDone];
        [cell3 setSecureTextEntry: YES];
        [cell3 setKey: @"repassword"];
        [cell3 setCellType: kTextField];
        [cell3 setWidth: 200];
        [cell3 setHeight: 50];
        
        NSArray* tempArr = [[NSArray alloc] initWithObjects:avatarCellData, cell0, cell1, cell2, cell3, nil];
        NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:@"", kSectionTitle, tempArr, kSectionData, nil];
        NSArray* arrData = [[NSArray alloc] initWithObjects:dict, nil];
        EditableUITableViewData* tableViewData = [[EditableUITableViewData alloc] init];
        [tableViewData setData: arrData];
        registForm = [[EditableUITableViewController alloc] initTableViewWithFrame:CGRectMake(0, 0, TOTLE_WIDTH, HEIGHT_IN_NAVIGATION) scrollEnabled:YES];
        [registForm setData:tableViewData];
        [self.view addSubview:registForm.view];
        
        [avatarCellData release];
        [cell0 release];
        [cell1 release];
        [cell2 release];
        [cell3 release];
        [tempArr release];
        [arrData release];
        [tableViewData release];
        
        avatarCellData = nil;
        cell0 = nil;
        cell1 = nil;
        cell2 = nil;
        cell3 = nil;
        tempArr = nil;
        arrData = nil;
        tableViewData = nil;
    }
    return self;
}

- (void)registDone
{
    if(delegate && [delegate conformsToProtocol:@protocol(LoginDelegate)]){
        [delegate doLogin:[email text] pass:[password text]];
    }
}

- (void)dealloc
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
