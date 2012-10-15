//
//  EditableUITableViewData.m
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "EditableUITableViewData.h"

@implementation EditableUITableViewData

@synthesize data;

- (void)dealloc
{
    NSLog(@"******| EditableUITableViewData |****** receive dealloc message!");
    [data release];
	data = nil;
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (EditableUITableViewCellData *)getDataByIndexPath:(NSIndexPath *)indexPath
{
    if(data && [data count]){
		NSArray *tempArr = [[data objectAtIndex:indexPath.section] objectForKey:kSectionData];
		EditableUITableViewCellData *cellData = [tempArr objectAtIndex:indexPath.row];
		return cellData;
	}
	return nil;
}

- (NSString *)getSectionTitleBySection:(NSInteger)section
{
	if(data && [data count] && section < [data count])
		return [[data objectAtIndex:section] objectForKey:kSectionTitle];
	return nil;
}

- (NSUInteger)numberOfRowInSection:(NSInteger)section
{
	if(data && [data count] && section < [data count])
		return [[[data objectAtIndex:section] objectForKey:kSectionData] count];
	return 0;
}

- (UIView *)viewForFooterInSection:(NSInteger)section
{
	if(data && [data count] && section < [data count])
		return [[data objectAtIndex:section] objectForKey:kSectionFooterView];
	return nil;
}

@end
