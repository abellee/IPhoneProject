//
//  AbelViewController.m
//  Photography
//
//  Created by Lee Abel on 12-12-14.
//  Copyright (c) 2012年 Lee Abel. All rights reserved.
//

#import "AbelViewController.h"

@interface AbelViewController ()

@end

@implementation AbelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGRect rect = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    scrollView = [[UIScrollView alloc] initWithFrame:rect];
    scrollView.contentSize = rect.size;
    scrollView.scrollEnabled = YES;
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scrollView];
    
//    parentPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
//    parentPicker.delegate = self;
    
//    [scrollView addSubview:parentPicker];
    cateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 80, 30)];
    cateLabel.text = @"类型:";
    cateLabel.textAlignment = UITextAlignmentRight;
    [scrollView addSubview:cateLabel];
    
    parentCateTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 10, [[UIScreen mainScreen] bounds].size.width - 110, 30)];
    [parentCateTextField setBorderStyle:UITextBorderStyleRoundedRect];
    parentCateTextField.delegate = self;
    [scrollView addSubview:parentCateTextField];
    
    photoCateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 80, 30)];
    photoCateLabel.text = @"照片类型:";
    photoCateLabel.textAlignment = UITextAlignmentRight;
    [scrollView addSubview:photoCateLabel];
    
    photoCateTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 50, [[UIScreen mainScreen] bounds].size.width - 110, 30)];
    [photoCateTextField setBorderStyle:UITextBorderStyleRoundedRect];
    photoCateTextField.delegate = self;
    [scrollView addSubview:photoCateTextField];
    
    orderLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 90, 80, 30)];
    orderLabel.text = @"订单号:";
    orderLabel.textAlignment = UITextAlignmentRight;
    [scrollView addSubview:orderLabel];
    
    orderTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 90, [[UIScreen mainScreen] bounds].size.width - 110, 30)];
    [orderTextField setBorderStyle:UITextBorderStyleRoundedRect];
    orderTextField.delegate = self;
    orderTextField.returnKeyType = UIReturnKeyDone;
    [scrollView addSubview:orderTextField];
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"选择照片" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(10, 140, [[UIScreen mainScreen] bounds].size.width - 20, [[UIScreen mainScreen] bounds].size.height - 170)];
    [scrollView addSubview:btn];
    [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnPressed:(id)sender
{
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"请选择照片来源" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"马上拍一张！", @"相册", nil];
    [actionSheet showInView:self.view];
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:{
            UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
            if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            }
            UIImagePickerController* camera = [[UIImagePickerController alloc] init];
            camera.delegate = self;
            camera.allowsEditing = YES;
            camera.sourceType = sourceType;
            [self presentModalViewController:camera animated:YES];
        }break;
        case 1:{
            UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            UIImagePickerController* imagePickr = [[UIImagePickerController alloc] init];
            imagePickr.sourceType = sourceType;
            imagePickr.delegate = self;
            imagePickr.allowsEditing = YES;
            [self presentModalViewController:imagePickr animated:YES];
        }break;
            
        default:
            break;
    }
}

- (void) imagePickerController:(UIImagePickerController *)pr didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage* img = [info objectForKey:UIImagePickerControllerEditedImage];
    [btn setImage:img forState:UIControlStateNormal];
    [pr dismissModalViewControllerAnimated:YES];
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 0;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 0;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if([textField isEqual:photoCateTextField]){
        
    }else if([textField isEqual:parentCateTextField]){
        
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
    return NO;
}

@end
