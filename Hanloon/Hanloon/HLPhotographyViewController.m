//
//  HLPhotographyViewController.m
//  Hanloon
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import "HLPhotographyViewController.h"
#import "AVCaptureCameraViewController.h"
#import "UIImage+ImageScale.h"
#import "DeletableImageViewController.h"
#import "ASIFormDataRequest.h"
#import "JSONKit.h"
#import "Global.h"
#import "AbelViewController.h"
#import "LoadingView.h"
#import "PickrImage.h"
#import "ProgressViewController.h"

@interface HLPhotographyViewController ()

@end

@implementation HLPhotographyViewController

@synthesize imagePickr;

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
    
//    if (progressView != nil) {
//        [progressView release];
//    }
    
    if (cateArray != nil) {
        [cateArray release];
    }
    
    if (cateList != nil) {
        [cateList release];
    }
    
    if (conn) {
        [conn cancel];
        [conn release];
    }
    
    if (receviedData) {
        [receviedData release];
    }
    
    [camera release];
    
    if (picker != nil) {
        [picker release];
    }
    
    [loadingView release];
    
    if(progressViewController) [progressViewController release];
    
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
    server = [[NSString stringWithFormat:@"%@/cgi-common/upload.php?action=photograph", BASE_URL] retain];
    
    parentCateArray = [[NSArray alloc] initWithObjects:@"西服照片", @"女装照片", @"衬衫照片", @"维修照片", @"退赔照片", nil];
    NSArray* arr0 = [NSArray arrayWithObjects:@"量身", @"试衣", @"成衣", @"参考图", nil];
    NSArray* arr1 = [NSArray arrayWithObjects:@"量身", @"试衣", @"成衣", @"参考图", nil];
    NSArray* arr2 = [NSArray arrayWithObjects:@"量身", @"试衣", @"成衣", @"参考图", nil];
    NSArray* arr3 = [NSArray arrayWithObjects:@"维修衣服照片", nil];
    NSArray* arr4 = [NSArray arrayWithObjects:@"西装", @"衬衫", @"女装", nil];
    NSArray* arr = [NSArray arrayWithObjects:arr0, arr1, arr2, arr3, arr4, nil];
    photoCateArray = [[NSArray alloc] initWithArray:arr];
    
    [self initPickerView];
    
//    progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
//    [progressView setFrame:CGRectMake(45, 55, 200, 20)];
    
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
    orderTextField.keyboardType = UIKeyboardTypeNumberPad;
    
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
    cameraButton = [[UIButton alloc] initWithFrame:CGRectMake(513, 18, photoButtonSkin.size.width, photoButtonSkin.size.height)];
    [cameraButton setBackgroundImage:photoButtonSkin forState:UIControlStateNormal];
    [self.view addSubview:cameraButton];
    [cameraButton addTarget:self action:@selector(cameraButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    imageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(513, 22, photoButtonSkin.size.width - 4, photoButtonSkin.size.height - buttonSkin.size.height - 20)];
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
    
    [self startLoadCateData];
}

- (void)showLoadingView
{
    [self.view setUserInteractionEnabled:NO];
    if (loadingView == nil) {
        loadingView = [[LoadingView alloc] initWithFrame:CGRectMake((FULL_WIDTH - 80) / 2, (FULL_HEIGHT - 80) / 2, 80, 80)];
    }
    [self.view addSubview:loadingView];
}

- (void)hideLoadingView
{
    [self.view setUserInteractionEnabled:YES];
    [loadingView removeFromSuperview];
}

- (void)startLoadCateData
{
    [self showLoadingView];
    [orderChooseButton setTitle:@"正在获取门店信息..." forState:UIControlStateNormal];
    [self performSelectorInBackground:@selector(getCateData) withObject:nil];
}

- (void)finishLoading
{
    [self hideLoadingView];
    [conn cancel];
    [conn release];
    conn = nil;
    [receviedData release];
    receviedData = nil;
}

