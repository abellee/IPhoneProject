//
//  AbelViewController.h
//  Photography
//
//  Created by Lee Abel on 12-12-14.
//  Copyright (c) 2012年 Lee Abel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AbelViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>{
    UIPickerView* picker;
    UITextField* orderNumber;
    UIImageView* image;
    UIButton* btn;
    
    UIScrollView* scrollView;
    UILabel* cateLabel;
    UILabel* photoCateLabel;
    UILabel* orderLabel;
    UITextField* parentCateTextField;
    UITextField* photoCateTextField;
    UITextField* orderTextField;
    
    UIActionSheet* actionSheet;
}

@end
