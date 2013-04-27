//
//  UserAction.h
//  PocketPet
//
//  Created by Lee Abel on 13-4-26.
//
//

#import <Foundation/Foundation.h>

@class FileManager;
@interface UserAction : NSObject
{
    FileManager* fileManager;
}

- (void)userOperation:(int)code;
- (void)userOperation:(int)code andInfo:(NSString*)info;

@end