- (void)getCateData
{
    if(receviedData == nil){
        receviedData = [[NSMutableData alloc] initWithCapacity:0];
    }
    [receviedData setLength:0];
    NSURL* cateURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/query/shopnames", BASE_URL]];
    NSURLRequest* request = [NSURLRequest requestWithURL:cateURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0];
    conn = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    [conn start];
    CFRunLoopRun();
}

- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData *)data
{
    [receviedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    CFRunLoopStop(CFRunLoopGetCurrent());
    [self performSelectorOnMainThread:@selector(loadOutTime) withObject:nil waitUntilDone:YES];
}

- (void)loadOutTime
{
    [orderChooseButton setTitle:@"点击重新加载..." forState:UIControlStateNormal];
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"请求超时" message:@"请求门店信息超时，请确认是否正确连接VPN！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
    [alertView release];
    alertView = nil;
    [self finishLoading];
}

- (void)connectionDidFinishLoading:(NSURLConnection*)connection
{
    CFRunLoopStop(CFRunLoopGetCurrent());
    NSString* returnString = [[NSString alloc] initWithData:receviedData encoding:NSUTF8StringEncoding];
    cateArray = [[returnString objectFromJSONString] retain];
    [returnString release];
    [self performSelectorOnMainThread:@selector(cateDataSuccess) withObject:nil waitUntilDone:YES];
}

- (void)cateDataSuccess
{
    [self finishLoading];
    if ([cateArray count] == 1) {
        [orderChooseButton setTitle:[NSString stringWithFormat:@"(%@)%@", [[cateArray objectAtIndex:0] objectForKey:@"value"], [[cateArray objectAtIndex:0] objectForKey:@"key"]] forState:UIControlStateNormal];
    }else{
        [orderChooseButton setTitle:@"点击选择所属门店" forState:UIControlStateNormal];
    }
}

- (void)finishTakePicture:(PickrImage*)image
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
        for (PickrImage* pickrImage in imageArray) {
            int num = [[imageScrollView subviews] count];
            DeletableImageViewController* deletableImage = [[DeletableImageViewController alloc] init];
            [deletableImage.view setFrame:CGRectMake(num * imageScrollView.frame.size.width, 0, imageScrollView.frame.size.width, imageScrollView.frame.size.height)];
            [deletableImage setImageData:pickrImage size:imageScrollView.frame.size];
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

- (void)deleteImage:(PickrImage *)image controller:(DeletableImageViewController *)imageViewController
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
    if(tempArray && [tempArray count] > 0) [tempArray removeAllObjects];
    [self cameraButtonPressed:sender];
    //[self presentModalViewController:camera animated:YES];
    //[camera startRunning];
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
    //[orderChooseButton setTitle:@"点击选择所属门店" forState:UIControlStateNormal];
    curParentIndex = 0;
    curChildIndex = 0;
    [cateButton setText:@""];
    [orderTextField setText:@""];
}

- (void)orderChooseButtonPressed:(id)sender
{
    if (cateArray == nil || [cateArray count] <= 0) {
        if (conn == nil) {
            [self startLoadCateData];
        }
        return;
    }
    if ([cateArray count] == 1) {
        [orderChooseButton setTitle:[NSString stringWithFormat:@"(%@)%@", [[cateArray objectAtIndex:0] objectForKey:@"value"], [[cateArray objectAtIndex:0] objectForKey:@"key"]] forState:UIControlStateNormal];
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
    if(progressViewController){
        [progressViewController showProgress:0.0];
    }
    NSURL* url = [NSURL URLWithString:server];
    ASIFormDataRequest* request = [[ASIFormDataRequest alloc] initWithURL:url];
    PickrImage* pickrImage = [imageArray objectAtIndex:0];
    UIImage* tempImage = pickrImage.image;
    UIImage* fixOrientation = [tempImage fixOrientation];
    fixOrientation = [fixOrientation scaleByWidth:400.0];
    NSData* imgData = UIImageJPEGRepresentation(fixOrientation, 72.0);
    
    if (!pickrImage.isAlbum) {
        UIImageWriteToSavedPhotosAlbum(tempImage, nil, nil, nil);
    }
    //[assetsLib writeImageToSavedPhotosAlbum:tempImage.CGImage metadata:nil completionBlock:nil];
    
    NSString* orderStr = [NSString stringWithFormat:@"%@-%@", [[cateArray objectAtIndex:curCateIndex] objectForKey:@"key"], [orderTextField text]];
    NSString* parentCateStr = [self getParentCate];
    NSString* photoCateStr = [self getChildCate];
    if(progressViewController == nil){
        progressViewController = [[ProgressViewController alloc] init];
        [self.view addSubview:progressViewController.view];
    }
    [request setDelegate:self];
    [request setData:imgData withFileName:@"photo.jpg" andContentType:@"image/jpeg" forKey:@"photo"];
    [request setPostValue:parentCateStr forKey:@"pid"];
    [request setPostValue:photoCateStr forKey:@"pcid"];
    [request setPostValue:orderStr forKey:@"orderNum"];
    [request setDidFinishSelector:@selector(uploadPhotoFinished:)];
    [request setDidFailSelector:@selector(uploadPhotoFailed:)];
    [request setUploadProgressDelegate:self];
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
    if(progressViewController){
        [progressViewController showProgress:newProgress];
    }
}

- (void)removeProgressView
{
    if(progressViewController){
        [progressViewController.view removeFromSuperview];
        progressViewController = nil;
    }
}

- (void)uploadPhotoFailed:(ASIHTTPRequest*)request
{
    [self removeProgressView];
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
        [self removeProgressView];
        NSArray* responseArray = [[request responseString] objectFromJSONString];
        if([responseArray objectAtIndex:0] == [NSNumber numberWithBool:YES]){
            alert = [[UIAlertView alloc] initWithTitle:@"提示信息" message:@"提交成功!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [cateButton setText:@"点击选择照片分类..."];
            //[orderChooseButton setTitle:@"点击选择所属门店" forState:UIControlStateNormal];
            [orderTextField setText:@""];
            [self initPickerView];
            //[self listImage];
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
//                [tempArray removeAllObjects];
//                [self presentModalViewController:camera animated:YES];
//                [camera startRunning];
                UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
                imagePickr.sourceType = sourceType;
                imagePickr.delegate = self;
                imagePickr.allowsEditing = NO;
                [self presentModalViewController:imagePickr animated:YES];
//                [self popOverPicker:imagePickr];
            }
        }break;
        case 1:{
            UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imagePickr.sourceType = sourceType;
            imagePickr.delegate = self;
            imagePickr.allowsEditing = YES;
            imagePickr.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            [self popOverPicker:imagePickr];
        }break;
    }
}

- (void)popOverPicker:(UIImagePickerController*)pickerController
{
    if (popOver != nil) {
        [popOver release];
        popOver = nil;
    }
    popOver = [[UIPopoverController alloc] initWithContentViewController:pickerController];
    popOver.delegate = self;
    [popOver presentPopoverFromRect:cameraButton.bounds inView:cameraButton permittedArrowDirections:UIPopoverArrowDirectionRight animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)pr didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage* img = [info objectForKey:UIImagePickerControllerOriginalImage];
    PickrImage* pickrImage = [[PickrImage alloc] init];
    if(pr.sourceType == UIImagePickerControllerSourceTypeCamera) [pickrImage isAlbum: NO];
    else [pickrImage isAlbum: YES];
    [pickrImage image:img];
    [self finishTakePicture:pickrImage];
    
    if(popOver) [popOver dismissPopoverAnimated:YES];
    [pr dismissModalViewControllerAnimated:YES];
    [self doneCapture];
    [pickrImage release];
//    if (pr.sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {
//        [pickrImage isAlbum: YES];
//        [popOver dismissPopoverAnimated:YES];
//        [self doneCapture];
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
