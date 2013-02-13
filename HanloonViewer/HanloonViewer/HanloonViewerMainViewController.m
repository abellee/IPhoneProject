//
//  HanloonViewerMainViewController.m
//  HanloonViewer
//
//  Created by Abel Lee on 13-2-12.
//  Copyright (c) 2013年 Abel Lee. All rights reserved.
//

#import "HanloonViewerMainViewController.h"

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
}

- (void) initView
{
    firstLevel = [[NSArray alloc] initWithObjects:@"拍照照片", @"TPO照片", nil];
    photoCate = [[NSArray alloc] initWithObjects:@"西装照片", @"女装照片", @"衬衫照片", @"维修照片", @"退赔照片", nil];
    NSArray* arr0 = [NSArray arrayWithObjects:@"量身", @"试衣", @"成衣", @"参考图", nil];
    NSArray* arr1 = [NSArray arrayWithObjects:@"量身", @"试衣", @"成衣", @"参考图", @"尺寸单上传", nil];
    NSArray* arr2 = [NSArray arrayWithObjects:@"量身", @"试衣", @"成衣", @"参考图", nil];
    NSArray* arr3 = [NSArray arrayWithObjects:@"维修单上传", @"维修衣服照片", nil];
    NSArray* arr4 = [NSArray arrayWithObjects:@"退赔衣服照片", nil];
    photoChildCate = [[NSArray alloc] initWithObjects:arr0, arr1, arr2, arr3, arr4, nil];
    
    photoCateLabel= [[NSArray alloc] initWithObjects:@"照片分类", @"照片类别", nil];
    tpoCateLabel = [[NSArray alloc] initWithObjects:@"tpo照片分类", @"tpo照片类别", @"tpo照片颜色", nil];
    
    lastTag = -1;
    
    [self initCateChoose];
}

- (void) initCateChoose
{
    firstLevelLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [firstLevelLabel setText:@"照片类型:"];
    [self.view addSubview:firstLevelLabel];
    firstLevelBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [firstLevelBtn setFrame:CGRectMake(90, 0, 120, 30)];
    [firstLevelBtn setTitle:@"选择照片类型" forState:UIControlStateNormal];
    firstLevelBtn.tag = 0;
    [self.view addSubview:firstLevelBtn];
    [firstLevelBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnPressed:(UIButton*)sender
{
    curButton = sender;
    switch (sender.tag) {
        case 0:
            curTag = sender.tag;
            [self showFirstLevel];
            lastTag = curTag;
            break;
        case 1:
            curTag = sender.tag;
            
            lastTag = curTag;
            break;
        default:
            break;
    }
}

- (void) showFirstLevel
{
    curList = firstLevel;
    [self initTableView];
    [popOver presentPopoverFromRect:curButton.bounds inView:curButton permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

- (void)initTableView
{
    if (curTag != lastTag) {
        if (cateList != nil) {
            [cateList release];
            cateList = nil;
        }
        cateList = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
        cateList.tableView.delegate = self;
        cateList.tableView.dataSource = self;
        cateList.contentSizeForViewInPopover = CGSizeMake(200, 400);
        if (popOver != nil) {
            [popOver release];
            popOver = nil;
        }
        popOver = [[UIPopoverController alloc] initWithContentViewController:cateList];
        [popOver setPopoverContentSize:CGSizeMake(200, 400) animated:YES];
    }
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

	cell.textLabel.text = [curList objectAtIndex:indexPath.row];
    
    if ([[curList objectAtIndex:indexPath.row] isEqualToString:[curButton titleForState:UIControlStateNormal]]) {
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [curButton setTitle:[curList objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    [popOver dismissPopoverAnimated:YES];
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
    return toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight;
}

- (void)dealloc
{
    [firstLevel release];
    [photoCate release];
    [photoChildCate release];
    [photoCateLabel release];
    [tpoCateLabel release];
    
    [super dealloc];
}

@end
