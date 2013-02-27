//
//  HLPhotographyViewController.m
//  Hanloon
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import "HLPhotographyViewController.h"
#import "Definitions.h"
#import "AVCaptureCameraViewController.h"
#import "UIImage+ImageScale.h"
#import "DeletableImageViewController.h"
#import "ASIFormDataRequest.h"
#import "JSONKit.h"
#import "Global.h"
#import "AbelViewController.h"

@interface HLPhotographyViewController ()

@end

@implementation HLPhotographyViewController

- (void)dealloc
{
    NSLog(@"****************** HLPhotographyViewController dealloc ******************");
    
    [background release];
    [cateButton release];
    [photoCateLabel release];
    [orderLabel release];

    [orderChooseButton release];
    [orderTextField release];
    [cameraButton release];
    [submitButton release];
    [resetButton release];
    [backwardButton release];
    [addButton release];
    [imageScrollView release];
    if (tempArray != nil) {
        [tempArray removeAllObjects];
        [tempArray release];
    }
    if (imageArray != nil) {
        [imageArray removeAllObjects];
        [imageArray release];
    }
    if (deleteableImages != nil) {
        [deleteableImages removeAllObjects];
        [deleteableImages release];
    }
    [parentCateArray release];
    [photoCateArray release];
    curPhotoCateArray = nil;
    if (popOver != nil) {
        [popOver release];
    }
    if (pickerToolBar != nil) {
        [pickerToolBar release];
    }
    if (actionSheet != nil) {
        [actionSheet release];
    }
    if (alert != nil) {
        [alert release];
    }
    
    if (progressView != nil) {
        [progressView release];
    }
    
    if (cateArray != nil) {
        [cateArray release];
    }
    
    if (cateList != nil) {
        [cateList release];
    }
    
    [camera release];
    
    if (picker != nil) {
        [picker release];
    }
    
    [super dealloc];
}

- (void)setView:(UIView *)view
{
    [super setView:view];
    
    [self initView];
}

