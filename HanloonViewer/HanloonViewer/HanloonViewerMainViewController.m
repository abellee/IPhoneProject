//
//  HanloonViewerMainViewController.m
//  HanloonViewer
//
//  Created by Abel Lee on 13-2-12.
//  Copyright (c) 2013年 Abel Lee. All rights reserved.
//

#import "HanloonViewerMainViewController.h"
#import "ImageWallViewController.h"
#import "Global.h"
#import "JSONKit.h"
#import "ImageDownloadData.h"
#import "ImageGroupViewController.h"
#import "Loader.h"
#import "LoadingView.h"

@implementation HanloonViewerMainViewController

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setView:(UIView *)view
{
    [super setView:view];
    
    [self initView];
    
//    UISwipeGestureRecognizer* swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureRecognizer:)];
//    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
//    [self.view addGestureRecognizer:swipeLeft];
//    [swipeLeft release];
//    
//    UISwipeGestureRecognizer* swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureRecognizer:)];
//    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
//    [self.view addGestureRecognizer:swipeRight];
//    [swipeRight release];
}

- (void)imageViewInterface:(ImageDownloadData *)data
{
    if (groupViewController == nil) {
        groupViewController = [[ImageGroupViewController alloc] init];
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width)];
        view.backgroundColor = [UIColor blackColor];
        [groupViewController setView:view];
        [view release];
        [self.view addSubview:groupViewController.view];
    }
    [groupViewController showImageWithDownloadData:data];
}

- (void)cancelGroupView
{
    [groupViewController.view removeFromSuperview];
    [groupViewController release];
    groupViewController = nil;
}

- (void) initView
{
    [[Global sharedGlobal] setApp:self];
//    firstLevel = [[NSArray alloc] initWithObjects:@"拍照照片", @"TPO图库", nil];
//    photoCate = [[NSArray alloc] initWithObjects:@"西装照片", @"女装照片", @"衬衫照片", @"维修照片", @"退赔照片", nil];
//    NSArray* arr0 = [NSArray arrayWithObjects:@"量身", @"试衣", @"成衣", @"参考图", nil];
//    NSArray* arr1 = [NSArray arrayWithObjects:@"量身", @"试衣", @"成衣", @"参考图", @"尺寸单上传", nil];
//    NSArray* arr2 = [NSArray arrayWithObjects:@"量身", @"试衣", @"成衣", @"参考图", nil];
//    NSArray* arr3 = [NSArray arrayWithObjects:@"维修单上传", @"维修衣服照片", nil];
//    NSArray* arr4 = [NSArray arrayWithObjects:@"退赔衣服照片", nil];
//    photoChildCate = [[NSArray alloc] initWithObjects:arr0, arr1, arr2, arr3, arr4, nil];
//    
//    photoCateLabel= [[NSArray alloc] initWithObjects:@"照片分类", @"照片类别", nil];
//    tpoCateLabel = [[NSArray alloc] initWithObjects:@"tpo照片分类", @"tpo照片类别", @"tpo照片颜色", nil];
    
    labelList = [[NSMutableArray alloc] initWithCapacity:1];
    buttonList = [[NSMutableArray alloc] initWithCapacity:1];
    
    lastTag = -1;
    
    navigatorDataList = [[NSMutableDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"category" ofType:@"plist"]];
    
    curList = [navigatorDataList objectForKey:@"id0"];
    
    container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, [[UIScreen mainScreen] bounds].size.width)];
    container.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:container];
    
    cateScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 200, [[UIScreen mainScreen] bounds].size.width)];
    cateScrollView.showsHorizontalScrollIndicator = NO;
    [container addSubview:cateScrollView];
    
    [self initCateChoose];
}

