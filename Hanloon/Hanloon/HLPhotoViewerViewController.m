//
//  HLPhotoViewerViewController.m
//  Hanloon
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import "HLPhotoViewerViewController.h"
#import "SwipeNoticeViewController.h"
#import "ImageWallViewController.h"
#import "ImageGroupViewController.h"
#import "Definitions.h"
#import "JSONKit.h"
#import "LoadingView.h"
#import "ImageData.h"
#import "Global.h"
#import "AbelViewController.h"

@interface HLPhotoViewerViewController ()

@end

@implementation HLPhotoViewerViewController

@synthesize totalNum;
@synthesize imageDataList;

- (id)init
{
    if (self = [super init]) {
        cateDict = [[NSMutableDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"category" ofType:@"plist"]];
        [self initView];
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"*********************** HLPhotoViewerViewController dealloc ****************************");
    
    if (noticeViewController != nil) {
        [noticeViewController release];
    }
    
    [imageWallViewController release];
    [background release];
    [firstCateLabel release];
    [firstCateButton release];
    [secondCateLabel release];
    [secondCateButton release];
    [thirdCateLabel release];
    [thirdCateButton release];
    [forthCateLabel release];
    [forthCateButton release];
    [fifthCateLabel release];
    [fifthCateButton release];
    [backButton release];
    [buttonList release];
    [loadingView release];
    [imageDataList removeAllObjects];
    [imageDataList release];
    [tableViewController release];
    
    [super dealloc];
}

- (void)initView
{
    background = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"background" ofType:@"png"]]];
    background.userInteractionEnabled = NO;
    [self.view addSubview:background];
    
    tableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    tableViewController.tableView.dataSource = self;
    tableViewController.tableView.delegate = self;
    
    popOver = [[UIPopoverController alloc] initWithContentViewController:tableViewController];
    
    [self initButtons];
    
    buttonList = [[NSArray alloc] initWithObjects:firstCateButton, secondCateButton, thirdCateButton, forthCateButton, fifthCateButton, nil];
    
    imageWallViewController = [[ImageWallViewController alloc] init];
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, FULL_WIDTH, FULL_HEIGHT)];
    [imageWallViewController setView:view];
    [view release];
    [self.view addSubview:imageWallViewController.view];
    
    noticeViewController = [[SwipeNoticeViewController alloc] init];
    [noticeViewController.view setFrame:CGRectMake(0, 0, FULL_WIDTH, FULL_HEIGHT)];
    [self.view addSubview:noticeViewController.view];
}

