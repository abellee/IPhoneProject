//
//  EditableUITableViewCellDefinition.h
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#ifndef MovingTribal_EditableUITableViewCellDefinition_h
#define MovingTribal_EditableUITableViewCellDefinition_h

typedef enum{
	kTextField,
	kButton,
	kImage,
	kSwitch,
	kNormal,
	kCheck,
    kView,
    kLabel,
    kCustom
}EditableUITableViewCellType;

#define kEditableUITableViewCell @"EditableUITableViewCell"

#define kSectionTitle            @"SectionTitle"
#define kSectionData             @"SectionData"
#define kSectionFooterView       @"SectionFooterView"

#endif
