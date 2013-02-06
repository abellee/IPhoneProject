//
//  PlayerData.h
//  YiZu
//
//  Created by Abel Lee on 12-6-28.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Character.h"

@interface PlayerData : Character{
    NSString* telephone;
    
    NSMutableArray* allTasks;
    NSMutableArray* doneTask;
    NSMutableArray* doingTask;
    
    int bag_num;
    int bid;
}

@property (nonatomic, retain, getter = telephone, setter = telephone:) NSString* telephone;

@property (nonatomic, retain) NSMutableArray* allTasks;
@property (nonatomic, retain) NSMutableArray* doneTask;
@property (nonatomic, retain) NSMutableArray* doingTask;

@property (nonatomic, assign, getter = bag_num, setter = bag_num:) int bag_num;
@property (nonatomic, assign, getter = bid, setter = bid:) int bid;

@end
