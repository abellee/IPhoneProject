//
//  EditableUITableViewData.h
//  MovingTribal
//
//  Created by Lee Abel on 9/18/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EditableUITableCellData.h"

@interface EditableUITableViewData : NSObject{
    NSArray* data;
}

@property (nonatomic, assign, getter = data, setter = data:) NSArray* data;

- (EditableUITableCellData *)getDataBySectionAndRow:(NSInteger)section row:(NSInteger)row;

@end
