//
//  AddressCell.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "AddressCell.h"
#import "Utility.h"
#import "TouchableUILabel.h"

@implementation AddressCell

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withText:(NSString *)text withValue:(NSString *)value andParentController:(AddressManageViewController *)parentController
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        addressManager = parentController;
        CGSize textLabelSize = [Utility getCGSizeWithFontSize:16.0 str:text isBold:YES];
        textLabel = [[UILabel alloc] initWithFrame:CGRectMake(13, 15, textLabelSize.width, textLabelSize.height)];
        textLabel.backgroundColor = [UIColor clearColor];
        [textLabel setText:text];
        [textLabel setTextColor:[UIColor grayColor]];
        [textLabel setFont:[UIFont boldSystemFontOfSize:16.0]];
        [self addSubview:textLabel];
        
        CGFloat valueLabelHeight = [Utility getTextHeightWithString:value constrainedToSize:CGSizeMake(170, 10000.0) fontSize:16.0 withMinHeight:20.0];
        valueLabel = [[TouchableUILabel alloc] initWithFrame:CGRectMake(textLabel.frame.origin.x + textLabel.frame.size.width + 10, 15, 170, valueLabelHeight)];
        valueLabel.delegate = self;
        valueLabel.backgroundColor = [UIColor clearColor];
        [valueLabel setText:value];
        [valueLabel setTextColor:[UIColor grayColor]];
        [valueLabel setFont:[UIFont boldSystemFontOfSize:16.0]];
        valueLabel.numberOfLines = 0;
        valueLabel.lineBreakMode = UILineBreakModeWordWrap;
        [self addSubview:valueLabel];
    }
    return self;
}

- (void)labelPressed:(id)sender
{
    NSLog(@"hello");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
