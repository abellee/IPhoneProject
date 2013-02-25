//
//  AbelViewController.m
//  Photography
//
//  Created by Lee Abel on 12-12-14.
//  Copyright (c) 2012年 Lee Abel. All rights reserved.
//

#import "AbelViewController.h"
#import "ASIFormDataRequest.h"
#import "JSONKit.h"
#import "ImageViewController.h"
#import "UIImage+ImageScale.h"

@interface AbelViewController ()

@end

@implementation AbelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    server = @"http://oa.hanloon.com/cgi-common/upload.php?action=photograph";
    
    assetsLib = [[ALAssetsLibrary alloc] init];
    
    [assetsLib enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
    } failureBlock:^(NSError *error) {
        if (error.code == ALAssetsLibraryAccessUserDeniedError) {
            alert = [[UIAlertView alloc] initWithTitle:@"无相册权限" message:@"请在 系统设置->隐私->照片 中打开 恒龙拍照系统！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            alert = nil;
        }else{

        }
    }];
    
    //[self showAlertInputView];
    
    imageList = [[NSMutableArray alloc] initWithCapacity:1];
    failedImageList = [[NSMutableArray alloc] initWithCapacity:1];
    imageControllerList = [[NSMutableArray alloc] initWithCapacity:1];
    tempImageList = [[NSMutableArray alloc] initWithCapacity:1];
    
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
    
	// Do any additional setup after loading the view, typically from a nib.
    CGRect recta = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    scrollView = [[UIScrollView alloc] initWithFrame:recta];
    scrollView.contentSize = recta.size;
//    scrollView.scrollEnabled = YES;
//    scrollView.pagingEnabled = YES;
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scrollView];
    
    cateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 80, 30)];
    cateLabel.text = @"照片类型:";
    cateLabel.textAlignment = UITextAlignmentRight;
    [scrollView addSubview:cateLabel];
    [cateLabel release];
    cateLabel = nil;
    
    parentCateTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 10, [[UIScreen mainScreen] bounds].size.width - 110, 30)];
    [parentCateTextField setBorderStyle:UITextBorderStyleRoundedRect];
    parentCateTextField.delegate = self;
    [scrollView addSubview:parentCateTextField];
    
    //photoCateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 80, 30)];
    //photoCateLabel.text = @"照片类型:";
    //photoCateLabel.textAlignment = UITextAlignmentRight;
    //[scrollView addSubview:photoCateLabel];
    //[photoCateLabel release];
    
    photoCateTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 50, [[UIScreen mainScreen] bounds].size.width - 110, 30)];
    [photoCateTextField setBorderStyle:UITextBorderStyleRoundedRect];
    photoCateTextField.delegate = self;
    [scrollView addSubview:photoCateTextField];
    
    orderLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 90, 80, 30)];
    orderLabel.text = @"尺寸单号:";
    orderLabel.textAlignment = UITextAlignmentRight;
    [scrollView addSubview:orderLabel];
    [orderLabel release];
    orderLabel = nil;
    
    cateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cateButton.tag = -1;
    [cateButton setTitle:@"正在获取分类信息" forState:UIControlStateNormal];
    [cateButton setFrame:CGRectMake(100, 90, 200, 30)];
    [scrollView addSubview:cateButton];
    [cateButton addTarget:self action:@selector(cateButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    orderTextField = [[UITextField alloc] initWithFrame:CGRectMake(310, 90, [[UIScreen mainScreen] bounds].size.width - 320, 30)];
    [orderTextField setBorderStyle:UITextBorderStyleRoundedRect];
    orderTextField.delegate = self;
    orderTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    orderTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    orderTextField.returnKeyType = UIReturnKeyDone;
    orderTextField.placeholder = @"请输入数字单号";
    orderTextField.delegate = self;
    [scrollView addSubview:orderTextField];
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"选择照片" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(10, 140, [[UIScreen mainScreen] bounds].size.width - 20, [[UIScreen mainScreen] bounds].size.height - 280)];
    [scrollView addSubview:btn];
    [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    submit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [submit setTitle:@"确认提交" forState:UIControlStateNormal];
    [submit setFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width - 100) / 2, btn.frame.origin.y + btn.frame.size.height + 70, 100, 30)];
    [scrollView addSubview:submit];
    [submit addTarget:self action:@selector(submitPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    ressetButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [ressetButton setTitle:@"清空" forState:UIControlStateNormal];
    [ressetButton setFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width - 100) / 2 + 120, btn.frame.origin.y + btn.frame.size.height + 70, 100, 30)];
    [scrollView addSubview:ressetButton];
    [ressetButton addTarget:self action:@selector(resetContent:) forControlEvents:UIControlEventTouchUpInside];
    
    curCateIndex = -1;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationCallback:) name:nil object:nil];
    
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
    [cateButton setTitle:@"点击选择所属门店" forState:UIControlStateNormal];
}