- (void)initButtons
{
    firstCateLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, 100, 30)];
    [firstCateLabel setText:@"图库类型:"];
    [firstCateLabel setTextColor:[UIColor whiteColor]];
    firstCateLabel.backgroundColor = [UIColor clearColor];
    [firstCateLabel setFont:[UIFont boldSystemFontOfSize:18.0]];
    [self.view addSubview:firstCateLabel];
    
    UIImage* buttonImage0 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button" ofType:@"png"]];
    UIImage* buttonImage1 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"button1" ofType:@"png"]];
    firstCateButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 55, 170, 45)];
    [firstCateButton setTitle:@"点击选择图库" forState:UIControlStateNormal];
    [firstCateButton setTitle:@"点击选择图库" forState:UIControlStateHighlighted];
    [firstCateButton setBackgroundImage:buttonImage0 forState:UIControlStateNormal];
    [firstCateButton setBackgroundImage:buttonImage1 forState:UIControlStateHighlighted];
    firstCateButton.tag = 0;
    [self.view addSubview:firstCateButton];
    [firstCateButton addTarget:self action:@selector(cateButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    secondCateLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 120, 100, 30)];
    [secondCateLabel setText:@"照片类型:"];
    [secondCateLabel setTextColor:[UIColor whiteColor]];
    secondCateLabel.backgroundColor = [UIColor clearColor];
    [secondCateLabel setFont:[UIFont boldSystemFontOfSize:18.0]];
    [self.view addSubview:secondCateLabel];
    
    secondCateButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 155, 170, 45)];
    [secondCateButton setTitle:@"点击选择类型" forState:UIControlStateNormal];
    [secondCateButton setTitle:@"点击选择类型" forState:UIControlStateHighlighted];
    [secondCateButton setTitle:@"点击选择类型" forState:UIControlStateDisabled];
    [secondCateButton setBackgroundImage:buttonImage0 forState:UIControlStateNormal];
    [secondCateButton setBackgroundImage:buttonImage1 forState:UIControlStateHighlighted];
    secondCateButton.tag = 1;
    [self.view addSubview:secondCateButton];
    [secondCateButton addTarget:self action:@selector(cateButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    thirdCateLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 220, 100, 30)];
    [thirdCateLabel setText:@"照片分类:"];
    [thirdCateLabel setTextColor:[UIColor whiteColor]];
    thirdCateLabel.backgroundColor = [UIColor clearColor];
    [thirdCateLabel setFont:[UIFont boldSystemFontOfSize:18.0]];
    [self.view addSubview:thirdCateLabel];
    
    thirdCateButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 255, 170, 45)];
    [thirdCateButton setTitle:@"点击选择类型" forState:UIControlStateNormal];
    [thirdCateButton setTitle:@"点击选择类型" forState:UIControlStateHighlighted];
    [thirdCateButton setTitle:@"点击选择类型" forState:UIControlStateDisabled];
    [thirdCateButton setBackgroundImage:buttonImage0 forState:UIControlStateNormal];
    [thirdCateButton setBackgroundImage:buttonImage1 forState:UIControlStateHighlighted];
    thirdCateButton.tag = 2;
    [self.view addSubview:thirdCateButton];
    [thirdCateButton addTarget:self action:@selector(cateButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    forthCateLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 320, 100, 30)];
    [forthCateLabel setText:@"第四类:"];
    [forthCateLabel setTextColor:[UIColor whiteColor]];
    forthCateLabel.backgroundColor = [UIColor clearColor];
    [forthCateLabel setFont:[UIFont boldSystemFontOfSize:18.0]];
    [self.view addSubview:forthCateLabel];
    
    forthCateButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 355, 170, 45)];
    [forthCateButton setTitle:@"点击选择类型" forState:UIControlStateNormal];
    [forthCateButton setTitle:@"点击选择类型" forState:UIControlStateHighlighted];
    [forthCateButton setTitle:@"点击选择类型" forState:UIControlStateDisabled];
    [forthCateButton setBackgroundImage:buttonImage0 forState:UIControlStateNormal];
    [forthCateButton setBackgroundImage:buttonImage1 forState:UIControlStateHighlighted];
    forthCateButton.tag = 3;
    [self.view addSubview:forthCateButton];
    [forthCateButton addTarget:self action:@selector(cateButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    fifthCateLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 420, 100, 30)];
    [fifthCateLabel setText:@"第五类:"];
    [fifthCateLabel setTextColor:[UIColor whiteColor]];
    fifthCateLabel.backgroundColor = [UIColor clearColor];
    [fifthCateLabel setFont:[UIFont boldSystemFontOfSize:18.0]];
    [self.view addSubview:fifthCateLabel];
    
    fifthCateButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 455, 170, 45)];
    [fifthCateButton setTitle:@"点击选择类型" forState:UIControlStateNormal];
    [fifthCateButton setTitle:@"点击选择类型" forState:UIControlStateHighlighted];
    [fifthCateButton setTitle:@"点击选择类型" forState:UIControlStateDisabled];
    [fifthCateButton setBackgroundImage:buttonImage0 forState:UIControlStateNormal];
    [fifthCateButton setBackgroundImage:buttonImage1 forState:UIControlStateHighlighted];
    fifthCateButton.tag = 4;
    [self.view addSubview:fifthCateButton];
    [fifthCateButton addTarget:self action:@selector(cateButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    backButton = [[UIButton alloc] initWithFrame:CGRectMake(15, FULL_HEIGHT - 80, 170, 45)];
    [backButton setTitle:@"返回首页" forState:UIControlStateNormal];
    [backButton setTitle:@"返回首页" forState:UIControlStateHighlighted];
    [backButton setBackgroundImage:buttonImage0 forState:UIControlStateNormal];
    [backButton setBackgroundImage:buttonImage1 forState:UIControlStateHighlighted];
    [self.view addSubview:backButton];
    [backButton addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self disabledAllButtons];
}

- (void)getTPOCate:(int)tag
{
    [self enabledNextButton:tag];
    if (tag < 22 && tag != 7) {
        return;
    }
    [self showLoadingView];
    [self performSelectorInBackground:@selector(getTPOCateWithTag:) withObject:[NSNumber numberWithInt:tag]];
}

- (void)getTPOCateWithTag:(NSNumber*)tag
{
    int idNum = [tag intValue];
    int num = idNum;
    if (num == 7) {
        num = 0;
    }
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"http://oa.hanloon.com/photo/query-type-%d", num]];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSURLResponse* response;
    NSError* error;
    NSData* returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString* returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    
    if ([returnString isEqualToString:@"null"]) {
        [self performSelectorOnMainThread:@selector(getData:) withObject:tag waitUntilDone:YES];
        [returnString release];
        return;
    }
    NSArray* array = [returnString objectFromJSONString];
    [self performSelectorOnMainThread:@selector(queryResult:) withObject:array waitUntilDone:YES];
    [returnString release];
}

