//
//  NSString+Extension.m
//  PocketPet
//
//  Created by Lee Abel on 13-4-18.
//
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

+ (NSString*)getPathStringWithFileName:(NSString *)fileName withExtension:(NSString *)extension
{
    return [[NSBundle mainBundle] pathForResource:fileName ofType:extension];
}

@end
