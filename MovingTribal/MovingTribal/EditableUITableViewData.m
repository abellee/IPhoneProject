//
//  EditableUITableViewData.m
//  MovingTribal
//
//  Created by Lee Abel on 9/18/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "EditableUITableViewData.h"

@implementation EditableUITableViewData

@synthesize data;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    NSLog(@"******| EditableUITableViewData |****** receive dealloc message!");
    [data release];
    [super dealloc];
}

- (void)data:(NSArray *)arrData
{
    if(arrData != data){
        NSArray* tempData = data;
        data = [arrData copy];
        [tempData release];
    }
}

- (NSArray *)data
{
    return data;
}

- (EditableUITableCellData *)getDataBySectionAndRow:(NSInteger)section row:(NSInteger)row
{
    NSArray* tempArr = [data objectAtIndex:section];
    EditableUITableCellData* cellData = [tempArr objectAtIndex:row];
    return cellData;
}

@end
