//
//  AvatarCell.m
//  YiZu
//
//  Created by Lee Abel on 12-10-15.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "AvatarCell.h"
#import "Global.h"

@implementation AvatarCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImage* headImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"qq" ofType:@"png"]];
        head = [[UIButton alloc] initWithFrame:CGRectMake(15, 5, 80, 80)];
        [head setBackgroundImage:headImg forState:UIControlStateNormal];
        [head addTarget:self action:@selector(showChooser:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:head];
        
        takePhoto = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [takePhoto setTitle:@"马上拍一张!" forState:UIControlStateNormal];
        [takePhoto setFrame:CGRectMake(140, 0, 150, 40)];
        [takePhoto addTarget:self action:@selector(showCamera:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:takePhoto];
        
        album = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [album setTitle:@"选择相册照片" forState:UIControlStateNormal];
        [album setFrame:CGRectMake(140, 50, 150, 40)];
        [album addTarget:self action:@selector(showAlbum:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:album];
        
        [takePhoto addTarget:self action:@selector(showCamera:) forControlEvents:UIControlEventTouchUpInside];
        [album addTarget:self action:@selector(showAlbum:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)showChooser:(id)sender
{
    UIActionSheet* sheet = [[UIActionSheet alloc] initWithTitle:@"请选择头像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"马上拍一张！", @"选择相册照片", nil];
    [sheet showInView:self];
}

- (void)showCamera:(id)sender
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerCameraDeviceFront;
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = sourceType;
    [[[Global sharedGlobal] popUpLayer] presentModalViewController:picker animated:YES];
    [picker release];
    picker = nil;
}

- (void)showAlbum:(id)sender
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    picker.sourceType = sourceType;
    picker.delegate = self;
    picker.allowsEditing = YES;
    [[[Global sharedGlobal] popUpLayer] presentModalViewController:picker animated:YES];
    [picker release];
    picker = nil;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissModalViewControllerAnimated:YES];
    UIImage* img = [info objectForKey:UIImagePickerControllerEditedImage];
    [head setImage:img forState:UIControlStateNormal];
}

- (UIImage*)getAvatarImage
{
    UIImage* img = [head imageForState:UIControlStateNormal];
    return img;
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self performSelector:@selector(showCamera:) withObject:takePhoto];
            break;
        case 1:
            [self performSelector:@selector(showAlbum:) withObject:album];
        default:
            break;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self setSelected:NO animated:NO];
    //	[super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self setSelected:NO animated:YES];
    //	[super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self setSelected:NO animated:YES];
    //	[super touchesCancelled:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self setSelected:NO animated:YES];
    //	[super touchesMoved:touches withEvent:event];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)dealloc
{
    NSLog(@"***********| AvatarCell dealloc! |***********");
    [head release];
    
    head = nil;
    
    [super dealloc];
}

@end
