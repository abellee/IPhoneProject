//
//  CateData.h
//  HanloonViewer
//
//  Created by Lee Abel on 13-2-17.
//  Copyright (c) 2013年 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CateData : NSObject{
    int cateId;
    NSString* cateName;
}

@property (nonatomic, assign) int cateId;
@property (nonatomic, retain) NSString* cateName;

@end