- (void)initView
{
    curCateIndex = -1;
    server = @"http://oa.hanloon.com/cgi-common/upload.php?action=photograph";
    
    parentCateArray = [[NSArray alloc] initWithObjects:@"西服照片", @"女装照片", @"衬衫照片", @"维修照片", @"退赔照片", nil];
    NSArray* arr0 = [NSArray arrayWithObjects:@"量身", @"试衣", @"成衣", @"参考图", nil];
    NSArray* arr1 = [NSArray arrayWithObjects:@"量身", @"试衣", @"成衣", @"参考图", @"尺寸单上传", nil];
    NSArray* arr2 = [NSArray arrayWithObjects:@"量身", @"试衣", @"成衣", @"参考图", nil];
    NSArray* arr3 = [NSArray arrayWithObjects:@"维修单上传", @"维修衣服照片", nil];
    NSArray* arr4 = [NSArray arrayWithObjects:@"退赔衣服照片", nil];
    NSArray* arr = [NSArray arrayWithObjects:arr0, arr1, arr2, arr3, arr4, nil];
    photoCateArray = [[NSArray alloc] initWithArray:arr];
    
    [self initPickerView];
    
    progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    [progressView setFrame:CGRectMake(45, 55, 200, 20)];
    
    background = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"background" ofType:@"png"]]];
    [background setFrame:CGRectMake(0, 0, background.frame.size.width, background.frame.size.height)];
    [self.view addSubview:background];
    
    float fontSize = 20;
    photoCateLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 200, 40)];
    [photoCateLabel setText:@"照片类型:"];
    photoCateLabel.backgroundColor = [UIColor clearColor];
    [photoCateLabel setFont:[UIFont boldSystemFontOfSize:fontSize]];
    [photoCateLabel setTextColor:[UIColor whiteColor]];
    [self.view addSubview:photoCateLabel];
    
    UIImage* cateTextImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cateText" ofType:@"png"]];
    cateButton = [[UITextField alloc] initWithFrame:CGRectMake(130, 30, cateTextImage.size.width, cateTextImage.size.height)];
    [cateButton setBackground:cateTextImage];
    cateButton.placeholder = @"点击选择照片类型...";
    cateButton.delegate = self;
    [cateButton setTextColor:[UIColor grayColor]];
    [cateButton setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    cateButton.leftViewMode = UITextFieldViewModeAlways;
    cateButton.rightViewMode = UITextFieldViewModeAlways;
    
    CGRect frame0 = [cateButton frame];
    frame0.size.width = 10;
    UIView *leftView0 = [[UIView alloc] initWithFrame:frame0];
    
    cateButton.leftView = leftView0;
    cateButton.rightView = leftView0;
    [self.view addSubview:cateButton];
    [leftView0 release];
    
    orderLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 90, 200, 40)];
    [orderLabel setText:@"尺寸单号:"];
    orderLabel.backgroundColor = [UIColor clearColor];
    [orderLabel setFont:[UIFont boldSystemFontOfSize:fontSize]];
    [orderLabel setTextColor:[UIColor whiteColor]];
    [self.view addSubview:orderLabel];
    
    UIImage* orderChooseImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cateButton" ofType:@"png"]];
    orderChooseButton = [[UIButton alloc] initWithFrame:CGRectMake(130, 90, orderChooseImage.size.width, orderChooseImage.size.height)];
    [orderChooseButton setBackgroundImage:orderChooseImage forState:UIControlStateNormal];
    [orderChooseButton setTitle:@"正在获取门店信息..." forState:UIControlStateNormal];
    [orderChooseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [orderChooseButton.titleLabel setFont:[UIFont boldSystemFontOfSize:fontSize]];
    [self.view addSubview:orderChooseButton];
    [orderChooseButton addTarget:self action:@selector(orderChooseButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    orderTextField = [[UITextField alloc] initWithFrame:CGRectMake(130, 150, cateTextImage.size.width, cateTextImage.size.height)];
    [orderTextField setBackground:cateTextImage];
    orderTextField.placeholder = @"请输入数字单号";
    orderTextField.delegate = self;
    orderTextField.spellCheckingType = UITextSpellCheckingTypeNo;
    orderTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    orderTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    orderTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    orderTextField.leftViewMode = UITextFieldViewModeAlways;
    orderTextField.rightViewMode = UITextFieldViewModeAlways;
    
    CGRect frame = [orderTextField frame];
    frame.size.width = 10;
    UIView *leftView = [[UIView alloc] initWithFrame:frame];
    
    orderTextField.leftView = leftView;
    orderTextField.rightView = leftView;
    [self.view addSubview:orderTextField];
    [leftView release];
    
    UIImage* buttonSkin = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"enterButton" ofType:@"png"]];
    submitButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 250, buttonSkin.size.width, buttonSkin.size.height)];
    [submitButton setBackgroundImage:buttonSkin forState:UIControlStateNormal];
    [submitButton setTitle:@"确认提交" forState:UIControlStateNormal];
    [submitButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [submitButton.titleLabel setFont:[UIFont boldSystemFontOfSize:fontSize]];
    [self.view addSubview:submitButton];
    [submitButton addTarget:self action:@selector(submitButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    resetButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 250, buttonSkin.size.width, buttonSkin.size.height)];
    [resetButton setBackgroundImage:buttonSkin forState:UIControlStateNormal];
    [resetButton setTitle:@"清空" forState:UIControlStateNormal];
    [resetButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [resetButton.titleLabel setFont:[UIFont boldSystemFontOfSize:fontSize]];
    [self.view addSubview:resetButton];
    [resetButton addTarget:self action:@selector(resetButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    backwardButton = [[UIButton alloc] initWithFrame:CGRectMake(170, 350, buttonSkin.size.width, buttonSkin.size.height)];
    [backwardButton setBackgroundImage:buttonSkin forState:UIControlStateNormal];
    [backwardButton setTitle:@"返回首页" forState:UIControlStateNormal];
    [backwardButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backwardButton.titleLabel setFont:[UIFont boldSystemFontOfSize:fontSize]];
    [self.view addSubview:backwardButton];
    [backwardButton addTarget:self action:@selector(backwardButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage* photoButtonSkin = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"photoButton" ofType:@"png"]];
    cameraButton = [[UIButton alloc] initWithFrame:CGRectMake(513, -2, photoButtonSkin.size.width, photoButtonSkin.size.height)];
    [cameraButton setBackgroundImage:photoButtonSkin forState:UIControlStateNormal];
    [self.view addSubview:cameraButton];
    [cameraButton addTarget:self action:@selector(cameraButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    imageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(513, 2, photoButtonSkin.size.width - 4, photoButtonSkin.size.height - buttonSkin.size.height - 20)];
    imageScrollView.pagingEnabled = YES;
    imageScrollView.backgroundColor = [UIColor clearColor];
    imageScrollView.showsHorizontalScrollIndicator = NO;
    imageScrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:imageScrollView];
    
    addButton = [[UIButton alloc] initWithFrame:CGRectMake(513 + (photoButtonSkin.size.width - 4 - buttonSkin.size.width) / 2, photoButtonSkin.size.height - buttonSkin.size.height - 20 + 10, buttonSkin.size.width, buttonSkin.size.height)];
    [addButton setBackgroundImage:buttonSkin forState:UIControlStateNormal];
    [addButton setTitle:@"添加图片" forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addButton.titleLabel setFont:[UIFont boldSystemFontOfSize:fontSize]];
    [self.view addSubview:addButton];
    [addButton addTarget:self action:@selector(addButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self hideAddButton];
    
    camera = [[AVCaptureCameraViewController alloc] init];
    camera.delegate = self;
    [camera.view setFrame:CGRectMake(0, 0, FULL_WIDTH, FULL_HEIGHT)];
    
    [self performSelectorInBackground:@selector(getCateData) withObject:nil];
}

- (void)getCateData
{
    NSURL* cateURL = [NSURL URLWithString:@"http://oa.hanloon.com/query/shopnames"];
    NSURLRequest* request = [NSURLRequest requestWithURL:cateURL];
    NSURLResponse* response;
    NSError* error;
    NSData* returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString* returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    cateArray = [[returnString objectFromJSONString] retain];
    [returnString release];
    [self performSelectorOnMainThread:@selector(cateDataSuccess) withObject:nil waitUntilDone:YES];
}

- (void)cateDataSuccess
{
    [orderChooseButton setTitle:@"点击选择所属门店" forState:UIControlStateNormal];
}

- (void)finishTakePicture:(UIImage*)image
{
    if (tempArray == nil) {
        tempArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    [tempArray addObject:image];
}

- (void)cancelCapture
{
    [camera dismissModalViewControllerAnimated:YES];
    if(tempArray != nil) [tempArray removeAllObjects];
}

- (void)doneCapture
{
    [camera dismissModalViewControllerAnimated:YES];
    if (imageArray == nil) {
        imageArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    [imageArray addObjectsFromArray:tempArray];
    if(tempArray != nil) [tempArray removeAllObjects];
    
    [self showAddButton];
    
    [self listImage];
}

- (void)listImage
{
    if (deleteableImages == nil) {
        deleteableImages = [[NSMutableArray alloc] initWithCapacity:0];
    }
    while ([[imageScrollView subviews] count]) {
        [[[imageScrollView subviews] objectAtIndex:0] removeFromSuperview];
    }
    [deleteableImages removeAllObjects];
    if (imageArray && [imageArray count]) {
        for (UIImage* img in imageArray) {
            int num = [[imageScrollView subviews] count];
            DeletableImageViewController* deletableImage = [[DeletableImageViewController alloc] init];
            [deletableImage.view setFrame:CGRectMake(num * imageScrollView.frame.size.width, 0, imageScrollView.frame.size.width, imageScrollView.frame.size.height)];
            [deletableImage setImageData:img size:imageScrollView.frame.size];
            [deletableImage delegate:self];
            [imageScrollView addSubview:deletableImage.view];
            [deleteableImages addObject:deletableImage];
            [deletableImage release];
        }
        [imageScrollView setContentSize:CGSizeMake([imageArray count] * imageScrollView.frame.size.width, imageScrollView.frame.size.height)];
    }else{
        [self hideAddButton];
    }
}

- (void)deleteImage:(UIImage *)image controller:(DeletableImageViewController *)imageViewController
{
    if ([imageArray containsObject:image]) {
        [imageArray removeObject:image];
    }
    [self listImage];
}

- (void)showAddButton
{
    cameraButton.hidden = YES;
    addButton.hidden = NO;
    imageScrollView.hidden = NO;
}

- (void)hideAddButton
{
    cameraButton.hidden = NO;
    addButton.hidden = YES;
    imageScrollView.hidden = YES;
}

- (void)addButtonPressed:(id)sender
{
    [tempArray removeAllObjects];
    [self presentModalViewController:camera animated:YES];
    [camera startRunning];
}

- (void)cameraButtonPressed:(id)sender
{
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"请选择照片来源" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"马上拍一张！", @"相册", nil];
    [actionSheet showInView:self.view];
    [actionSheet release];
    actionSheet = nil;
}

- (void)backwardButtonPressed:(id)sender
{
    if (imageArray && [imageArray count] > 0) {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"当前有照片未上传，该操作将清空所有内容，是否确认返回首页？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
        [alertView release];
        alertView = nil;
        return;
    }
    [self doBackward];
}

- (void)doBackward
{
    [[[Global sharedInstance] app] backToMain];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return [self isPureInt:string];
}

- (BOOL)isPureInt:(NSString*)string{
    NSCharacterSet *cs;
    cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789\n"] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    BOOL basicTest = [string isEqualToString:filtered];
    if(!basicTest)
    {
        return NO;
    }
    return YES;
}

- (void)resetButtonPressed:(id)sender
{
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"清空内容" message:@"确认清空所有内容?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
    [alertView release];
    alertView = nil;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //    server = [[NSString alloc] initWithString:serverURLTextField.text ? serverURLTextField.text : @""];
    switch (buttonIndex) {
        case 0:
            [alertView dismissWithClickedButtonIndex:buttonIndex animated:YES];
            break;
        case 1:{
            if ([[alertView title] isEqualToString:@""]) {
                [self doBackward];
            }else{
                [self clearContent];
            }
        }break;
        default:
            break;
    }
}

- (void)clearContent
{
    if(tempArray != nil) [tempArray removeAllObjects];
    if(imageArray != nil) [imageArray removeAllObjects];
    [self listImage];
    [orderChooseButton setTitle:@"点击选择所属门店" forState:UIControlStateNormal];
    curParentIndex = 0;
    curChildIndex = 0;
    [cateButton setText:@""];
    [orderTextField setText:@""];
}

- (void)orderChooseButtonPressed:(id)sender
{
    if (cateArray == nil || [cateArray count] <= 0) {
        return;
    }
    if (cateList == nil) {
        cateList = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
        cateList.tableView.dataSource = self;
        cateList.tableView.delegate = self;
        cateList.contentSizeForViewInPopover = CGSizeMake(200, 400);
    }
    
    if (popOver != nil) {
        [popOver release];
        popOver = nil;
    }
    popOver = [[UIPopoverController alloc] initWithContentViewController:cateList];
    popOver.delegate = self;
    [popOver setPopoverContentSize:CGSizeMake(300, 400) animated:YES];
    [popOver presentPopoverFromRect:orderChooseButton.bounds inView:orderChooseButton permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if([textField isEqual:cateButton]){
        textField.inputView = picker;
        textField.inputAccessoryView = pickerToolBar;
        curParentIndex = 0;
        curChildIndex = 0;
        if(picker){
            curParentIndex = [picker selectedRowInComponent:0];
            curChildIndex = [picker selectedRowInComponent:1];
        }
        [cateButton setText:[NSString stringWithFormat:@"%@ - %@", [parentCateArray objectAtIndex:curParentIndex], [curPhotoCateArray objectAtIndex:curChildIndex]]];
        return YES;
    }else if([textField isEqual:orderTextField]){
        return YES;
    }
    return NO;
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return [parentCateArray count];
            break;
        case 1:
            return [curPhotoCateArray count];
            break;
            
        default:
            break;
    }
    return [parentCateArray count];
}

- (NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return [parentCateArray objectAtIndex:row];
            break;
        case 1:
            return [curPhotoCateArray objectAtIndex:row];
            break;
            
        default:
            break;
    }
    return [parentCateArray objectAtIndex:row];
}

- (void)closePicker:(id)sender
{
    [cateButton resignFirstResponder];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component == 0){
        curPhotoCateArray = [photoCateArray objectAtIndex:row];
        [picker selectRow:0 inComponent:1 animated:YES];
        [picker reloadComponent:1];
    }
    curParentIndex = [picker selectedRowInComponent:0];
    curChildIndex = [picker selectedRowInComponent:1];
    [cateButton setText:[NSString stringWithFormat:@"%@ - %@", [parentCateArray objectAtIndex:curParentIndex], [curPhotoCateArray objectAtIndex:curChildIndex]]];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellCache = @"Cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellCache];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellCache] autorelease];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"(%@)%@", [[cateArray objectAtIndex:indexPath.row] objectForKey:@"value"], [[cateArray objectAtIndex:indexPath.row] objectForKey:@"key"]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [cateArray count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [orderChooseButton setTitle:[NSString stringWithFormat:@"(%@)%@", [[cateArray objectAtIndex:indexPath.row] objectForKey:@"value"], [[cateArray objectAtIndex:indexPath.row] objectForKey:@"key"]] forState:UIControlStateNormal];
    curCateIndex = indexPath.row;
    [popOver dismissPopoverAnimated:YES];
}

- (void)submitButtonPressed:(id)sender
{
    if(isUploading) return;
    if([imageArray count] > 0 && ![[orderTextField text] isEqualToString:@""] && ![[cateButton text] isEqualToString:@""] && curCateIndex != -1){
        [self startUpload];
    }else{
        alert = [[UIAlertView alloc] initWithTitle:@"提示信息" message:@"信息未填写完整!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        alert = nil;
    }
}

- (void)startUpload
{
    if(progressView){
        [progressView setProgress:0.0];
    }
    NSURL* url = [NSURL URLWithString:server];
    ASIFormDataRequest* request = [[ASIFormDataRequest alloc] initWithURL:url];
    UIImage* tempImage = [imageArray objectAtIndex:0];
    UIImage* fixOrientation = [tempImage fixOrientation];
    NSData* imgData = UIImageJPEGRepresentation(fixOrientation, 72.0);
    
    UIImageWriteToSavedPhotosAlbum([imageArray objectAtIndex:0], nil, nil, nil);
    //[assetsLib writeImageToSavedPhotosAlbum:tempImage.CGImage metadata:nil completionBlock:nil];
    
    NSString* orderStr = [NSString stringWithFormat:@"%@-%@", [[cateArray objectAtIndex:curCateIndex] objectForKey:@"key"], [orderTextField text]];
    NSString* parentCateStr = [self getParentCate];
    NSString* photoCateStr = [self getChildCate];
    if(alert == nil){
        alert = [[UIAlertView alloc] initWithTitle:@"正在上传" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [progressView setProgress:0.0];
        [alert addSubview:progressView];
        [alert show];
    }
    [request setDelegate:self];
    [request setData:imgData withFileName:@"photo.jpg" andContentType:@"image/jpeg" forKey:@"photo"];
    [request setPostValue:parentCateStr forKey:@"pid"];
    [request setPostValue:photoCateStr forKey:@"pcid"];
    [request setPostValue:orderStr forKey:@"orderNum"];
    [request setDidFinishSelector:@selector(uploadPhotoFinished:)];
    [request setDidFailSelector:@selector(uploadPhotoFailed:)];
    [request setDownloadProgressDelegate:self];
    [request startAsynchronous];
    [request release];
    request = nil;
    isUploading = YES;
}

- (NSString*)getParentCate
{
    return [parentCateArray objectAtIndex:curParentIndex];
}

- (NSString*)getChildCate
{
    return [curPhotoCateArray objectAtIndex:curChildIndex];
}

- (void)setProgress:(float)newProgress
{
    if(progressView){
        [progressView setProgress:newProgress];
    }
}

- (void)uploadPhotoFailed:(ASIHTTPRequest*)request
{
    if(alert){
        [alert dismissWithClickedButtonIndex:0 animated:YES];
        [alert release];
        alert = nil;
    }
    alert = [[UIAlertView alloc] initWithTitle:@"提示信息" message:[[request error] localizedDescription] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
    alert = nil;
    isUploading = false;
}

- (void)uploadPhotoFinished:(ASIHTTPRequest*)request
{
    isUploading = false;
    if([imageArray count] == 1){
        if(alert){
            [alert dismissWithClickedButtonIndex:0 animated:YES];
            [alert release];
            alert = nil;
        }
        NSArray* responseArray = [[request responseString] objectFromJSONString];
        if([responseArray objectAtIndex:0] == [NSNumber numberWithBool:YES]){
            alert = [[UIAlertView alloc] initWithTitle:@"提示信息" message:@"提交成功!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [cateButton setText:@"点击选择照片分类..."];
            [orderChooseButton setTitle:@"点击选择所属门店" forState:UIControlStateNormal];
            [orderTextField setText:@""];
            [self initPickerView];
            [self listImage];
        }else if([responseArray objectAtIndex:0] == [NSNumber numberWithBool:NO]){
            alert = [[UIAlertView alloc] initWithTitle:@"提示信息" message:[responseArray objectAtIndex:1] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            alert = nil;
            return;
        }else{
            alert = [[UIAlertView alloc] initWithTitle:@"提示信息" message:[request responseString] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            alert = nil;
            return;
        }
        [alert show];
        [alert release];
        alert = nil;
        [self clearContent];
        return;
    }
    [imageArray removeObjectAtIndex:0];
    [self startUpload];
}

- (void)initPickerView
{
    if(picker == nil) picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, FULL_HEIGHT - 216, FULL_WIDTH, 216)];
    picker.delegate = self;
    picker.showsSelectionIndicator = YES;
    curPhotoCateArray = [photoCateArray objectAtIndex:0];
    
    UIBarButtonItem* closeBtn = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleBordered target:self action:@selector(closePicker:)];
    closeBtn.style = UIBarButtonItemStyleBordered;
    
    UIBarButtonItem* flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    if(pickerToolBar == nil) pickerToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, FULL_WIDTH, 40)];
    [pickerToolBar setItems:[NSArray arrayWithObjects:flexible, closeBtn, nil]];
    [closeBtn release];
    [flexible release];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch(buttonIndex){
        case 0:{
            if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                
            }else{
                [tempArray removeAllObjects];
                [self presentModalViewController:camera animated:YES];
                [camera startRunning];
            }
        }break;
        case 1:{
            
        }break;
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"take photo");
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"cancel");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