- (void)disabledNextButton
{
    int index = [buttonList indexOfObject:curButton];
    if (index + 1 < [buttonList count]) {
        UIButton* btn = [buttonList objectAtIndex:index + 1];
        btn.enabled = NO;
    }
}

- (void)getData:(NSNumber*)tag
{
    [self disabledNextButton];
    if (!loadingView.hidden) {
        [self showLoadingView];
    }
    curPage = 0;
    isLoading = true;
    curTag = [tag intValue];
    [self performSelectorInBackground:@selector(getDataFromServer:) withObject:tag];
}

- (void)queryResult:(NSArray*)array
{
    [self hideLoadingView];
    int index = [buttonList indexOfObject:curButton];
    int tag = -1;
    if (index >= [buttonList count] - 1) {
        return;
    }else{
        index++;
        UIButton* btn = [buttonList objectAtIndex:index];
        tag = btn.tag;
    }
    if (tag > -1) {
        NSMutableArray* tempArr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary* dict in array) {
            NSMutableDictionary* tempDict = [NSMutableDictionary dictionaryWithCapacity:0];
            [tempDict setObject:[dict objectForKey:@"id"] forKey:@"cateId"];
            [tempDict setObject:[dict objectForKey:@"name"] forKey:@"cateName"];
            [tempArr addObject:tempDict];
        }
        [cateDict setObject:tempArr forKey:[NSString stringWithFormat:@"id%d", tag]];
    }
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

- (void)enabledNextButton:(int)tag
{
    int index = [buttonList indexOfObject:curButton];
    if (secondCateButton.tag == 1 && index == 2) {
        [self getData:[NSNumber numberWithInt:1]];
        return;
    }
    index++;
    for (int i = index; i < [buttonList count]; i++) {
        UIButton* btn = [buttonList objectAtIndex:i];
        if (i == index) {
            btn.enabled = YES;
            btn.tag = tag;
        }else{
            btn.enabled = NO;
        }
        [btn setTitle:@"点击选择类型" forState:UIControlStateNormal];
        [btn setTitle:@"点击选择类型" forState:UIControlStateHighlighted];
    }
}