- (void) initCateChoose
{
    firstLevelLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 100, 30)];
    [firstLevelLabel setText:@"图库类型:"];
    firstLevelLabel.backgroundColor = [UIColor clearColor];
    firstLevelLabel.textColor = [UIColor whiteColor];
    firstLevelLabel.textAlignment = NSTextAlignmentCenter;
    [cateScrollView addSubview:firstLevelLabel];
    
    firstLevelBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [firstLevelBtn setFrame:CGRectMake(40, 45, 120, 30)];
    [firstLevelBtn setTitle:@"请点击选择..." forState:UIControlStateNormal];
    firstLevelBtn.tag = 0;
    [cateScrollView addSubview:firstLevelBtn];
    [firstLevelBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    secondLevelLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 85, 100, 30)];
    [secondLevelLabel setText:@"照片类别:"];
    secondLevelLabel.backgroundColor = [UIColor clearColor];
    secondLevelLabel.textColor = [UIColor whiteColor];
    secondLevelLabel.textAlignment = NSTextAlignmentCenter;
    [cateScrollView addSubview:secondLevelLabel];
    
    secondLevelBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [secondLevelBtn setFrame:CGRectMake(40, 120, 120, 30)];
    [secondLevelBtn setTitle:@"请点击选择..." forState:UIControlStateNormal];
    [secondLevelBtn setTitle:@"" forState:UIControlStateDisabled];
    secondLevelBtn.tag = 1;
    [cateScrollView addSubview:secondLevelBtn];
    [secondLevelBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    thirdLevelLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 160, 100, 30)];
    [thirdLevelLabel setText:@"照片分类:"];
    thirdLevelLabel.backgroundColor = [UIColor clearColor];
    thirdLevelLabel.textColor = [UIColor whiteColor];
    thirdLevelLabel.textAlignment = NSTextAlignmentCenter;
    [cateScrollView addSubview:thirdLevelLabel];
    
    thirdLevelBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [thirdLevelBtn setFrame:CGRectMake(40, 195, 120, 30)];
    [thirdLevelBtn setTitle:@"请点击选择..." forState:UIControlStateNormal];
    [thirdLevelBtn setTitle:@"" forState:UIControlStateDisabled];
    thirdLevelBtn.tag = 2;
    [cateScrollView addSubview:thirdLevelBtn];
    [thirdLevelBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    fourthLevelLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 235, 100, 30)];
    [fourthLevelLabel setText:@"第四级:"];
    fourthLevelLabel.backgroundColor = [UIColor clearColor];
    fourthLevelLabel.textColor = [UIColor whiteColor];
    fourthLevelLabel.textAlignment = NSTextAlignmentCenter;
    [cateScrollView addSubview:fourthLevelLabel];
    
    fourthLevelBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [fourthLevelBtn setFrame:CGRectMake(40, 270, 120, 30)];
    [fourthLevelBtn setTitle:@"请点击选择..." forState:UIControlStateNormal];
    [fourthLevelBtn setTitle:@"" forState:UIControlStateDisabled];
    fourthLevelBtn.tag = 3;
    [cateScrollView addSubview:fourthLevelBtn];
    [fourthLevelBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    fifthLevelLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 310, 100, 30)];
    [fifthLevelLabel setText:@"第五级:"];
    fifthLevelLabel.backgroundColor = [UIColor clearColor];
    fifthLevelLabel.textColor = [UIColor whiteColor];
    fifthLevelLabel.textAlignment = NSTextAlignmentCenter;
    [cateScrollView addSubview:fifthLevelLabel];
    
    fifthLevelBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [fifthLevelBtn setTitle:@"请点击选择..." forState:UIControlStateNormal];
    [fifthLevelBtn setTitle:@"" forState:UIControlStateDisabled];
    [fifthLevelBtn setFrame:CGRectMake(40, 345, 120, 30)];
    fifthLevelBtn.tag = 4;
    [cateScrollView addSubview:fifthLevelBtn];
    [fifthLevelBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [labelList addObject:firstLevelLabel];
    [labelList addObject:secondLevelLabel];
    [labelList addObject:thirdLevelLabel];
    [labelList addObject:fourthLevelLabel];
    [labelList addObject:fifthLevelLabel];
    
    [buttonList addObject:firstLevelBtn];
    [buttonList addObject:secondLevelBtn];
    [buttonList addObject:thirdLevelBtn];
    [buttonList addObject:fourthLevelBtn];
    [buttonList addObject:fifthLevelBtn];

    [self disabledAllButton];
    
    float fullWidth = [[UIScreen mainScreen] bounds].size.height;
    float fullHeight = [[UIScreen mainScreen] bounds].size.width;
    wallViewController = [[ImageWallViewController alloc] init];
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, fullWidth, fullHeight - 20)];
    view.backgroundColor = [UIColor whiteColor];
    [wallViewController setView:view];
    [view release];
    [self.view addSubview:wallViewController.view];
    
    cateList = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    cateList.tableView.delegate = self;
    cateList.tableView.dataSource = self;
    cateList.contentSizeForViewInPopover = CGSizeMake(200, 400);
    popOver = [[UIPopoverController alloc] initWithContentViewController:cateList];
    [popOver setPopoverContentSize:CGSizeMake(200, 400) animated:YES];
}

