//
//  EditableUITableViewData.h
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//
//  usage: 最外层的NSArray的索引即为section，kSectionData中的索引为row, kSectionTitle为sectionTitle，如果没有则为@“”
//	NSArray[NSDictionary{kSectionTitle:@"...", kSectionData:NSArray[...]},
//	NSDictionary{kSectionTitle:@"...", kSectionData:NSArray[...]},
//	NSDictionary{kSectionTitle:@"...", kSectionData:NSArray[...]}]
//

#import <Foundation/Foundation.h>
#import "EditableUITableViewCellData.h"

@interface EditableUITableViewData : NSObject

@property (nonatomic, retain) NSArray *data;

- (EditableUITableViewCellData *)getDataByIndexPath:(NSIndexPath *)indexPath;
- (NSString *)getSectionTitleBySection:(NSInteger)section;
- (NSUInteger)numberOfRowInSection:(NSInteger)section;
- (UIView *)viewForFooterInSection:(NSInteger)section;

@end