- (void)cateButtonPressed:(id)sender
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
    [popOver presentPopoverFromRect:cateButton.bounds inView:cateButton permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
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
    [cateButton setTitle:[NSString stringWithFormat:@"(%@)%@", [[cateArray objectAtIndex:indexPath.row] objectForKey:@"value"], [[cateArray objectAtIndex:indexPath.row] objectForKey:@"key"]] forState:UIControlStateNormal];
    curCateIndex = indexPath.row;
    [popOver dismissPopoverAnimated:YES];
}

- (void)resetContent:(id)sender
{
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"清空内容" message:@"确认清空所有内容?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
    [alertView release];
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

- (void)notificationCallback:(NSNotification*)notification
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        if([[notification name] isEqualToString:@"UIDeviceOrientationDidChangeNotification"] || [[notification name] isEqualToString:@"AWBStatus"] || [[notification name] isEqualToString:@"AEStatus"]){
            rect = [self getRect];
            [self resetToolbar];
        }
    }
}

- (void)initPickerView
{
    picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 216, [[UIScreen mainScreen] bounds].size.width, 216)];
    picker.delegate = self;
    picker.showsSelectionIndicator = YES;
    curPhotoCateArray = [photoCateArray objectAtIndex:0];
    
    UIBarButtonItem* closeBtn = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleBordered target:self action:@selector(closePicker:)];
    closeBtn.style = UIBarButtonItemStyleBordered;
    
    UIBarButtonItem* flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    pickerToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 40)];
    [pickerToolBar setItems:[NSArray arrayWithObjects:flexible, closeBtn, nil]];
    [closeBtn release];
    [flexible release];
}

- (void) showAlertInputView
{
    serverURLTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 45, 245, 30)];
    serverURLTextField.backgroundColor = [UIColor whiteColor];
    serverURLTextField.autocorrectionType = NO;
    serverURLTextField.autocapitalizationType = NO;
    alert = [[UIAlertView alloc] initWithTitle:@"上传地址" message:@"填写服务器上传地址" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert addSubview:serverURLTextField];
    [alert show];
    [alert release];
    alert = nil;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
//    server = [[NSString alloc] initWithString:serverURLTextField.text ? serverURLTextField.text : @""];
    switch (buttonIndex) {
        case 0:
            [alertView dismissWithClickedButtonIndex:buttonIndex animated:YES];
            break;
        case 1:
            [self clearContent];
            break;
        default:
            break;
    }
}

- (void)clearContent
{
    [parentCateTextField setText:@""];
    [photoCateTextField setText:@""];
    [orderTextField setText:@""];
    [imageList removeAllObjects];
    [imageView removeFromSuperview];
    [imageView release];
    imageView = nil;
    isUploading = false;
    [cateButton setTitle:@"点击选择所属门店" forState:UIControlStateNormal];
    curCateIndex = -1;
}

- (void)closePicker:(id)sender
{
    [parentCateTextField resignFirstResponder];
    [photoCateTextField resignFirstResponder];
    //[picker release];
    //[self initPickerView];
}