- (void)showImageWall
{
    isLoading = false;
    [wallViewController showImages];
}

- (void)getDataFromServer:(NSNumber*)tag
{
    curPage++;
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"http://oa.hanloon.com/photo/tpo-%d-%d", [tag intValue], curPage]];
    if (secondLevelBtn.tag < 22 && secondLevelBtn.tag != 7) {
        url = [NSURL URLWithString:[[NSString stringWithFormat:@"http://oa.hanloon.com/photo/photograph/%@/%@/%d", [secondLevelBtn titleForState:UIControlStateNormal], [thirdLevelBtn titleForState:UIControlStateNormal], curPage] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
//    url = [NSURL URLWithString:@"http://192.168.3.100/test.php"];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSURLResponse* response;
    NSError* error;
    NSData* returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString* returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    NSDictionary* dict = [returnString objectFromJSONString];
    NSLog(@"%@>>>>>>%@", returnString, [url absoluteString]);
    [returnString release];
    if (![dict objectForKey:@"num"]) {
        [[Global sharedGlobal] setTotalNum:0];
        [[[Global sharedGlobal] curData] removeAllObjects];
        [self performSelectorOnMainThread:@selector(hideLoadingView) withObject:nil waitUntilDone:YES];
        [self performSelectorOnMainThread:@selector(showImageWall) withObject:nil waitUntilDone:YES];
        return;
    }
    [[Global sharedGlobal] setTotalNum:[[dict objectForKey:@"num"] intValue]];
    if ([[Global sharedGlobal] curData] == nil) {
        [[Global sharedGlobal] setCurData:[NSMutableArray arrayWithCapacity:1]];
    }
    if ([[[Global sharedGlobal] curData] count] > 0 && curPage == 1) {
        [[[Global sharedGlobal] curData] removeAllObjects];
    }
    NSArray* tempArr = [dict objectForKey:@"data"];
    for (NSDictionary* dictionary in tempArr) {
        ImageDownloadData* imageDownloadData = [[ImageDownloadData alloc] init];
        [imageDownloadData url:[NSURL URLWithString:[dictionary objectForKey:@"thumbnail"]]];
        [imageDownloadData origin:[NSURL URLWithString:[dictionary objectForKey:@"origin"]]];
        [imageDownloadData title:[dictionary objectForKey:@"name"]];
        [[[Global sharedGlobal] curData] addObject:imageDownloadData];
        [imageDownloadData release];
    }
    [self performSelectorOnMainThread:@selector(hideLoadingView) withObject:nil waitUntilDone:YES];
    if(curPage > 1){
        [self performSelectorOnMainThread:@selector(addImageWall:) withObject:[NSNumber numberWithInt:[tempArr count]] waitUntilDone:YES];
    }else{
        [self performSelectorOnMainThread:@selector(showImageWall) withObject:nil waitUntilDone:YES];
    }
}

- (void)addImageWall:(NSNumber*)num
{
    isLoading = false;
    [wallViewController addImages:[num intValue]];
    if (groupViewController != nil && [groupViewController respondsToSelector:@selector(addAditionalImage:)]) {
        [groupViewController addAditionalImage:[num intValue]];
    }
}

- (void)btnPressed:(UIButton*)sender
{
    curButton = sender;
    curTag = sender.tag;
    curList = [navigatorDataList objectForKey:[NSString stringWithFormat:@"id%d", curTag]];
    [self showPopOverTable];
    lastTag = curTag;
}

- (void)showPopOverTable
{
    [self initTableView];
    [popOver presentPopoverFromRect:curButton.bounds inView:curButton permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
}

- (void)getTPOCate:(NSNumber*)nsNum
{
    int idNum = [nsNum intValue];
    if (idNum < 22 && idNum != 7) {
        [self enabelNext:curButton];
        return;
    }
    int num = idNum;
    if (idNum == 7) {
        num = 0;
    }
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"http://oa.hanloon.com/photo/query-type-%d", num]];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSURLResponse* response;
    NSError* error;
    NSData* returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString* returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    
    if ([returnString isEqualToString:@"null"]) {
        [self getData:idNum];
        [returnString release];
        return;
    }
    NSArray* array = [returnString objectFromJSONString];
    [self performSelectorOnMainThread:@selector(queryResult:) withObject:array waitUntilDone:YES];
    [returnString release];
}

- (void)queryResult:(NSArray*)array
{
    [self enabelNext:curButton];
    
    int index = [buttonList indexOfObject:curButton];
    int idNum;
    if (index >= [buttonList count]) {
        return;
    }else{
        UIButton* btn = [buttonList objectAtIndex:index + 1];
        idNum = btn.tag;
    }
    
    NSMutableArray* tempArr = [NSMutableArray arrayWithCapacity:0];
    for (NSDictionary* dict in array) {
        NSMutableDictionary* tempDict = [NSMutableDictionary dictionaryWithCapacity:0];
        [tempDict setObject:[dict objectForKey:@"id"] forKey:@"cateId"];
        [tempDict setObject:[dict objectForKey:@"name"] forKey:@"cateName"];
        [tempArr addObject:tempDict];
    }
    [navigatorDataList setObject:tempArr forKey:[NSString stringWithFormat:@"id%d", idNum]];
}

-(BOOL) respondsToSelector:(SEL)aSelector {
    printf("SELECTOR: %s\n", [NSStringFromSelector(aSelector) UTF8String]);
    return [super respondsToSelector:aSelector];
}

- (void)enabelNext:(UIButton*)btn
{
    int index = [buttonList indexOfObject:btn] + 1;
    int parentCate = secondLevelBtn.tag;
    NSLog(@"%d>>>>>>%d", index, parentCate);
    if (parentCate == 1) {
        if (index > 2) {
            [self getData:1];
            return;
        }else{
            if (index >= [buttonList count]) {
                return;
            }
            UIButton* btn = (UIButton*)[buttonList objectAtIndex:index];
            if(btn != nil){
                btn.enabled = YES;
                [btn setTitle:@"请点击选择..." forState:UIControlStateNormal];
            }
        }
    }else if(parentCate == 7){
        if (index >= [buttonList count]) {
            return;
        }
        UIButton* btn = (UIButton*)[buttonList objectAtIndex:index];
        if(btn != nil){
            btn.enabled = YES;
            [btn setTitle:@"请点击选择..." forState:UIControlStateNormal];
        }
    }
}

- (void)disabledAllButton
{
    secondLevelBtn.enabled = NO;
    thirdLevelBtn.enabled = NO;
    fourthLevelBtn.enabled = NO;
    fifthLevelBtn.enabled = NO;
}

//- (int)getParentCate:(int)index
//{
//    NSString* btnLabel;
//    switch (index) {
//        case FIRST:{
//            btnLabel = [firstLevelBtn titleForState:UIControlStateNormal];
//            return [firstLevel indexOfObject:btnLabel];
//        }break;
//        case SECOND:{
//            btnLabel = [secondLevelBtn titleForState:UIControlStateNormal];
//            return [photoCate indexOfObject:btnLabel];
//        }break;
//        case THIRD:{
//            btnLabel = [thirdLevelBtn titleForState:UIControlStateNormal];
//            return [curList indexOfObject:btnLabel];
//        }break;
//        case FORTH:{
//            btnLabel = [fourthLevelBtn titleForState:UIControlStateNormal];
//            return [curList indexOfObject:btnLabel];
//        }break;
//        case FIFTH:{
//            btnLabel = [fifthLevelBtn titleForState:UIControlStateNormal];
//            return [curList indexOfObject:btnLabel];
//        }break;
//        default:
//            break;
//    }
//    return -1;
//}

- (void)initTableView
{
    [cateList.tableView reloadData];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:CellIdentifier] autorelease];
    }

	cell.textLabel.text = [[curList objectAtIndex:indexPath.row] objectForKey:@"cateName"];
    
    if ([cell.textLabel.text isEqualToString:[curButton titleForState:UIControlStateNormal]]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return curList.count;
}