- (void)getDataFromServer:(NSNumber*)tag
{
    curPage++;
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"http://oa.hanloon.com/photo/tpo-%d-%d", [tag intValue], curPage]];
    if (secondCateButton.tag == 1) {
        url = [NSURL URLWithString:[[NSString stringWithFormat:@"http://oa.hanloon.com/photo/photograph/%@/%@/%d", [secondCateButton titleForState:UIControlStateNormal], [thirdCateButton titleForState:UIControlStateNormal], curPage] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
//    url = [NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.3.108/test.php?d=%d", 1213]];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSURLResponse* response;
    NSError* error;
    NSData* returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString* returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    NSDictionary* dict = [returnString objectFromJSONString];
//    NSLog(@"%@>>>>>>%@", returnString, [url absoluteString]);
    [returnString release];
    [self performSelectorOnMainThread:@selector(showImageWall:) withObject:dict waitUntilDone:YES];
}

- (void)showImageWall:(NSDictionary*)dict
{
    isLoading = false;
    [self hideLoadingView];
    if (![dict objectForKey:@"num"]) {
        totalNum = 0;
        [imageDataList removeAllObjects];
    }else{
        totalNum = [[dict objectForKey:@"num"] intValue];
        if (imageDataList == nil) {
            imageDataList = [[NSMutableArray alloc] initWithCapacity:0];
        }
        if ([imageDataList count] > 0 && curPage == 1) {
            [imageDataList removeAllObjects];
        }
        NSArray* tempArr = [dict objectForKey:@"data"];
        for (NSDictionary* dictionary in tempArr) {
            ImageData* imageData = [[ImageData alloc] init];
            [imageData originImage:[dictionary objectForKey:@"origin"]];
            [imageData thumbImage:[dictionary objectForKey:@"thumbnail"]];
            [imageData name:[dictionary objectForKey:@"name"]];
            [imageDataList addObject:imageData];
            [imageData release];
        }
        if (curPage > 1) {
            [self addImageWall:[tempArr count]];
            return;
        }
    }
    [self showImageOnWall];
}

- (void)showImageGroup:(ImageData *)imageData
{
    if (imageGroupViewController == nil) {
        imageGroupViewController = [[ImageGroupViewController alloc] init];
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, FULL_WIDTH, FULL_HEIGHT)];
        view.backgroundColor = [UIColor blackColor];
        [imageGroupViewController setView:view];
        [view release];
    }
    [imageGroupViewController showThumbImageByImageData:imageData parent:self];
    [imageGroupViewController showOriginImageByImageData:imageData parent:self];
    [self.view addSubview:imageGroupViewController.view];
}

- (void)removeImageGroup
{
    if (imageGroupViewController != nil) {
        [imageGroupViewController.view removeFromSuperview];
        [imageGroupViewController release];
        imageGroupViewController = nil;
    }
}

- (void)addImageWall:(int)num
{
    [imageWallViewController addImage:num];
    if (imageGroupViewController != nil) {
        [imageGroupViewController nextPageLoaded:num];
    }
}

- (void)loadNextPage
{
    if ([imageDataList count] >= totalNum) {
        return;
    }
    [self showLoadingView];
    isLoading = true;
    [self performSelectorInBackground:@selector(getDataFromServer:) withObject:[NSNumber numberWithInt:curTag]];
}

- (void)showImageOnWall
{
    [self resetImageWall];
    [imageWallViewController showImages:imageDataList num:totalNum parent:self];
}

- (void)resetImageWall
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDuration:0.3];
    
    [imageWallViewController.view setFrame:CGRectMake(0, 0, FULL_WIDTH, FULL_HEIGHT)];
    
    [UIView commitAnimations];
}

- (void)backButtonPressed:(id)sender
{
    [[[Global sharedInstance] app] backToMain];
}

- (void)cateButtonPressed:(id)sender
{
    curButton = (UIButton*)sender;
    curList = [cateDict objectForKey:[NSString stringWithFormat:@"id%d", curButton.tag]];
    [tableViewController.tableView reloadData];
    [popOver presentPopoverFromRect:curButton.bounds inView:curButton permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [curList count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellStr = @"cellStr";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr] autorelease];
    }
    
    cell.textLabel.text = [[curList objectAtIndex:indexPath.row] objectForKey:@"cateName"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int cateId = [[[curList objectAtIndex:indexPath.row] objectForKey:@"cateId"] intValue];
    [self getTPOCate:cateId];
    [curButton setTitle:[[curList objectAtIndex:indexPath.row] objectForKey:@"cateName"] forState:UIControlStateNormal];
    [curButton setTitle:[[curList objectAtIndex:indexPath.row] objectForKey:@"cateName"] forState:UIControlStateHighlighted];
    [popOver dismissPopoverAnimated:YES];
}

- (void)disabledAllButtons
{
    secondCateButton.enabled = NO;
    thirdCateButton.enabled = NO;
    forthCateButton.enabled = NO;
    fifthCateButton.enabled = NO;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (noticeViewController != nil) {
        [noticeViewController.view removeFromSuperview];
        [noticeViewController release];
        noticeViewController = nil;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