- (void)submitPressed:(id)sender
{
    if(isUploading) return;
    if([imageList count] > 0 && [orderTextField text] && [parentCateTextField text] && [photoCateTextField text] && curCateIndex != -1){
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
    UIImage* tempImage = [imageList objectAtIndex:0];
    UIImage* fixOrientation = [tempImage fixOrientation];
    NSData* imgData = UIImageJPEGRepresentation(fixOrientation, 72.0);
    
//    UIImageWriteToSavedPhotosAlbum([imageList objectAtIndex:0], nil, nil, nil);
    [assetsLib writeImageToSavedPhotosAlbum:tempImage.CGImage metadata:nil completionBlock:nil];
    
    NSString* orderStr = [NSString stringWithFormat:@"%@-%@", [[cateArray objectAtIndex:curCateIndex] objectForKey:@"key"], [orderTextField text]];
    NSString* parentCateStr = [parentCateTextField text];
    NSString* photoCateStr = [photoCateTextField text];
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
    if([imageList count] == 1){
        if(alert){
            [alert dismissWithClickedButtonIndex:0 animated:YES];
            [alert release];
            alert = nil;
        }
        NSArray* responseArray = [[request responseString] objectFromJSONString];
        if([responseArray objectAtIndex:0] == [NSNumber numberWithBool:YES]){
            alert = [[UIAlertView alloc] initWithTitle:@"提示信息" message:@"提交成功!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [parentCateTextField setText:@""];
            [photoCateTextField setText:@""];
            [orderTextField setText:@""];
            [self initPickerView];
            //[btn setImage:nil forState:UIControlStateNormal];
            [btn setFrame:CGRectMake(10, 140, [[UIScreen mainScreen] bounds].size.width - 20, [[UIScreen mainScreen] bounds].size.height - 280)];
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
    [imageList removeObjectAtIndex:0];
    [self startUpload];
}

- (void)btnPressed:(id)sender
{
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"请选择照片来源" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"马上拍一张！", @"相册", nil];
    [actionSheet showInView:self.view];
    [actionSheet release];
    actionSheet = nil;
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:{
            if(camera == nil){
                UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
                if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                }
                camera = [[UIImagePickerController alloc] init];
                camera.delegate = self;
                camera.allowsEditing = NO;
                camera.sourceType = sourceType;
                camera.showsCameraControls = NO;
                camera.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
                rect = [self getRect];
                [self resetToolbar];
                camera.cameraOverlayView = toolbar;
            }
            [self presentModalViewController:camera animated:YES];
            //[self popOverPicker:camera];
        }break;
        case 1:{
            UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            UIImagePickerController* imagePickr = [[UIImagePickerController alloc] init];
            imagePickr.sourceType = sourceType;
            imagePickr.delegate = self;
            imagePickr.allowsEditing = YES;
            imagePickr.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            //[self presentModalViewController:imagePickr animated:YES];
            [self popOverPicker:imagePickr];
        }break;
        default:
            break;
    }
}

-(void)popOverPicker:(UIImagePickerController*)pickerController
{
    if (popOver != nil) {
        [popOver release];
        popOver = nil;
    }
    popOver = [[UIPopoverController alloc] initWithContentViewController:pickerController];
    popOver.delegate = self;
    [popOver presentPopoverFromRect:CGRectMake(184, 500, 400, 500) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    //NSLog(@"dsafsdfsd");
}

- (void)setImageList:(NSMutableArray *)images
{
    imageList = images;
}

-(CGRect) getRect
{
    /*UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    switch (orientation) {
        case UIInterfaceOrientationPortrait:
        case UIInterfaceOrientationPortraitUpsideDown:
            return CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 60, [[UIScreen mainScreen] bounds].size.width, 60);
            break;
        case UIInterfaceOrientationLandscapeRight:
        case UIInterfaceOrientationLandscapeLeft:
            return CGRectMake(0, [[UIScreen mainScreen] bounds].size.width - 60, [[UIScreen mainScreen] bounds].size.height, 60);
            break;
            
        default:
            break;
    }*/
    return CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 60, [[UIScreen mainScreen] bounds].size.width, 60);
}

- (void) imagePickerController:(UIImagePickerController *)pr didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage* img = [info objectForKey:UIImagePickerControllerOriginalImage];
    NSLog(@"%d", img.imageOrientation);
    [tempImageList addObject:img];
    if (pr.sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {
        [popOver dismissPopoverAnimated:YES];
        [self finishPicture];
    }
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

- (void)resetToolbar
{
    if(toolbar == nil){
        toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, rect.origin.y, rect.size.width, 60)];
        UIBarButtonItem* exitButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(toolbarButtonPressed:)];
        exitButton.tag = 0;
        UIBarButtonItem* takePhoto = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(toolbarButtonPressed:)];
        takePhoto.tag = 1;
        UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(toolbarButtonPressed:)];
        doneButton.tag = 2;
        UIBarButtonItem* flexiable = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        toolbar.items = [NSArray arrayWithObjects:exitButton, flexiable, takePhoto, flexiable, doneButton, nil];
        [exitButton release];
        [takePhoto release];
        [doneButton release];
        [flexiable release];
    }
    [toolbar setFrame:CGRectMake(0, rect.origin.y, rect.size.width, 60)];
}

- (void)toolbarButtonPressed:(UIBarButtonItem*)sender
{
    switch (sender.tag) {
        case 0:
            [camera dismissModalViewControllerAnimated:YES];
            [tempImageList removeAllObjects];
            break;
        case 1:
            [camera takePicture];
            break;
        case 2:
            [self finishPicture];
            break;
            
        default:
            break;
    }
}