- (void)disabledButtonAfter
{
    int index = [buttonList indexOfObject:curButton];
    for (int i = index + 1; i < [buttonList count]; i++) {
        UIButton* btn = [buttonList objectAtIndex:i];
        btn.enabled = NO;
        [btn setTitle:[btn titleForState:UIControlStateDisabled] forState:UIControlStateNormal];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [curButton setTitle:[[curList objectAtIndex:indexPath.row] objectForKey:@"cateName"] forState:UIControlStateNormal];
    [popOver dismissPopoverAnimated:YES];
    [self disabledButtonAfter];
    [self setNextButtonTag:[[[curList objectAtIndex:indexPath.row] objectForKey:@"cateId"] intValue] button:curButton];
}

- (void)setNextButtonTag:(int)tag button:(UIButton*)btn
{
    int index = [buttonList indexOfObject:btn];
    if (index < [buttonList count] - 1) {
        UIButton* button = [buttonList objectAtIndex:index + 1];
        button.tag = tag;
        [self performSelectorInBackground:@selector(getTPOCate:) withObject:[NSNumber numberWithInt:tag]];
    }else{
        [self getData:tag];
    }
}

- (void)getNextPage
{
    [self imageWallBack];
    if (isLoading) {
        return;
    }
    isLoading = true;
    [self performSelectorInBackground:@selector(getDataFromServer:) withObject:[NSNumber numberWithInt:curCateTag]];
}

- (void)getData:(int)tag
{
    [self showLoadingView];
    [self imageWallBack];
    curPage = 0;
    [[Loader sharedLoader] stopLoad];
    curCateTag = tag;
    isLoading = true;
    [self performSelectorInBackground:@selector(getDataFromServer:) withObject:[NSNumber numberWithInt:tag]];
}

- (void)showImageInWall:(ImageDownloadData *)data
{
    if (wallViewController != nil) {
        [wallViewController showImagesUnadded:data];
    }
}

- (void)hideLoadingView
{
    [self.view setUserInteractionEnabled:YES];
    [loadingView removeFromSuperview];
}

- (void)showLoadingView
{
    [self.view setUserInteractionEnabled:NO];
    if (loadingView == nil) {
        loadingView = [[LoadingView alloc] initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.height - 80) / 2, ([[UIScreen mainScreen] bounds].size.width - 80) / 2, 80, 80)];
    }
    [self.view addSubview:loadingView];
}

- (void)imageWallBack
{
    if (wallViewController.view.frame.origin.x <= 0) {
        return;
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [wallViewController.view setFrame:CGRectMake(0, 0, wallViewController.view.frame.size.width, wallViewController.view.frame.size.height)];
    [UIView commitAnimations];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

- (void)dealloc
{
//    [firstLevel release];
//    [photoCate release];
//    [photoChildCate release];
//    [photoCateLabel release];
//    [tpoCateLabel release];
    
    [super dealloc];
}

@end
