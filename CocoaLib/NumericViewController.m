//
//  NumericViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-3.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "NumericViewController.h"

@interface NumericViewController ()

@end

@implementation NumericViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)rect andMinNum:(int)min andCurrentNum:(int)current andMaxNum:(int)max
{
    if (self = [super init]) {
        [self.view setFrame:rect];
        [self.view setBounds:CGRectMake(0, 0, rect.size.width, rect.size.height)];
        self.view.clipsToBounds = YES;
        minNum = min;
        curNum = current;
        maxNum = max;
        
        labelsArray = [[NSMutableArray alloc] initWithCapacity:0];
        
        [self.view setBackgroundColor:[UIColor redColor]];
        
        UILabel* curNumLabel;
        UILabel* prevNumLabel;
        UILabel* nextNumLabel;
        
        curNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
        [curNumLabel setText:[NSString stringWithFormat:@"%d", curNum]];
        [curNumLabel setBackgroundColor:[UIColor clearColor]];
        curNumLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:curNumLabel];
        [labelsArray addObject:curNumLabel];
        
        prevNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, -curNumLabel.frame.size.height, curNumLabel.frame.size.width, curNumLabel.frame.size.height)];
        [prevNumLabel setBackgroundColor:[UIColor clearColor]];
        prevNumLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:prevNumLabel];
        [labelsArray insertObject:prevNumLabel atIndex:0];
        
        nextNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, curNumLabel.frame.size.height, curNumLabel.frame.size.width, curNumLabel.frame.size.height)];
        [nextNumLabel setBackgroundColor:[UIColor clearColor]];
        nextNumLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:nextNumLabel];
        [labelsArray addObject:nextNumLabel];
        
        if (curNum - 1 >= minNum) {
            [prevNumLabel setText:[NSString stringWithFormat:@"%d", curNum - 1]];
        }
        
        if(curNum + 1 <= maxNum){
            [nextNumLabel setText:[NSString stringWithFormat:@"%d", curNum + 1]];
        }
    }
    return self;
}

- (void)setFont:(UIFont *)font withColor:(UIColor *)color
{
    for (UILabel* label in labelsArray) {
        [label setFont:font];
        [label setTextColor:color];
    }
}

- (void)setPrevNum
{
    if (curNum - 1 >= minNum && [labelsArray count] > 1) {
        [[labelsArray objectAtIndex:0] setText:[NSString stringWithFormat:@"%d", curNum - 1]];
    }
}

- (void)setNextNum
{
    if(curNum + 1 <= maxNum && [labelsArray count] > 1){
        [[labelsArray objectAtIndex:[labelsArray count] - 1] setText:[NSString stringWithFormat:@"%d", curNum + 1]];
    }
}

- (void)sub
{
    if (curNum - 1 >= minNum && !isAnimation) {
        UILabel* prevNumLabel = [labelsArray objectAtIndex:0];
        curNum--;
        [prevNumLabel setText:[NSString stringWithFormat:@"%d", curNum]];
        
        isAnimation = YES;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(prevNumLabelAnimationStopped)];
        [prevNumLabel setFrame:CGRectMake(0, 0, prevNumLabel.frame.size.width, prevNumLabel.frame.size.height)];
        [UIView commitAnimations];
        
        [self removeCurNumLabelAnimate:prevNumLabel.frame.size.height];
    }
}

- (void)removeCurNumLabelAnimate:(float)ypos
{
    UILabel* curNumLabel = [labelsArray objectAtIndex:1];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [curNumLabel setFrame:CGRectMake(0, ypos, curNumLabel.frame.size.width, curNumLabel.frame.size.height)];
    [UIView commitAnimations];
}

- (void)prevNumLabelAnimationStopped
{
    isAnimation = NO;
    UILabel* label = [labelsArray objectAtIndex:2];
    [labelsArray removeObjectAtIndex:2];
    [labelsArray insertObject:label atIndex:0];
    [label setFrame:CGRectMake(0, -label.frame.size.height, label.frame.size.width, label.frame.size.height)];
    [self setPrevNum];
    [self setNextNum];
}

- (void)add
{
    if (curNum + 1 <= maxNum && !isAnimation) {
        UILabel* nextNumLabel = [labelsArray objectAtIndex:2];
        curNum++;
        [nextNumLabel setText:[NSString stringWithFormat:@"%d", curNum]];
        
        isAnimation = YES;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(nextNumLabelAnimationStopped)];
        [nextNumLabel setFrame:CGRectMake(0, 0, nextNumLabel.frame.size.width, nextNumLabel.frame.size.height)];
        [UIView commitAnimations];
        
        [self removeCurNumLabelAnimate:-nextNumLabel.frame.size.height];
    }
}

- (void)nextNumLabelAnimationStopped
{
    isAnimation = NO;
    UILabel* label = [labelsArray objectAtIndex:0];
    [labelsArray removeObjectAtIndex:0];
    [labelsArray addObject:label];
    [label setFrame:CGRectMake(0, label.frame.size.height, label.frame.size.width, label.frame.size.height)];
    [self setPrevNum];
    [self setNextNum];
}

- (void)setNum:(int)num
{
    curNum = num;
    [[labelsArray objectAtIndex:1] setText:[NSString stringWithFormat:@"%d", curNum]];
    [self setPrevNum];
    [self setNextNum];
}

- (void)setBackground:(UIColor *)color
{
    for (UILabel* label in labelsArray) {
        [label setBackgroundColor:color];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
