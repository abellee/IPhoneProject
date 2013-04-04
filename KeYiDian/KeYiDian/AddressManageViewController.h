//
//  AddressManageViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "KYDBaseViewController.h"

@class AddressCardViewController;
@interface AddressManageViewController : KYDBaseViewController<UIScrollViewDelegate>
{
    UIScrollView* mainScrollView;
}

- (void)startModify;

@end
