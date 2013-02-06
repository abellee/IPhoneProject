//
//  RegistLayer.m
//  YiZu
//
//  Created by Abel Lee on 12-6-28.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "RegistLayer.h"
#import "SocketManager.h"
#import "EditableUITableViewController.h"
#import "ASIFormDataRequest.h"
#import "PopUpLayer.h"
#import "Global.h"
#import "SystemConfig.h"

@implementation RegistLayer

@synthesize registForm;
@synthesize delegate;

-(id)init
{
    if(self = [super init]){
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[Global sharedGlobal] totalWidth], [[Global sharedGlobal] heightInNavigator])];
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
        registForm = [[EditableUITableViewController alloc] initTableViewWithFrame:CGRectMake(0, 0, [[Global sharedGlobal] totalWidth], [[Global sharedGlobal] heightInNavigator]) scrollEnabled:YES];
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

-(void)doRegist:(id)sender
{
    [self.view endEditing:YES];
    EditableUITableViewData* tableViewData = registForm.data;
    EditableUITableViewCellData* cellData = [tableViewData getDataByKey:@"avatar"];
    AvatarCell* avatarCell = (AvatarCell*)[cellData customCell];
    UIImage* avatarImg = [avatarCell getAvatarImage];
    [[[Global sharedGlobal] popUpLayer] showActivityViewWithMask:YES];
    if(avatarImg){
        NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@", BASE_URL, DIR_NAME, UPLOAD_FILE]];
        ASIFormDataRequest* request = [[ASIFormDataRequest alloc] initWithURL:url];
        NSData* imgData = UIImagePNGRepresentation(avatarImg);
        [request setDelegate:self];
        [request setData:imgData withFileName:@"temp.jpg" andContentType:@"image/jpeg" forKey:@"avatar"];
        [request setDidFinishSelector:@selector(uploadAvatarFinished:)];
        [request startAsynchronous];
        [request release];
        request = nil;
    }else{
        [self performSelector:@selector(registNextStep:) withObject:nil];
    }
}

- (NSString *)getRegistedUsername
{
    [self.view endEditing:YES];
    EditableUITableViewData* tableViewData = registForm.data;
    EditableUITableViewCellData* cellData = [tableViewData getDataByKey:@"username"];
    return cellData.value;
}

- (NSString *)getRegistedPassword
{
    [self.view endEditing:YES];
    EditableUITableViewData* tableViewData = registForm.data;
    EditableUITableViewCellData* cellData = [tableViewData getDataByKey:@"password"];
    return cellData.value;
}

- (void)registNextStep:(NSString*)avatarURL
{
    EditableUITableViewData* tableViewData = registForm.data;
    EditableUITableViewCellData* usernameCellData = [tableViewData getDataByKey:@"username"];
    NSString* usernameStr = usernameCellData.value;
    if(![Global checkUsername:usernameStr]){
        [[[Global sharedGlobal] popUpLayer] showErrorAlertWithTitle:@"错误提示" info:@"邮箱地址格式不正确!"];
        return;
    }
    if(usernameStr.length > 24){
        [[[Global sharedGlobal] popUpLayer] showErrorAlertWithTitle:@"错误提示" info:@"邮箱地址长度不正确!"];
        return;
    }
    
    EditableUITableViewCellData* nicknameCellData = [tableViewData getDataByKey:@"nickname"];
    NSString* nicknameStr = nicknameCellData.value;
    if(nicknameStr.length > 10 || nicknameStr.length < 6){
        [[[Global sharedGlobal] popUpLayer] showErrorAlertWithTitle:@"错误提示" info:@"昵称长度不得小于3个中文字!"];
        return;
    }
    if(![Global checkNickname:nicknameStr]){
        [[[Global sharedGlobal] popUpLayer] showErrorAlertWithTitle:@"错误提示" info:@"昵称只支持中英文，数字 \"_\"或\"-\""];
        return;
	}
    
    EditableUITableViewCellData* pwCellData = [tableViewData getDataByKey:@"password"];
    EditableUITableViewCellData* rpwCellData = [tableViewData getDataByKey:@"repassword"];
    NSString* pwStr = pwCellData.value;
    NSString* rpwStr = rpwCellData.value;
    if([pwStr isEqual:rpwStr]){
        if(![Global checkPassword:pwStr]){
            [[[Global sharedGlobal] popUpLayer] showErrorAlertWithTitle:@"错误提示" info:@"密码长度不正确!"];
            return;
        }
    }else{
        [[[Global sharedGlobal] popUpLayer] showErrorAlertWithTitle:@"错误提示" info:@"两次输入的密码不相同!"];
        return;
    }
    [[[Global sharedGlobal] socketManager] doRegist:avatarURL nickname:nicknameStr username:usernameStr password:pwStr];
}

- (void)uploadAvatarFinished:(ASIHTTPRequest*)request
{
    if([request responseString].intValue == 0){
        [[[Global sharedGlobal] popUpLayer] hideActivityView];
        [[[Global sharedGlobal] popUpLayer] showErrorAlertWithTitle:@"提示" info:@"头像上传失败!"];
    }else{
        [self performSelector:@selector(registNextStep:) withObject:[request responseString]];
    }
}

- (void)registDone
{
    if(delegate && [delegate conformsToProtocol:@protocol(LoginDelegate)]){
        //[delegate doLogin:[email text] pass:[password text]];
    }
}

- (void)dealloc
{
    NSLog(@"***********| RegistLayer dealloc! |***********");
    [registForm release];
    
    registForm = nil;
    delegate = nil;
    
    [super dealloc];
}

@end