- (void)finishPicture{
    [imageList addObjectsFromArray:tempImageList];
    [tempImageList removeAllObjects];
    if(camera) [camera dismissModalViewControllerAnimated:YES];
    if([imageList count] == 0){
        [btn setFrame:CGRectMake(10, 140, [[UIScreen mainScreen] bounds].size.width - 20, [[UIScreen mainScreen] bounds].size.height - 280)];
        return;
    }
    [btn setFrame:CGRectMake(10, 140, [[UIScreen mainScreen] bounds].size.width - 20, 30)];
    if(imageView == nil){
        CGRect recta = CGRectMake(10, 200, [[UIScreen mainScreen] bounds].size.width - 20, 700);
        imageView = [[UIScrollView alloc] initWithFrame:recta];
        //imageView.scrollEnabled = YES;
        imageView.pagingEnabled = YES;
        imageView.showsHorizontalScrollIndicator = NO;
        imageView.showsVerticalScrollIndicator = NO;
        imageView.backgroundColor = [UIColor clearColor];
    }
    [scrollView addSubview:imageView];
    [self listImage];
}

-(void)deleteImage:(UIImage *)img
{
    NSInteger index = [imageList indexOfObject:img];
    [imageList removeObjectAtIndex:index];
    ImageViewController* ivc = [imageControllerList objectAtIndex:index];
    [imageControllerList removeObjectAtIndex:index];
    [ivc.view removeFromSuperview];
    [ivc release];
    [self listImage];
}

- (void)listImage
{
    for (ImageViewController* ivvc in imageControllerList) {
        [ivvc.view removeFromSuperview];
        [ivvc release];
    }
    [imageControllerList removeAllObjects];
    for (UIImage* pic in imageList) {
        NSInteger index = [imageList indexOfObject:pic];
        
        int preHeight = 0;
        if (index > 0) {
            ImageViewController* preImageViewController = [imageControllerList objectAtIndex:index - 1];
            preHeight = preImageViewController.view.frame.origin.x + preImageViewController.view.frame.size.width;
        }
        
        ImageViewController* imageViewController = [[ImageViewController alloc] init];
        [imageViewController addPicture:pic parent:self];
        [imageViewController.view setFrame:CGRectMake(preHeight, 0, [[UIScreen mainScreen] bounds].size.width - 20, 700)];
        [imageView addSubview:imageViewController.view];
        
        [imageControllerList addObject:imageViewController];
        //[imageViewController release];
    }
    if ([imageControllerList count] > 0) {
        ImageViewController* lastImageView = [imageControllerList objectAtIndex:[imageControllerList count] - 1];
        imageView.contentSize = CGSizeMake(lastImageView.view.frame.origin.x + lastImageView.view.frame.size.width, 700);
    }
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

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component == 0){
        curPhotoCateArray = [photoCateArray objectAtIndex:row];
        [picker selectRow:0 inComponent:1 animated:YES];
        [picker reloadComponent:1];
    }
    [parentCateTextField setText:[parentCateArray objectAtIndex:[picker selectedRowInComponent:0]]];
    [photoCateTextField setText:[curPhotoCateArray objectAtIndex:[picker selectedRowInComponent:1]]];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if([textField isEqual:photoCateTextField] || [textField isEqual:parentCateTextField]){
        textField.inputView = picker;
        textField.inputAccessoryView = pickerToolBar;
        NSInteger pindex = 0;
        NSInteger cindex = 0;
        if(picker){
            pindex = [picker selectedRowInComponent:0];
            cindex = [picker selectedRowInComponent:1];
        }
        [photoCateTextField setText:[curPhotoCateArray objectAtIndex:cindex]];
        [parentCateTextField setText:[parentCateArray objectAtIndex:pindex]];
        return YES;
    }else if([textField isEqual:orderTextField]){
        return YES;
    }
    return NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [orderTextField resignFirstResponder];
    return YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation == UIInterfaceOrientationPortrait) {
        return YES;
    }
    return NO;
}

-(void)dealloc
{
    [scrollView release];
    [parentCateTextField release];
    [photoCateTextField release];
    [orderTextField release];
    [parentCateArray release];
    [photoCateArray release];
    [picker release];
    [pickerToolBar release];
    [server release];
    [progressView release];
    [imageList removeAllObjects];
    [imageList release];
    [tempImageList removeAllObjects];
    [tempImageList release];
    
    [super dealloc];
}

@end
